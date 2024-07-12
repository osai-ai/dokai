import subprocess as sp
import pytest


class TestFFmpeg:

    @pytest.mark.cpu
    @pytest.mark.ffmpeg
    @pytest.mark.base
    @pytest.mark.pytorch
    @pytest.mark.video
    @pytest.mark.rootful
    @pytest.mark.rootless
    def test_cpu_ffmpeg(self):
        version = sp.run(["ffmpeg", "-version"], stdout=sp.PIPE)
        assert (
            version.stdout.decode("utf-8") ==
            "ffmpeg version n6.1 Copyright (c) 2000-2023 the FFmpeg developers\n"
            "built with gcc 12 (Debian 12.2.0-14)\n"
            "configuration: --enable-shared --disable-static "
            "--disable-doc --enable-gpl --enable-libx264 "
            "--enable-libmp3lame --extra-libs=-lpthread "
            "--enable-openssl --enable-nonfree\n"
            "libavutil      58. 29.100 / 58. 29.100\n"
            "libavcodec     60. 31.102 / 60. 31.102\n"
            "libavformat    60. 16.100 / 60. 16.100\n"
            "libavdevice    60.  3.100 / 60.  3.100\n"
            "libavfilter     9. 12.100 /  9. 12.100\n"
            "libswscale      7.  5.100 /  7.  5.100\n"
            "libswresample   4. 12.100 /  4. 12.100\n"
            "libpostproc    57.  3.100 / 57.  3.100\n"
        )

    @pytest.mark.gpu
    @pytest.mark.ffmpeg
    @pytest.mark.base
    @pytest.mark.pytorch
    @pytest.mark.video
    @pytest.mark.rootful
    @pytest.mark.rootless
    def test_gpu_ffmpeg(self):
        version = sp.run(["ffmpeg", "-version"], stdout=sp.PIPE)
        assert (
            version.stdout.decode("utf-8") ==
            "ffmpeg version n6.1 Copyright (c) 2000-2023 the FFmpeg developers\n"
            "built with gcc 11 (Ubuntu 11.4.0-1ubuntu1~22.04)\n"
            "configuration: --enable-cuda --enable-cuvid --enable-ffnvcodec --enable-nvdec "
            "--enable-nvenc --enable-shared --disable-static --disable-doc "
            "--extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64 "
            "--enable-gpl --enable-libx264 --enable-libmp3lame --extra-libs=-lpthread "
            "--enable-openssl --enable-nonfree --nvccflags='-arch=sm_60 "
            "-gencode=arch=compute_60,code=sm_60 -gencode=arch=compute_61,code=sm_61 "
            "-gencode=arch=compute_70,code=sm_70 -gencode=arch=compute_75,code=sm_75 "
            "-gencode=arch=compute_80,code=sm_80 -gencode=arch=compute_86,code=sm_86 "
            "-gencode=arch=compute_89,code=sm_89 -gencode=arch=compute_90,code=sm_90 "
            "-gencode=arch=compute_90,code=compute_90'\n"
            "libavutil      58. 29.100 / 58. 29.100\n"
            "libavcodec     60. 31.102 / 60. 31.102\n"
            "libavformat    60. 16.100 / 60. 16.100\n"
            "libavdevice    60.  3.100 / 60.  3.100\n"
            "libavfilter     9. 12.100 /  9. 12.100\n"
            "libswscale      7.  5.100 /  7.  5.100\n"
            "libswresample   4. 12.100 /  4. 12.100\n"
            "libpostproc    57.  3.100 / 57.  3.100\n"
        )

