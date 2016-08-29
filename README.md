# Movi

A library for communicating with the [Audeme MOVI™ Voice Control Shield](http://www.audeme.com/movi.html). Be sure to read the documentation provided by Audeme [here](http://www.audeme.com/downloads.html)

## Installation

    1. git clone https://github.com/NationalAssociationOfRealtors/movi.git
    2. mix do deps.get, deps.compile
    3. iex -S mix

## Usage

View the Client API in `Movi.Client` you have access to the whole Low Level interface provided by MOVI Serial interface. All events are broadcast over `Movi.Client.Events`

### Some usage examples

#### Assign a callsign

    iex(1)> Movi.Client.callsign("Elixir")
    :ok
    iex(2)>
    16:37:07.799 [debug] Event: %Movi.Event{code: 213, message: ["New", "callsign", "trained."]}

    16:37:13.603 [debug] Event: %Movi.Event{code: 112, message: ["The", "call", "sign", "is:", "ELIXIR"]}

    16:37:13.627 [debug] Event: %Movi.Event{code: 105, message: ["READY"]}

#### Add sentence

    iex(6)> Movi.Client.addsentence("turn lights on")
    :ok
    iex(7)>
    16:39:14.370 [debug] Event: %Movi.Event{code: 211, message: ["Sentence", "added", "to", "cache."]}

#### Train sentence

    iex(9)> Movi.Client.trainsentences()
    :ok
    iex(10)>
    16:41:26.138 [debug] Event: %Movi.Event{code: 212, message: ["Sentences", "trained."]}

    16:41:31.872 [debug] Event: %Movi.Event{code: 112, message: ["The", "call", "sign", "is:", "ELIXIR"]}

    16:41:31.896 [debug] Event: %Movi.Event{code: 105, message: ["READY"]}

#### Say Sentence

    iex(13)> Movi.Client.say("Elixir is awesome")
    :ok
    iex(14)>
    16:42:14.039 [debug] Event: %Movi.Event{code: 150, message: ["SPEAKING"]}

    16:42:16.323 [debug] Event: %Movi.Event{code: 151, message: ["END", "SPEAKING"]}

#### Events for incoming speech recognition

    iex(1)>
    16:45:17.474 [debug] Event: %Movi.Event{code: 200, message: ["CALLSIGN", "DETECTED"]}

    16:45:17.936 [debug] Event: %Movi.Event{code: 140, message: ["ACTIVELISTEN"]}

    16:45:20.671 [debug] Event: %Movi.Event{code: 141, message: ["END", "ACTIVELISTEN"]}

    16:45:21.277 [debug] Event: %Movi.Event{code: 201, message: ["TURN", "LIGHTS", "ON"]}

    16:45:21.476 [debug] Event: %Movi.Event{code: 202, message: ["#0"]}
