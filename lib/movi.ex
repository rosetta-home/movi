defmodule Movi do
    use GenServer

    def start_link(tty) do
        GenServer.start_link(__MODULE__, tty, name: __MODULE__)
    end

    def say(text) do
        GenServer.call(__MODULE__, {:say, text})
    end

    def threshold(percentage) do
        GenServer.call(__MODULE__, {:treshold, percentage})
    end

    def help do
        GenServer.call(__MODULE__, {:help})
    end

    def shutdown do
        GenServer.call(__MODULE__, {:shutdown})
    end

    def about do
        GenServer.call(__MODULE__, {:about})
    end

    def version do
        GenServer.call(__MODULE__, {:version})
    end

    def hwversion do
        GenServer.call(__MODULE__, {:hwversion})
    end

    def ping do
        GenServer.call(__MODULE__, {:ping})
    end

    def volume(percentage) do
        GenServer.call(__MODULE__, {:volume, percentage})
    end

    def stop do
        GenServer.call(__MODULE__, {:stop})
    end

    def restart do
        GenServer.call(__MODULE__, {:restart})
    end

    def factory do
        GenServer.call(__MODULE__, {:factory})
    end

    def password do
        GenServer.call(__MODULE__, {:password})
    end

    def female do
        GenServer.call(__MODULE__, {:female})
    end

    def male do
        GenServer.call(__MODULE__, {:male})
    end

    def vocabulary do
        GenServer.call(__MODULE__, {:vocabulary})
    end

    def callsign(callsign) do
        GenServer.call(__MODULE__, {:callsign, callsign})
    end

    def train do
        GenServer.call(__MODULE__, {:train})
    end

    def systemmessages(bool \\ "ON") do
        GenServer.call(__MODULE__, {:systemmessages, bool})
    end

    def responses(bool \\ "ON") do
        GenServer.call(__MODULE__, {:responses, bool})
    end

    def beeps(bool \\ "ON") do
        GenServer.call(__MODULE__, {:beeps, bool})
    end

    def welcomemessage(bool \\ "ON") do
        GenServer.call(__MODULE__, {:welcomemessage, bool})
    end

    def micdebug(bool \\ "ON") do
        GenServer.call(__MODULE__, {:micdebug, bool})
    end

    def init_board do
        GenServer.call(__MODULE__, {:init})
    end

    def newsentences do
        GenServer.call(__MODULE__, {:newsentences})
    end

    def addsentence(sentence) do
        GenServer.call(__MODULE__, {:addsentence, sentence})
    end

    def trainsentences do
        GenServer.call(__MODULE__, {:trainsentences})
    end

    def init(tty) do
        GenServer.start_link(Serial, self(), name: :serial)
        Serial.open(:serial, tty)
        Serial.set_speed(:serial, Application.get_env(:movi, :speed))
        Serial.connect(:serial)
        {:ok, %{:message => "", :pid => nil}}
    end

    def handle_call({:say, text}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "SAY #{text}\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:threshold, percentage}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "THRESHOLD #{percentage}\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:help}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "HELP\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:shutdown}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "SHUTDOWN\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:about}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "ABOUT\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:version}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "VERSION\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:hwversion}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "HWVERSION\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:ping}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "PING\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:volume, percentage}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "VOLUME #{percentage}\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:stop}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "STOP\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:restart}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "RESTART\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:factory}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "FACTORY\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:password}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "PASSWORD\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:female}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "FEMALE\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:male}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "MALE\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:vocabulary}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "VOCABULARY\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:callsign, callsign}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "CALLSIGN #{callsign}\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:train}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "TRAIN\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:systemmessages, bool}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "SYSTEMMESSAGES #{bool}\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:responses, bool}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "RESPONSES #{bool}\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:beeps, bool}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "BEEPS #{bool}\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:welcomemessage, bool}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "WELCOMEMESSAGE #{bool}\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:micdebug, bool}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "MICDEBUG #{bool}\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:init}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "INIT\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:newsentences}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "NEWSENTENCES\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:addsentence, sentence}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "ADDSENTENCE #{sentence}\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_call({:trainsentences}, {pid, _} = _from, state) do
        Serial.send_data(:serial, "TRAINSENTENCES\r\n")
        {:reply, :ok, %{state | :pid => pid}}
    end

    def handle_info({:elixir_serial, serial, data}, state) do
        new_state = %{state | :message => state[:message] <> data}
        case data do
            "\n" ->
                send(state.pid, {:event, new_state.message |> create_event})
                new_state = %{new_state | :message => ""}
            _ ->
                :ok
        end
        {:noreply, new_state}
    end

    defp create_event(message) do
        event = Regex.named_captures(~r"\[(?<code>\d+)\]: (?<message>.+)$", String.strip(message))
        %{event | "code" => String.to_integer(event["code"])}
    end

end
