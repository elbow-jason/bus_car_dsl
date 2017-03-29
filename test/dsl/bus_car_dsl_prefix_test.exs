defmodule BusCarDslPrefixTest do
  use ExUnit.Case
  doctest BusCarDsl.Prefix
  alias BusCarDsl.Prefix

  test "parse :prefix map accumulates correctly" do
    result = Prefix.parse([:prefix, "name", "s"], %{})
    assert result == {[], %{prefix: %{"name" => %{value: "s"}}}}
  end

  test "parse :prefix list accumulates correctly" do
    result = Prefix.parse([:prefix, "name", "s"], [])
    assert result == {[], [%{prefix: %{"name" => %{value: "s"}}}]}
  end

  test "stems() returns the :prefix stems" do
    assert Prefix.stems() == [:value]
  end
  
  test "Prefix.root() is :prefix" do
    assert Prefix.root() == :prefix
  end

end
