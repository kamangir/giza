from gizai import NAME, VERSION, DESCRIPTION, ICON
from gizai.logger import logger
from gizai.argparse.version import main

success, message = main(NAME, VERSION, DESCRIPTION, ICON)
if not success:
    logger.error(message)
