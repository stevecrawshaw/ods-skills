"""Build a WECA report from the official Word template (.dotx).

The template is a menu, not a blank document: 6 cover variants (green / claret /
purple, each with or without a photo), 3 sample body pages (lorem ipsum plus an
internal database screenshot) and 3 back covers. `WecaReport` keeps one cover
and its matching back cover, deletes the sample body, and gives you
style-correct helpers for new content.

Element indices below are tied to the shipped template; `_check_template`
fails loudly if the template changes.

Usage:
    uv run --with python-docx python scripts/weca_docx.py   # writes demo
    from weca_docx import WecaReport
    r = WecaReport(cover="green", photo=True,
                   title="Bus Service Improvement Plan", date="September 2026")
    r.heading("1. Introduction")
    r.para("Body text...")
    r.bullets(["one", "two"])
    r.table([["Area", "2024"], ["Bath", "12"]])
    r.save("report.docx")
"""

from __future__ import annotations

import copy
import io
import zipfile
from pathlib import Path

from docx import Document
from docx.document import Document as DocxDocument
from docx.oxml.ns import qn

TEMPLATE = (
    Path(__file__).resolve().parent.parent
    / "reference"
    / "WestofEngland-Combined-MayoralAuthority-Word-Report.dotx"
)

# Body-element index ranges (inclusive) in the shipped template.
COVERS: dict[tuple[str, bool], range] = {
    ("green", True): range(0, 2),
    ("green", False): range(2, 5),
    ("claret", True): range(5, 7),
    ("claret", False): range(7, 9),
    ("purple", True): range(9, 10),
    ("purple", False): range(10, 19),
}
SAMPLE_BODY = range(19, 49)  # "1. Lorem Ipsum" .. last body section break
BODY_END = 30  # paragraph holding section 1's sectPr; new content goes before it
BACK_COVERS: dict[str, range] = {
    "green": range(49, 53),
    "purple": range(53, 55),
    "claret": range(55, 65),
}
BACK_SECT = 49  # sectPr paragraph that starts the back-cover page
PLACEHOLDER_TITLE = "Title of document goes here"
PLACEHOLDER_DATE = "29 January 2025"


def open_template(path: Path = TEMPLATE) -> DocxDocument:
    """python-docx refuses .dotx; relabel the main part as a document in memory."""
    buf = io.BytesIO()
    with zipfile.ZipFile(path) as zin, zipfile.ZipFile(buf, "w", zipfile.ZIP_DEFLATED) as zout:
        for item in zin.infolist():
            data = zin.read(item.filename)
            if item.filename == "[Content_Types].xml":
                data = data.replace(
                    b"wordprocessingml.template.main+xml",
                    b"wordprocessingml.document.main+xml",
                )
            zout.writestr(item, data)
    buf.seek(0)
    return Document(buf)


def _text(el) -> str:
    return "".join(t.text or "" for t in el.iter(qn("w:t")))


def _has_sectpr(el) -> bool:
    return el.find(".//" + qn("w:sectPr")) is not None


def _check_template(body: list) -> None:
    assert _text(body[19]).strip() == "1. Lorem Ipsum", "template layout changed"
    assert _has_sectpr(body[BODY_END]), "template layout changed"
    assert body[34].tag == qn("w:tbl"), "template layout changed"


