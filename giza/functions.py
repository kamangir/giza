import os
from tqdm import tqdm
from . import NAME
from abcli.plugins import list_of_external
from abcli import file
from abcli import logging
import logging

logger = logging.getLogger(__name__)


def digest(list_of_repos):
    if list_of_repos == "all":
        list_of_repos = ["awesome-bash-cli"] + list_of_external(True)
    else:
        list_of_repos = list_of_repos.split("+")

    logger.info(
        "{}.digest({} repo(s)): {}".format(
            NAME,
            len(list_of_repos),
            ", ".join(list_of_repos),
        )
    )

    abcli_path_git = os.getenv("abcli_path_git", "")

    file_count = 0
    for repo_name in tqdm(list_of_repos):
        list_of_files = file.list_of(
            os.path.join(abcli_path_git, repo_name, "*.sh"),
            recursive=True,
        )

        file_count += len(list_of_files)

    logger.info(f"processed {file_count} file(s)")

    return True
