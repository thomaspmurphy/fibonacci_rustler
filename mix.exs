defmodule FibonacciRust.MixProject do
  use Mix.Project

  def project do
    [
      app: :fibonacci_rustler,
      version: "0.1.0",
      elixir: "~> 1.17.2",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      rustler_crates: rustler_crates()
    ]
  end

  defp deps do
    [
      {:rustler, "~> 0.34.0"}
    ]
  end

  defp rustler_crates do
    [
      fibonacci_rustler: [
        path: "native/fibonacci_rustler",
        mode: (if Mix.env() == :prod, do: :release, else: :debug)
      ]
    ]
  end
end
