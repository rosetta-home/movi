defmodule Movi.Handler do
    use GenEvent
    alias Movi.Event

    def init(parent) do
        {:ok, parent}
    end

    def handle_event(event = %Event{}, parent) do
        IO.inspect event
        send(parent, event)
        {:ok, parent}
    end
end
