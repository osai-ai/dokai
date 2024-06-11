import pytest
import torch
from torchvision.ops import roi_align


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

    @pytest.fixture(scope="class", params=["cuda"])
    def device(self, request):
        return torch.device(request.param)

    @pytest.fixture(scope="class")
    def inputs(self) -> torch.Tensor:
        return torch.rand(size=(8, 3, 256, 256), dtype=torch.float32)

    @pytest.fixture(scope="class")
    def boxes(
        self, width: int, height: int, num_points: int
    ) -> torch.Tensor:

        ids = torch.arange(end=num_points).unsqueeze(1)
        x1 = torch.randint(high=width // 2, size=(num_points, 1))
        y1 = torch.randint(high=height // 2, size=(num_points, 1))

        x2, y2 = x1 + width, y1 + height

        return torch.cat([ids, x1, y1, x2, y2], dim=1).to(torch.float32)

    @pytest.mark.parametrize("aligned", [True, False])
    def test_forward(
        self, inputs: torch.Tensor, boxes: torch.Tensor, device: torch.device, width: int, height: int, aligned: bool
    ):
        inputs = inputs.to(device)
        boxes = boxes.to(device)

        roi_align(input=inputs, boxes=boxes, output_size=(width, height), aligned=aligned)
