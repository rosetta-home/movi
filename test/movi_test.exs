defmodule MoviTest do
  use ExUnit.Case
  doctest Movi

  test "receive event from movi" do
      Movi.Client.add_handler(Movi.Handler)
      Movi.Client.say("MOAVEE is awesome")
      assert_receive(%Movi.Event{:code => 150}, 5000) #start speaking event
  end

end
