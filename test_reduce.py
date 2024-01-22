import paddle

print(f"PaddlePaddle Version: {paddle.__version__}")

x = paddle.randn(shape=[1024, 1024], dtype="float32")
y1 = paddle.sum(x, axis=0)
y2 = paddle.prod(x, axis=1)
