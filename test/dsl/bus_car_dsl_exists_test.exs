defmodule BusCarDslExistsTest do
  use ExUnit.Case
  doctest BusCarDsl.Exists
  alias BusCarDsl.Exists

  test "parse :exists :field map" do
    result = Exists.parse([:exists, :field, "name"], %{})
    expected_map = %{:exists => %{:field => "name"}}
    assert result == {[], expected_map}
  end

  test "parse :exists :field list" do
    result = Exists.parse([:exists, :field, "name"], [])
    expected_list = [%{:exists => %{:field => "name"}}]
    assert result == {[], expected_list}
  end

  test "stems() returns the :exists stems" do
    assert Exists.stems() == [:field]
  end

  test "Exists.root() is :exists" do
    assert Exists.root() == :exists
  end

end
