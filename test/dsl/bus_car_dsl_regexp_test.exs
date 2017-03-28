defmodule BusCarDslRegexpTest do
  use ExUnit.Case
  doctest BusCarDsl.Regexp
  alias BusCarDsl.Regexp

  test "regexp map" do
    result = Regexp.parse([:regexp, "name", ".jason"], %{})
    assert result == {[], %{regexp: %{"name" => %{value: ".jason"}}}}
  end

  test "regexp list" do
    result = Regexp.parse([:regexp, "name", ".json"], [])
    assert result == {[], [%{regexp: %{"name" => %{value: ".json"}}}]}
  end
end
