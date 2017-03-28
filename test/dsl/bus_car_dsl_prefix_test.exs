defmodule BusCarDslPrefixTest do
  use ExUnit.Case
  doctest BusCarDsl.Prefix
  alias BusCarDsl.Prefix

  test "prefix map" do
    result = Prefix.parse([:prefix, "name", "s"], %{})
    assert result == {[], %{prefix: %{"name" => %{value: "s"}}}}
  end

  test "prefix list" do
    result = Prefix.parse([:prefix, "name", "s"], [])
    assert result == {[], [%{prefix: %{"name" => %{value: "s"}}}]}
  end

end
