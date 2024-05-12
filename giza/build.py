import os
from giza import VERSION
from abcli import file
from giza.logger import logger


def build(filename: str) -> bool:
    logger.info(f"build({VERSION}): {filename}")

    return file.save_text(
        filename,
        ["\\newcommand{\\revision}{" + VERSION + "}"],
    )
