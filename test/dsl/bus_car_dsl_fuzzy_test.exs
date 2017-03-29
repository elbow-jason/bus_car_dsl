defmodule BusCarDslFuzzyTest do
  use ExUnit.Case
  doctest BusCarDsl.Fuzzy
  alias BusCarDsl.Fuzzy

  test "parse :fuzzy map accumulates correctly" do
    result = Fuzzy.parse([:fuzzy, "name", "jason"], %{})
    assert result == {[], %{fuzzy: %{"name" => %{value: "jason"}}}}
  end

  test "parse :fuzzy list accumulates correctly" do
    result = Fuzzy.parse([:fuzzy, "name", "json"], [])
    assert result == {[], [%{fuzzy: %{"name" => %{value: "json"}}}]}
  end

  test "stems() returns :fuzzy stems" do
    assert Fuzzy.stems() == [:value] # 
  end

  test "Fuzzy.root() is :fuzzy" do
    assert Fuzzy.root() == :fuzzy
  end

end
