defmodule BusCarDslMustTest do
  use ExUnit.Case
  doctest BusCarDsl.Must
  alias BusCarDsl.Must

  test "parse :must :match list accumulates correctly" do
    result = Must.parse([:must, :match, "name", 344], [])
    assert result == {[], [%{match: %{"name" => %{query: 344}}}]}
  end

  test "parse :must :term list accumulates correctly" do
    result = Must.parse([:must, :term, "name", 34], [])
    assert result == {[],[%{term: %{"name" => %{value: 34}}}]}
  end

  test "parse :must :exists :field list accumulates correctly" do
    result = Must.parse([:must, :exists, :field, "name"], [])
    assert result == {[], [%{exists: %{field: "name"}}]}
  end

  test "parse :must :prefix accumulates correctly" do
    result = Must.parse([:must, :prefix, "name", "jaso"], [])
    assert result == {[], [%{prefix: %{"name" => %{value: "jaso"}}}]}
  end

  test "parse :must :wildcard accumulates correctly" do
    result = Must.parse([:must, :wildcard, "name", "beef"], [])
    assert result == {[], [%{wildcard: %{"name" => %{value: "beef"}}}]}
  end

  test "parse :must :range accumulates correctly" do
    result = Must.parse([:must, :range, "peanuts", :gte, 400, :lt, 100000], [])
    assert result == {[], [%{range: %{"peanuts" => %{gte: 400, lt: 100000}}}]}
  end

  test "parse :must :fuzzy accumulates correctly" do
    result = Must.parse([:must, :fuzzy, "name", "jason"], [])
    assert result == {[], [%{fuzzy: %{"name" => %{value: "jason"}}}]}
  end

  test "stems() returns the :must stems" do
    assert Must.stems() == [:regexp, :fuzzy, :range, :wildcard, :prefix, :exists, :term, :match]
  end

  test "Must.root() is :must" do
    assert Must.root() == :must
  end

end
