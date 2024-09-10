defmodule FibonacciElixirIterative do
  def fibonacci(0), do: 0
  def fibonacci(1), do: 1

  def fibonacci(n) when n > 1 do
    fib_iter(0, 1, n - 1)
  end

  defp fib_iter(_a, b, 0), do: b
  defp fib_iter(a, b, count) do
    fib_iter(b, a + b, count - 1)
  end
end
