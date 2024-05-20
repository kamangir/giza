import os


def get_long_description(filename: str) -> str:
    with open(os.path.join(os.path.dirname(filename), "README.md")) as f:
        return f.read().replace(
            "./",
            "https://github.com/kamangir/giza/raw/main/",
        )
