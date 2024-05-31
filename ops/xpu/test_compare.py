import numpy as np
import paddle

print(f"PaddlePaddle Version: {paddle.__version__}")

# Initialize input tensor using numpy
x_np = np.random.randint(low=0, high=10, size=[2, 4], dtype="int32")
y_np = np.random.randint(low=0, high=10, size=[2, 4], dtype="int32")

x = paddle.to_tensor(x_np)
y = paddle.to_tensor(y_np)

lt_out = paddle.less_than(x, y)
le_out = paddle.less_equal(x, y)
gt_out = paddle.greater_than(x, y)
ge_out = paddle.greater_equal(x, y)
eq_out = paddle.equal(x, y)
ne_out = paddle.not_equal(x, y)

# Check the accuracy
assert np.allclose(lt_out, np.less(x_np, y_np)), "paddle.less_than produces wrong result!"
assert np.allclose(le_out, np.less_equal(x_np, y_np)), "paddle.less_equal produces wrong result!"
assert np.allclose(gt_out, np.greater(x_np, y_np)), "paddle.greater_than produces wrong result!"
assert np.allclose(ge_out, np.greater_equal(x_np, y_np)), "paddle.greater_equal produces wrong result!"
assert np.allclose(eq_out, np.equal(x_np, y_np)), "paddle.equal produces wrong result!"
assert np.allclose(ne_out, np.not_equal(x_np, y_np)), "paddle.not_equal produces wrong result!"

print("All API tests pass!")
