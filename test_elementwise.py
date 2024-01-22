import paddle

print(f"PaddlePaddle Version: {paddle.__version__}")

x = paddle.randn(shape=[1024], dtype="float32")
y1 = paddle.nn.functional.relu(x)
y2 = paddle.nn.functional.sigmoid(x)
y3 = paddle.square(x)
