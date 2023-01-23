import argparse
from . import *
from abcli import logging
import logging

logger = logging.getLogger(__name__)

parser = argparse.ArgumentParser(NAME, description=f"{NAME}-{VERSION}")
parser.add_argument(
    "task",
    type=str,
    help="digest|version",
)
parser.add_argument(
    "--what",
    default="all",
    help="<plugin_1+plugin_2>|all",
    type=str,
)
args = parser.parse_args()

success = False
if args.task == "digest":
    success = digest(args.what)
elif args.task == "version":
    print(f"{NAME}-{VERSION}")
    success = True
else:
    logger.error(f"-{NAME}: {args.task}: command not found.")

if not success:
    logger.error(f"-{NAME}: {args.task}: failed.")
