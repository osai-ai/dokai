import subprocess as sp
import pytest


class TestFFmpeg:

    @pytest.mark.ffmpeg
    def test_ffmpeg(self):
        result = sp.run(["ffmpeg", "-version"], stdout=sp.PIPE)
        assert (
            result.stdout.split(b"\n")[0] ==
            b"ffmpeg version n6.1 Copyright (c) 2000-2023 the FFmpeg developers"
        )

