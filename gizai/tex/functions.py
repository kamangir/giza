from gizai import VERSION
from abcli import file


def build(filename: str) -> bool:
    return file.save_text(
        filename,
        ["\\newcommand{\\revision}{" + VERSION + "}"],
        log=True,
    )
