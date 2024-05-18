from gizai import VERSION
from abcli import file
from gizai.logger import logger


def build(filename: str) -> bool:
    logger.info(f"build({VERSION}): {filename}")

    return file.save_text(
        filename,
        ["\\newcommand{\\revision}{" + VERSION + "}"],
    )
