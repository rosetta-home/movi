defmodule Movi.Mixfile do
  use Mix.Project

  def project do
    [app: :movi,
     version: "0.1.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps]
  end

  def application do
    [
      applications: [:logger, :nerves_uart],
      mod: {Movi, []},
      env: [
        speed: 9600,
        tty: "/dev/ttyUSB35345345"
      ]
    ]
  end

  def description do
      """
      A library for communicating with the Audeme MOVI™ Voice Control Shield
      """
  end

  def package do
    [
      name: :movi,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Christopher Steven Coté"],
      licenses: ["Apache License 2.0"],
      links: %{"GitHub" => "https://github.com/NationalAssociationOfRealtors/movi",
          "Docs" => "https://github.com/NationalAssociationOfRealtors/movi"}
    ]
  end

  defp deps do
    [
        {:nerves_uart, "~> 0.1.1"},
        {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
