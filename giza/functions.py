from . import NAME
from abcli import logging
from abcli.plugins import list_of_external
import logging

logger = logging.getLogger(__name__)


def digest(list_of_repos):
    if list_of_repos == "all":
        list_of_repos = list_of_external(True)
    else:
        list_of_repos = list_of_repos.split("+")

    logger.info(
        "{}.digest({} repo(s)): {}".format(
            NAME,
            len(list_of_repos),
            ", ".join(list_of_repos),
        )
    )

    return True
