defmodule MoviTest do
  use ExUnit.Case
  doctest Movi

  test "receive event from movi" do
      Movi.start_link "/dev/ttyUSB0"
      Movi.add_handler(Movi.Handler)
      Movi.say("MOAVEE is awesome")
      assert_receive(%Movi.Event{:code => 150}, 5000) #start speking event
  end

end
