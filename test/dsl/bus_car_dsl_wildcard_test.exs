defmodule BusCarDslWildcardTest do
  use ExUnit.Case
  doctest BusCarDsl.Wildcard
  alias BusCarDsl.Wildcard

  test "parse :wildcard map" do
    result = Wildcard.parse([:wildcard, "name", "s*"], %{})
    assert result == {[], %{wildcard: %{"name" => %{value: "s*"}}}}
  end

  test "parse :wildcard list" do
    result = Wildcard.parse([:wildcard, "name", "s*"], [])
    assert result == {[], [%{wildcard: %{"name" => %{value: "s*"}}}]}
  end

  test "stems() returns the :wildcard stems" do
    assert Wildcard.stems() == [:value]
  end

  test "Wildcard.root() is :wildcard" do
    assert Wildcard.root() == :wildcard
  end


end
