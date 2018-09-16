defmodule HodorTest do
  use ExUnit.Case
  doctest Hodor

  test "greets the world" do
    assert Hodor.hello() == :world
  end
end
