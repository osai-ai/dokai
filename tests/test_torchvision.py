import pytest


class TestTorchvision:

    @pytest.fixture(scope="class", params=[3, 17])
    def num_points(self, request):
        return request.param

    @pytest.fixture(scope="class", params=[10, 64])
    def width(self, request):
        return request.param

    @pytest.fixture(scope="class", params=[10, 64])
    def height(self, request):
        return request.param

    @pytest.fixture(scope="class", params=["cpu"])
    def cpu_device(self, request):
        import torch
        return torch.device(request.param)

    @pytest.fixture(scope="class", params=["cpu", "cuda"])
    def any_device(self, request):
        import torch

        return torch.device(request.param)

    @pytest.fixture(scope="class")
    def inputs(self):
        import torch
        return torch.rand(size=(8, 3, 256, 256), dtype=torch.float32)

    @pytest.fixture(scope="class")
    def boxes(self, width: int, height: int, num_points: int):
        import torch
        ids = torch.arange(end=num_points).unsqueeze(1)
        x1 = torch.randint(high=width // 2, size=(num_points, 1))
        y1 = torch.randint(high=height // 2, size=(num_points, 1))

        x2, y2 = x1 + width, y1 + height

        return torch.cat([ids, x1, y1, x2, y2], dim=1).to(torch.float32)

    @pytest.mark.cpu
    @pytest.mark.pytorch
    @pytest.mark.rootful
    @pytest.mark.rootless
    @pytest.mark.parametrize("aligned", [True, False])
    def test_cpu_forward(
        self,
        inputs,
        boxes,
        cpu_device,
        width: int,
        height: int,
        aligned: bool,
    ):
        from torchvision.ops import roi_align

        inputs = inputs.to(cpu_device)
        boxes = boxes.to(cpu_device)

        roi_align(input=inputs, boxes=boxes, output_size=(width, height), aligned=aligned)

    @pytest.mark.gpu
    @pytest.mark.pytorch
    @pytest.mark.rootful
    @pytest.mark.rootless
    @pytest.mark.parametrize("aligned", [True, False])
    def test_cpu_forward(
        self,
        inputs,
        boxes,
        any_device,
        width: int,
        height: int,
        aligned: bool,
    ):
        from torchvision.ops import roi_align

        inputs = inputs.to(any_device)
        boxes = boxes.to(any_device)

        roi_align(input=inputs, boxes=boxes, output_size=(width, height), aligned=aligned)
