defmodule BusCarDslMustNotTest do
  use ExUnit.Case
  doctest BusCarDsl.MustNot
  alias BusCarDsl.MustNot


  test "parse :must_not :match list accumulates correctly" do
    result = MustNot.parse([:must_not, :match, "name", 344], [])
    assert result == {[], [%{match: %{"name" => %{query: 344}}}]}
  end

  test "parse :must_not :term list accumulates correctly" do
    result = MustNot.parse([:must_not, :term, "name", 34], [])
    assert result == {[],[%{term: %{"name" => %{value: 34}}}]}
  end

  test "parse :must_not :exists :field list accumulates correctly" do
    result = MustNot.parse([:must_not, :exists, :field, "name"], [])
    assert result == {[], [%{exists: %{field: "name"}}]}
  end

  test "parse :must_not :prefix accumulates correctly" do
    result = MustNot.parse([:must_not, :prefix, "name", "jaso"], [])
    assert result == {[], [%{prefix: %{"name" => %{value: "jaso"}}}]}
  end

  test "parse :must_not :wildcard accumulates correctly" do
    result = MustNot.parse([:must_not, :wildcard, "name", "beef"], [])
    assert result == {[], [%{wildcard: %{"name" => %{value: "beef"}}}]}
  end

  test "parse :must_not :range accumulates correctly" do
    result = MustNot.parse([:must_not, :range, "peanuts", :gte, 400, :lt, 100000], [])
    assert result == {[], [%{range: %{"peanuts" => %{gte: 400, lt: 100000}}}]}
  end

  test "parse :must_not :fuzzy accumulates correctly" do
    result = MustNot.parse([:must_not, :fuzzy, "name", "jason"], [])
    assert result == {[], [%{fuzzy: %{"name" => %{value: "jason"}}}]}
  end

  test "stems() returns the :must_not stems" do
    assert MustNot.stems() == [:fuzzy, :range, :wildcard, :prefix, :exists, :term, :match]
  end

  test "MustNot.root() is :must_not" do
    assert MustNot.root() == :must_not
  end

end
