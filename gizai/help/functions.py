from typing import List

from blue_options.terminal import show_usage, xtra
from abcli.help.generic import help_functions as generic_help_functions
from abcli.help.latex import build_options as latex_build_options

from gizai import ALIAS


def help_build(
    tokens: List[str],
    mono: bool,
) -> str:
    options = xtra(
        "~build,~download,dryrun,increment_version,~publish,~upload", mono=mono
    )

    return show_usage(
        [
            "giza",
            "build",
            f"[{options}]",
            f"[{latex_build_options(mono=mono)}]",
        ],
        "build giza.pdf.",
        mono=mono,
    )


def help_open_pdf(
    tokens: List[str],
    mono: bool,
) -> str:
    options = xtra("~download,dryrun,pdf=<giza>", mono=mono)

    return show_usage(
        [
            "giza",
            "open | open_pdf",
            f"[{options}]",
        ],
        "open giza.pdf.",
        mono=mono,
    )


help_functions = generic_help_functions(plugin_name=ALIAS)

help_functions.update(
    {
        "build": help_build,
        "open_pdf": help_open_pdf,
    }
)
