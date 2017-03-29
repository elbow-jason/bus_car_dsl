defmodule BusCarDslFuzzyTest do
  use ExUnit.Case
  doctest BusCarDsl.Fuzzy
  alias BusCarDsl.Fuzzy

  test "fuzzy map" do
    result = Fuzzy.parse([:fuzzy, "name", "jason"], %{})
    assert result == {[], %{fuzzy: %{"name" => %{value: "jason"}}}}
  end

  test "fuzzy list" do
    result = Fuzzy.parse([:fuzzy, "name", "json"], [])
    assert result == {[], [%{fuzzy: %{"name" => %{value: "json"}}}]}
  end

  test "stems() includes no stems. It's a leaf.'" do
    assert Fuzzy.stems() == [:value] # 
  end

  test "root() is the correct atom" do
    assert Fuzzy.root() == :fuzzy
  end


end
