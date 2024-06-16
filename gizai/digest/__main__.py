import argparse
from gizai.digest import NAME, VERSION
from gizai.digest.functions import digest
from gizai.logger import logger
from blueness.argparse.generic import sys_exit


parser = argparse.ArgumentParser(NAME, description=f"{NAME}-{VERSION}")
parser.add_argument(
    "task",
    type=str,
    help="digest",
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
args = parser.parse_args()

success = False
if args.task == "digest":
    success = digest(
        args.input_filename,
        args.output_filename,
        args.list_of_applications,
    )
else:
    success = None

sys_exit(logger, NAME, args.task, success)
