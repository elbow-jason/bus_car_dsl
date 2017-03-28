defmodule BusCarDslMatchTest do
  use ExUnit.Case
  doctest BusCarDsl.Match
  alias BusCarDsl.Match

  test "match map" do
    result = Match.parse([:match, "name", "jason"], %{})
    assert result == {[], %{match: %{"name" => %{query: "jason"}}}}
  end

  test "match list" do
    result = Match.parse([:match, "name", "json"], [])
    assert result == {[], [%{match: %{"name" => %{query: "json"}}}]}
  end
end
