import paddle

print(f"PaddlePaddle Version: {paddle.__version__}")

x = paddle.randn(shape=[2, 4], dtype="float32")
print("x:", x)
y1 = paddle.nn.functional.relu(x)
print("relu(x):", y1)
y2 = paddle.nn.functional.sigmoid(x)
print("sigmoid(x):", y2)
y3 = paddle.square(x)
print("square(x):", y3)