class WecaReport:
    def __init__(
        self,
        cover: str = "green",
        photo: bool = True,
        title: str = "",
        date: str = "",
        template: Path = TEMPLATE,
    ) -> None:
        if (cover, photo) not in COVERS:
            raise ValueError(f"cover must be green, claret or purple, got {cover!r}")
        self.doc = open_template(template)
        body = list(self.doc.element.body)
        _check_template(body)

        # Prototypes for new content, captured before the sample body goes.
        self._p_heading = copy.deepcopy(body[19])
        self._p_subheading = copy.deepcopy(body[21])
        self._p_normal = copy.deepcopy(body[20])
        self._p_bullet = copy.deepcopy(body[25])
        self._tbl = copy.deepcopy(body[34])
        self._anchor = body[BODY_END]

        # Back-cover shapes are anchored to their paragraph at -1in, so they must
        # sit in the first paragraph of the page (BACK_SECT) or the page header
        # peeks out above them. Move the chosen back cover's shapes there.
        back = list(BACK_COVERS[cover])
        if back[0] != BACK_SECT:
            src, dst = body[back[0]], body[BACK_SECT]
            for child in list(dst):
                if child.tag != qn("w:pPr"):
                    dst.remove(child)
            for child in list(src):
                if child.tag != qn("w:pPr"):
                    dst.append(child)
            back = back[1:]
        # A page break on the last back-cover paragraph makes a blank final page.
        for br in body[back[-1]].iter(qn("w:br")) if back else []:
            if br.get(qn("w:type")) == "page":
                br.getparent().remove(br)

        keep = set(COVERS[(cover, photo)]) | set(back) | {BODY_END, BACK_SECT}
        drop = set(range(len(body) - 1)) - keep  # last element is the final sectPr
        for i in sorted(drop):
            el = body[i]
            if _has_sectpr(el):
                # Keep section breaks (they carry headers/footers); strip content.
                for child in list(el):
                    if child.tag != qn("w:pPr"):
                        el.remove(child)
            else:
                el.getparent().remove(el)
        # BODY_END itself holds a stray empty run; clear it so no blank line leads.
        for child in list(self._anchor):
            if child.tag != qn("w:pPr"):
                self._anchor.remove(child)

        for t in self.doc.element.body.iter(qn("w:t")):
            if t.text == PLACEHOLDER_TITLE and title:
                t.text = title
            elif t.text == PLACEHOLDER_DATE and date:
                t.text = date

    # -- content helpers --------------------------------------------------
    def _insert(self, el) -> None:
        self._anchor.addprevious(el)

    def _para_from(self, proto, text: str):
        p = copy.deepcopy(proto)
        runs = p.findall(qn("w:r"))
        for r in runs[1:]:
            p.remove(r)
        for child in list(p):
            if child.tag not in (qn("w:pPr"), qn("w:r")):
                p.remove(child)
        if not runs:
            runs = [p.makeelement(qn("w:r"), {})]
            p.append(runs[0])
        if runs:
            r = runs[0]
            for child in list(r):
                if child.tag != qn("w:rPr"):
                    r.remove(child)
            t = r.makeelement(qn("w:t"), {})
            t.text = text
            t.set("{http://www.w3.org/XML/1998/namespace}space", "preserve")
            r.append(t)
        return p

    def heading(self, text: str) -> None:
        """Section heading: template's Heading 3 (Forest Green, numbered by you)."""
        self._insert(self._para_from(self._p_heading, text))

    def subheading(self, text: str) -> None:
        """Heading 4: black bold subheading."""
        self._insert(self._para_from(self._p_subheading, text))

    def para(self, text: str) -> None:
        self._insert(self._para_from(self._p_normal, text))

    def bullets(self, items: list[str]) -> None:
        for item in items:
            self._insert(self._para_from(self._p_bullet, item))

    def page_break(self) -> None:
        p = self._p_normal.makeelement(qn("w:p"), {})
        r = p.makeelement(qn("w:r"), {})
        br = r.makeelement(qn("w:br"), {qn("w:type"): "page"})
        r.append(br)
        p.append(r)
        self._insert(p)

    def table(self, rows: list[list[str]]) -> None:
        """First row is the header (Forest Green band); later rows alternate shading."""
        if len(rows) < 2:
            raise ValueError("table needs a header row and at least one data row")
        ncols = len(rows[0])
        tbl = copy.deepcopy(self._tbl)
        # The sample table floats (tblpPr); make it inline so it follows the text.
        for fp in tbl.iter(qn("w:tblpPr")):
            fp.getparent().remove(fp)
        protos = tbl.findall(qn("w:tr"))
        header, odd, even = protos[0], protos[1], protos[2]
        for tr in protos:
            tbl.remove(tr)
        grid = tbl.find(qn("w:tblGrid"))
        cols = grid.findall(qn("w:gridCol"))
        total = sum(int(c.get(qn("w:w"))) for c in cols)
        for c in cols:
            grid.remove(c)
        # First column wider for row labels, as in the template.
        first = total * 0.25 if ncols > 2 else total / ncols
        rest = (total - first) / max(ncols - 1, 1)
        widths = [int(first)] + [int(rest)] * (ncols - 1)
        for w in widths:
            grid.append(grid.makeelement(qn("w:gridCol"), {qn("w:w"): str(w)}))

        for i, values in enumerate(rows):
            proto = header if i == 0 else (odd if i % 2 else even)
            tr = copy.deepcopy(proto)
            cells = tr.findall(qn("w:tc"))
            label_cell, data_cell = cells[0], cells[-1]
            for tc in cells:
                tr.remove(tc)
            for j, value in enumerate(values):
                # Header label cell in the sample is empty (no white run format),
                # so build every header cell from a data cell.
                use_label = j == 0 and i > 0
                tc = copy.deepcopy(label_cell if use_label else data_cell)
                tcw = tc.find(qn("w:tcPr") + "/" + qn("w:tcW"))
                if tcw is not None:
                    tcw.set(qn("w:w"), str(widths[j]))
                    tcw.set(qn("w:type"), "dxa")
                ps = tc.findall(qn("w:p"))
                for extra in ps[1:]:
                    tc.remove(extra)
                tc.replace(ps[0], self._para_from(ps[0], str(value)))
                tr.append(tc)
            tbl.append(tr)
        self._insert(tbl)
        self.para("")

    def save(self, path: str | Path) -> None:
        self.doc.save(str(path))


if __name__ == "__main__":
    r = WecaReport(cover="purple", photo=False, title="Demo report", date="September 2026")
    r.heading("1. Introduction")
    r.para("This report was generated from the WECA Word template.")
    r.subheading("Key points")
    r.bullets(["Covers and back cover match", "Sample body removed"])
    r.heading("2. Data")
    r.table([["Area", "2023", "2024"], ["Bath and North East Somerset", "10", "12"],
             ["Bristol", "30", "33"], ["South Gloucestershire", "18", "19"]])
    r.save("weca_report_demo.docx")
    print("wrote weca_report_demo.docx")
