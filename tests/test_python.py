import subprocess as sp
import pytest


class TestPython:

    @pytest.mark.python
    def test_python(self):
        result = sp.run(["python", "--version"], stdout=sp.PIPE)
        assert result.stdout == b"Python 3.11.9\n"
