defmodule BusCarDsl.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bus_car_dsl,
      version: "0.1.3",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
      package: package(),
    ]
  end

  defp package do
    [
      maintainers: ["Jason Goldberger"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/elbow-jason/bus_car_dsl"},
      files: ~w(mix.exs README.md lib test),
    ]
  end

  defp description() do
    """
    A Domain Specific Language for composing ElasticSearch queries without all the nesting.
    """
  end

  defp apps do
    [
      :logger,
    ]
  end
  def application do
    [
      extra_applications: apps(),
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
