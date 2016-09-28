defmodule Movi do
  use Application
  require Logger
  alias Nerves.UART, as: Serial

  defmodule Event do
    defstruct [:code, :message]
  end

  def start(_type, _args) do
    get_tty
    Movi.Supervisor.start_link
  end

  def get_tty do
  Serial.enumerate |> Enum.each(fn({tty, device}) ->
    Logger.info("#{inspect device}")
    case Map.get(device, :product_id, 0) do
      8963 ->
        Logger.info("Setting Movi TTY: #{inspect tty}")
        tty = case String.starts_with?(tty, "/dev") do
          true -> tty
          false -> "/dev/#{tty}"
        end
        Application.put_env(:movi, :tty, tty, persistent: true)
      _ -> nil
    end
  end)
  end
end
