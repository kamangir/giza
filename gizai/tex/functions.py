from blue_objects import file
from gizai import VERSION


def build(filename: str) -> bool:
    return file.save_text(
        filename,
        ["\\newcommand{\\revision}{" + VERSION + "}"],
        log=True,
    )
