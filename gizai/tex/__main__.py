import argparse

from blueness import module
from blueness.argparse.generic import sys_exit

from gizai import NAME
from gizai.tex.functions import build
from gizai.logger import logger

NAME = module.name(__file__, NAME)


parser = argparse.ArgumentParser(NAME)
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
    success = None

sys_exit(logger, NAME, args.task, success)
