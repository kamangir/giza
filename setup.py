from gizai import NAME, VERSION, DESCRIPTION
from blueness.pypi import setup


setup(
    filename=__file__,
    repo_name="giza",
    name=NAME,
    version=VERSION,
    description=DESCRIPTION,
    packages=[
        NAME,
        f"{NAME}.digest",
        f"{NAME}.tex",
    ],
)
