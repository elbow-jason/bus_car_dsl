defmodule BusCarDslMatchTest do
  use ExUnit.Case
  doctest BusCarDsl.Match
  alias BusCarDsl.Match

  test "parse :match map" do
    result = Match.parse([:match, "name", "jason"], %{})
    assert result == {[], %{match: %{"name" => %{query: "jason"}}}}
  end

  test "parse :match list" do
    result = Match.parse([:match, "name", "json"], [])
    assert result == {[], [%{match: %{"name" => %{query: "json"}}}]}
  end

  test "stems() returns the :match stems" do
    assert Match.stems() == [:query, :_all]
  end

  test "Match.root() is :match" do
    assert Match.root() == :match
  end

end
