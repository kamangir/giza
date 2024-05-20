import os
from setuptools import setup

from gizai import NAME, VERSION, DESCRIPTION
from gizai.pypi import get_long_description


with open(os.path.join(os.path.dirname(__file__), "requirements.txt")) as f:
    requirements = f.read().strip().split("\n")


setup(
    name=NAME,
    author="kamangir",
    version=VERSION,
    description=DESCRIPTION,
    long_description=get_long_description(__file__),
    long_description_content_type="text/markdown",
    url="https://github.com/kamangir/giza",
    packages=[
        NAME,
        f"{NAME}.digest",
        f"{NAME}.pypi",
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
