import argparse
from typing import Tuple


def main(
    NAME: str,
    VERSION: str,
    DESCRIPTION: str,
    ICON: str,
) -> Tuple[bool, str]:
    parser = argparse.ArgumentParser(NAME, description=f"{NAME}-{VERSION}")
    parser.add_argument(
        "task",
        type=str,
        help="version",
    )
    parser.add_argument(
        "--show_description",
        type=int,
        default=0,
        help="0|1",
    )
    parser.add_argument(
        "--show_icon",
        type=int,
        default=0,
        help="0|1",
    )
    args = parser.parse_args()

    success = False
    if args.task == "version":
        print(
            "{}{}-{}{}".format(
                f"{ICON} " if args.show_icon else "",
                NAME,
                VERSION,
                "\\n{}".format(DESCRIPTION) if args.show_description else "",
            )
        )
        success = True
    else:
        return False, f"-{NAME}: {args.task}: command not found."

    return success, "" if success else f"-{NAME}: {args.task}: failed."
