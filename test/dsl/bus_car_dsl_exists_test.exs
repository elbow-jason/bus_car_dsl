defmodule BusCarDslExistsTest do
  use ExUnit.Case
  doctest BusCarDsl.Exists
  alias BusCarDsl.Exists

  test "exists map" do
    result = Exists.parse([:exists, :field, "name"], %{})
    expected_map = %{:exists => %{:field => "name"}}
    assert result == {[], expected_map}
  end

  test "exists list" do
    result = Exists.parse([:exists, :field, "name"], [])
    expected_list = [%{:exists => %{:field => "name"}}]
    assert result == {[], expected_list}
  end

  test "stems() includes all the stems" do
    assert Exists.stems() == [:field]
  end

  test "root() is the correct atom" do
    assert Exists.root() == :exists
  end

end
