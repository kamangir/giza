import argparse
from gizai import NAME, VERSION, DESCRIPTION
from gizai.build import build
from gizai.digest import digest
from gizai.logger import logger


parser = argparse.ArgumentParser(NAME, description=f"{NAME}-{VERSION}")
parser.add_argument(
    "task",
    type=str,
    help="build|digest|version",
)
parser.add_argument(
    "--input_filename",
    type=str,
)
parser.add_argument(
    "--output_filename",
    type=str,
)
parser.add_argument(
    "--list_of_applications",
    help="<application-1+application-2>|all",
    type=str,
)
parser.add_argument(
    "--show_description",
    type=bool,
    default=0,
    help="0|1",
)
args = parser.parse_args()

success = False
if args.task == "build":
    success = build(args.output_filename)
elif args.task == "digest":
    success = digest(
        args.input_filename,
        args.output_filename,
        args.list_of_applications,
    )
elif args.task == "version":
    print(
        "{}-{}{}".format(
            NAME,
            VERSION,
            "\\n{}".format(DESCRIPTION) if args.show_description else "",
        )
    )
    success = True
else:
    logger.error(f"-{NAME}: {args.task}: command not found.")

if not success:
    logger.error(f"-{NAME}: {args.task}: failed.")
