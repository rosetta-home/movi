# Movi

start movi client like so

        Movi.start_link "/dev/ttyUSB0"

 The calling process will receive response messages in the form of

        {:event, %{code => code, message => message}}

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add movi to your list of dependencies in `mix.exs`:

        def deps do
          [{:movi, "~> 0.0.1"}]
        end

  2. Ensure movi is started before your application:

        def application do
          [applications: [:movi]]
        end
