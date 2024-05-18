from functools import reduce
import re
from abcli.plugins import list_of_external
from abcli import file
from gizai.logger import logger


def digest(
    input_filename,
    output_filename,
    list_of_applications,
):
    if list_of_applications == "all":
        list_of_applications = ["abcli"] + list_of_external()
    list_of_applications = [application.lower() for application in list_of_applications]

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
    usage = [
        re.sub(
            r"--\w+\s((\w|,)+|<(\w|,)+>)",
            "",
            line.replace("\\\t", ""),
        )
        for line in usage_
    ]
    logger.info(f"digesting {len(usage)} line(s) of usage.")

    usage = [
        line
        for line in usage
        if reduce(
            lambda x, y: x or y,
            [line.startswith(application) for application in list_of_applications],
            False,
        )
    ]
    logger.info(f"digesting {len(usage)} line(s) of usage of the listed applications.")

    # remove options and args
    usage = [
        " ".join(
            [
                keyword
                for keyword in line.split(" ")
                if keyword
                and not reduce(
                    lambda x, y: x or y,
                    [char in keyword for char in '<>.[]"/*=,!|+~-'],
                    False,
                )
            ]
        )
        for line in usage
    ]

    nodes = sorted(
        [
            node
            for node in set(
                reduce(lambda x, y: x + y, [line.split(" ") for line in usage], [])
            )
            if node
        ]
    )
    logger.info(f"{len(nodes)} node(s).")

    usage = [[node for node in line.split(" ") if node] for line in usage]

    edges = reduce(
        lambda x, y: x + y,
        [
            [
                (node_1, node_2)
                for node_1, node_2 in zip(
                    line[:-1],
                    line[1:],
                )
            ]
            for line in usage
        ],
        [],
    )
    logger.info(f"{len(edges)} edge(s).")

    graph = (
        [
            "digraph Tree {",
            "    node [shape=circle];",
        ]
        + [f"    {node};" for node in nodes]
        + [f"    {node_1} -> {node_2};" for node_1, node_2 in edges]
        + [
            "}",
        ]
    )

    return file.save_text(output_filename, graph)
