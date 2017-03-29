defmodule BusCarDslShouldTest do
  use ExUnit.Case
  doctest BusCarDsl.Should
  alias BusCarDsl.Should

  test "parse :should :match list accumulates correctly" do
    result = Should.parse([:should, :match, "name", 344], [])
    assert result == {[], [%{match: %{"name" => %{query: 344}}}]}
  end

  test "parse :should :term list accumulates correctly" do
    result = Should.parse([:should, :term, "name", 34], [])
    assert result == {[],[%{term: %{"name" => %{value: 34}}}]}
  end

  test "parse :should :exists :field list accumulates correctly" do
    result = Should.parse([:should, :exists, :field, "name"], [])
    assert result == {[], [%{exists: %{field: "name"}}]}
  end

  test "parse :should :prefix accumulates correctly" do
    result = Should.parse([:should, :prefix, "name", "jaso"], [])
    assert result == {[], [%{prefix: %{"name" => %{value: "jaso"}}}]}
  end

  test "parse :should :wildcard accumulates correctly" do
    result = Should.parse([:should, :wildcard, "name", "beef"], [])
    assert result == {[], [%{wildcard: %{"name" => %{value: "beef"}}}]}
  end

  test "parse :should :range accumulates correctly" do
    result = Should.parse([:should, :range, "peanuts", :gte, 400, :lt, 100000], [])
    assert result == {[], [%{range: %{"peanuts" => %{gte: 400, lt: 100000}}}]}
  end

  test "parse :should :fuzzy accumulates correctly" do
    result = Should.parse([:should, :fuzzy, "name", "jason"], [])
    assert result == {[], [%{fuzzy: %{"name" => %{value: "jason"}}}]}
  end

  test "stems() returns the :should stems" do
    assert Should.stems() ==  [:regexp, :fuzzy, :range, :wildcard, :prefix, :exists, :term, :match]
  end

  test "Should.root() is :should" do
    assert Should.root() == :should
  end

end
