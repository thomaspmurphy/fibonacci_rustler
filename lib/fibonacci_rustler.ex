defmodule FibonacciRustler do
  use Rustler, otp_app: :fibonacci_rustler, crate: "fibonaccirustler"

  # Function that will be implemented in Rust.
  # Returns {:ok, result} on success, {:error, error_message} on failure.
  def fibonacci_iterative(_n), do: :erlang.nif_error(:nif_not_loaded)
  def fibonacci_recursive(_n), do: :erlang.nif_error(:nif_not_loaded)
end
