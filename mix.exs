defmodule Movi.Mixfile do
  use Mix.Project

  def project do
    [app: :movi,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [
      applications: [:logger, :serial],
      mod: {Movi, []},
      env: [
        speed: 9600,
        tty: "/dev/ttyUSB0"
      ]
    ]
  end

  def description do
      """
      A library for communicating with the Audeme MOVI™ Voice Control Shield]
      """
  end

  def package do
    [
      name: :movi,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Christopher Steven Coté"],
      licenses: ["MIT License"],
      links: %{"GitHub" => "https://github.com/NationalAssociationOfRealtors/movi",
          "Docs" => "https://github.com/NationalAssociationOfRealtors/movi"}
    ]
  end

  defp deps do
    [
        {:serial, github: "bitgamma/elixir_serial", tag: "v0.1.2"},
    ]
  end
end
