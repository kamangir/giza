import os
from setuptools import setup

from gizai import NAME, VERSION, DESCRIPTION

with open(os.path.join(os.path.dirname(__file__), "README.md")) as f:
    long_description = f.read().replace(
        "./",
        "https://github.com/kamangir/giza/raw/main/",
    )

with open(os.path.join(os.path.dirname(__file__), "requirements.txt")) as f:
    requirements = f.read().strip().split("\n")


setup(
    name=NAME,
    author="kamangir",
    version=VERSION,
    description=DESCRIPTION,
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/kamangir/giza",
    packages=[
        NAME,
        f"{NAME}.digest",
        f"{NAME}.tex",
    ],
    install_requires=requirements,
    classifiers=[
        "Programming Language :: Python :: 3",
        "Programming Language :: Unix Shell",
        "License :: Public Domain",
        "Operating System :: OS Independent",
    ],
    license="Public Domain",
)
