import numpy as np
import paddle

print(f"PaddlePaddle Version: {paddle.__version__}")

# Initialize input tensor using numpy
x_np = np.random.randint(low=0, high=10, size=[2, 4], dtype="int32")
y_np = np.random.randint(low=0, high=10, size=[2, 4], dtype="int32")

x = paddle.to_tensor(x_np)
y = paddle.to_tensor(y_np)

and_out = paddle.bitwise_and(x, y)
or_out = paddle.bitwise_or(x, y)
xor_out = paddle.bitwise_xor(x, y)
not_out = paddle.bitwise_not(x)

# Check the accuracy
assert np.allclose(and_out, np.bitwise_and(x_np, y_np)), "paddle.bitwise_and produces wrong result!"
assert np.allclose(or_out, np.bitwise_or(x_np, y_np)), "paddle.bitwise_or produces wrong result!"
assert np.allclose(xor_out, np.bitwise_xor(x_np, y_np)), "paddle.bitwise_xor produces wrong result!"
assert np.allclose(not_out, np.bitwise_not(x_np)), "paddle.bitwise_not produces wrong result!"

print("All API tests pass!")
