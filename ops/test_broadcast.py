import paddle

print(f"PaddlePaddle Version: {paddle.__version__}")

x = paddle.randn(shape=[2, 4], dtype="float32")
y = paddle.randn(shape=[4], dtype="float32")
print("x:", x)
print("y:", y)
z1 = paddle.add(x, y)
print("x+y:", z1)
z2 = paddle.multiply(x, y)
print("x*y:", z2)
