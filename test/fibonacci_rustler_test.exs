defmodule FibonacciTest do
  use ExUnit.Case
  doctest FibonacciRustler

  test "calculates Fibonacci numbers correctly" do
    assert FibonacciRustler.fibonacci_iterative(0) == {:ok, 0}
    assert FibonacciRustler.fibonacci_iterative(1) == {:ok, 1}
    assert FibonacciRustler.fibonacci_iterative(10) == {:ok, 55}
    assert FibonacciRustler.fibonacci_iterative(20) == {:ok, 6765}
    assert FibonacciRustler.fibonacci_recursive(0) == {:ok, 0}
    assert FibonacciRustler.fibonacci_recursive(1) == {:ok, 1}
    assert FibonacciRustler.fibonacci_recursive(10) == {:ok, 55}
    assert FibonacciRustler.fibonacci_recursive(20) == {:ok, 6765}
  end

  test "compares Rust and Elixir implementations" do
    n = 30
    {rust_iter_time, {:ok, rust_iter_result}} = :timer.tc(fn -> FibonacciRustler.fibonacci_iterative(n) end)
    {rust_rec_time, {:ok, rust_rec_result}} = :timer.tc(fn -> FibonacciRustler.fibonacci_recursive(n) end)
    {elixir_rec_time, elixir_rec_result} = :timer.tc(fn -> FibonacciElixirRecursive.fibonacci(n) end)
    {elixir_iter_time, elixir_iter_result} = :timer.tc(fn -> FibonacciElixirIterative.fibonacci(n) end)

    IO.puts("Rust Iterative time: #{rust_iter_time} microseconds")
    IO.puts("Rust Recursive time: #{rust_rec_time} microseconds")
    IO.puts("Elixir Iterative time: #{elixir_iter_time} microseconds")
    IO.puts("Elixir Recursive time: #{elixir_rec_time} microseconds")
    IO.puts("Speedup (Rust Recursive vs Elixir Recursive): #{elixir_rec_time / rust_rec_time}x")
    IO.puts("Speedup (Rust Iterative vs Elixir Iterative): #{elixir_iter_time / rust_iter_time}x")
    IO.puts("Speedup (Rust Recursive vs Elixir Iterative): #{elixir_iter_time / rust_rec_time}x")
    IO.puts("Speedup (Rust Iterative vs Elixir Recursive): #{elixir_rec_time / rust_iter_time}x")

    assert rust_iter_result == elixir_rec_result
    assert rust_iter_result == elixir_iter_result
    assert rust_rec_result == elixir_rec_result
    assert rust_rec_result == elixir_iter_result
  end
end
