from pathlib import Path

from typing import List

import pytest


class TestOwnership:

    @pytest.fixture
    def paths(self) -> List[Path]:
        return [
            Path("/home/dokai/.local"),
        ]

    @pytest.mark.cpu
    @pytest.mark.gpu
    @pytest.mark.core
    @pytest.mark.ffmpeg
    @pytest.mark.base
    @pytest.mark.pytorch
    @pytest.mark.video
    @pytest.mark.rootless
    def test_ownership(self, paths: List[Path]):
        for path in paths:
            for p in path.rglob("*"):
                assert p.group() == "dokai", f"{p} is not owned by `dokai` group"
                assert p.owner() == "dokai", f"{p} is not owned by `dokai` user"
