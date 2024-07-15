import sys
import pytest


class TestPython:

    @pytest.mark.cpu
    @pytest.mark.gpu
    @pytest.mark.core
    @pytest.mark.ffmpeg
    @pytest.mark.base
    @pytest.mark.pytorch
    @pytest.mark.video
    @pytest.mark.rootful
    @pytest.mark.rootless
    def test_python(self):
        assert sys.version_info.major == 3
        assert sys.version_info.minor == 11
        assert sys.version_info.micro == 9
