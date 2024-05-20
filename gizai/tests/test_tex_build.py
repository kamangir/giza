from gizai.tex.functions import build
from abcli.modules import objects


def test_build():
    assert build(
        filename=objects.path_of(
            "version.tex",
            object_name=objects.unique_object(),
        )
    )
