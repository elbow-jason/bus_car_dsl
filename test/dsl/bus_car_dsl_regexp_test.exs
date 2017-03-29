defmodule BusCarDslRegexpTest do
  use ExUnit.Case
  doctest BusCarDsl.Regexp
  alias BusCarDsl.Regexp

  test "parse :regexp map" do
    result = Regexp.parse([:regexp, "name", ".jason"], %{})
    assert result == {[], %{regexp: %{"name" => %{value: ".jason"}}}}
  end

  test "parse :regexp list" do
    result = Regexp.parse([:regexp, "name", ".json"], [])
    assert result == {[], [%{regexp: %{"name" => %{value: ".json"}}}]}
  end

  test "stems() returns the :regexp stems" do
    assert Regexp.stems() == [:value]
  end
  
  test "Regexp.root() is :regexp" do
    assert Regexp.root() == :regexp
  end
end
