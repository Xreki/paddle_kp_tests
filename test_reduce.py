import paddle

print(f"PaddlePaddle Version: {paddle.__version__}")

x = paddle.randn(shape=[2, 4], dtype="float32")
print("x:", x)
y1 = paddle.sum(x, axis=0)
print("sum(x):", y1)
y2 = paddle.prod(x, axis=1)
print("prod(x):", y2)
