import paddle

print(f"PaddlePaddle Version: {paddle.__version__}")

x = paddle.randn(shape=[1024, 1024], dtype="float32")
y = paddle.randn(shape=[1024], dtype="float32")
z1 = paddle.add(x, y)
z2 = paddle.multiply(x, y)
