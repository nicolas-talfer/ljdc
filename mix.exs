defmodule LJDC.MixProject do
  use Mix.Project

  def project do
    [
      app: :ljdc,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:floki, "~> 0.36.2"},
      {:tesla, "~> 1.9"},
      {:hackney, "~> 1.20"},
      {:jason, "~> 1.4"}
    ]
  end
end
