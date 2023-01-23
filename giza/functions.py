import os
from tqdm import tqdm
from . import NAME
from abcli.plugins import list_of_external
from abcli import file
from abcli import logging
import logging

logger = logging.getLogger(__name__)


def digest(
    input_filename,
    output_filename,
    list_of_applications,
):
    if list_of_applications == "all":
        list_of_applications = ["abcli"] + list_of_external()

    logger.info(
        "digesting {} application(s): {} -> {}: {}".format(
            len(list_of_applications),
            input_filename,
            output_filename,
            ", ".join(list_of_applications),
        )
    )

    success, usage = file.load_text(input_filename)
    if not success:
        return False
    logger.info(f"digesting {len(usage)} line(s) of usage description.")

    usage = [
        line.replace("\x1b[1;96m", "").replace("\x1b[0m", "")
        for line in usage
        if not line.startswith("\x1b[0;36m .")
    ]
    logger.info(f"digesting {len(usage)} line(s) of usage help.")

    usage_ = []
    for line in usage:
        if line.startswith("\t"):
            usage_ = usage_[:-1] + [usage_[-1] + line]
        else:
            usage_ += [line]
    usage = [line.replace("\\\t", "") for line in usage_]
    logger.info(f"digesting {len(usage)} line(s) of usage.")

    # TODO: filter for wanted applications.

    # TODO: remove descriptions.

    # TODO: generate a graph.

    print(usage)

    graph = []

    return file.save_text(output_filename, graph)
