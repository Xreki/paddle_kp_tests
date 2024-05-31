import numpy as np
import paddle

print(f"PaddlePaddle Version: {paddle.__version__}")

# Initialize input tensor using numpy
x_np = 2 * (np.random.random(size=[2, 4]).astype("float32") - 0.5)
y_np = 2 * (np.random.random(size=[4]).astype("float32") - 0.5)

x = paddle.to_tensor(x_np)
y = paddle.to_tensor(y_np)

add_out = paddle.add(x, y)
subtract_out = paddle.subtract(x, y)
multiply_out = paddle.multiply(x, y)
divide_out = paddle.divide(x, y)
maximum_out = paddle.maximum(x, y)
minimum_out = paddle.minimum(x, y)

# Check the accuracy
assert np.allclose(add_out, x_np + y_np), "paddle.add produces wrong result!"
assert np.allclose(subtract_out, x_np - y_np), "paddle.subtract produces wrong result!"
assert np.allclose(multiply_out, x_np * y_np), "paddle.multiply produces wrong result!"
assert np.allclose(divide_out, x_np / y_np), "paddle.divide produces wrong result!"
assert np.allclose(maximum_out, np.maximum(x_np, y_np)), "paddle.maximum produces wrong result!"
assert np.allclose(minimum_out, np.minimum(x_np, y_np)), "paddle.minimum produces wrong result!"

print("All API tests pass!")
