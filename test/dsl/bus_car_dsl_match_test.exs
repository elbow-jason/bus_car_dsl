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

  test "stems() includes all the stems" do
    assert Match.stems() == [:query, :_all]
  end

  test "root() is the correct atom" do
    assert Match.root() == :match
  end

end
