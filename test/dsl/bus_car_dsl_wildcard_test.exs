defmodule BusCarDslWildcardTest do
  use ExUnit.Case
  doctest BusCarDsl.Wildcard
  alias BusCarDsl.Wildcard

  test "wildcard map" do
    result = Wildcard.parse([:wildcard, "name", "s*"], %{})
    assert result == {[], %{wildcard: %{"name" => %{value: "s*"}}}}
  end

  test "wildcard list" do
    result = Wildcard.parse([:wildcard, "name", "s*"], [])
    assert result == {[], [%{wildcard: %{"name" => %{value: "s*"}}}]}
    
  end

end
