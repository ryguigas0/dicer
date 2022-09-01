defmodule Dicer.MixProject do
  use Mix.Project

  def project do
    [
      app: :dicer,
      version: "1.0.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Dicer",
      description: "Diceware word list generator for Elixir",
      source_url: "https://github.com/ryguigas0/dicer",
      homepage_url: "https://github.com/ryguigas0/dicer",
      docs: [
        main: "Dicer",
        extras: ["README.md"]
      ],
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end
end
