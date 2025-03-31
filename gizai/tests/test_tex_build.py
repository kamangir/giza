from bluer_objects import objects

from gizai.tex.functions import build


def test_build():
    assert build(
        filename=objects.path_of(
            "version.tex",
            object_name=objects.unique_object(),
        )
    )
