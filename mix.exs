defmodule JpKatsuYou.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :jp_katsuyou,
      version: "0.1.2",
      elixir: "~> 1.5",
      name: "JpKatsuyou",
      description: description(),
      package: package(),
      deps: deps(),
      source_url: "https://github.com/swarut/jp_katsuyou"
    ]
  end

  def application do
    []
  end

  defp deps() do
    [
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "A library that provide some utility for japanese language conjugation."
  end

  defp package() do

    [
      maintainers: ["Warut Surapat"],
      licenses: ["MIT"],
      links: %{"Github" =>"https://github.com/swarut/jp_katsuyou"}
    ]

  end
end
