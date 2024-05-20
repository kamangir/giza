import argparse
from gizai.tex import NAME, VERSION
from gizai.tex.functions import build
from gizai.logger import logger


parser = argparse.ArgumentParser(NAME, description=f"{NAME}-{VERSION}")
parser.add_argument(
    "task",
    type=str,
    help="build",
)
parser.add_argument(
    "--filename",
    type=str,
)
args = parser.parse_args()

success = False
if args.task == "build":
    success = build(args.filename)
else:
    logger.error(f"-{NAME}: {args.task}: command not found.")

if not success:
    logger.error(f"-{NAME}: {args.task}: failed.")
