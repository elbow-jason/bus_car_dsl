defmodule BusCarDslFilterTest do
  use ExUnit.Case
  doctest BusCarDsl.Filter
  alias BusCarDsl.Filter


  test "parse :filter :match list accumulates correctly" do
    result = Filter.parse([:filter, :match, "the_key", "the_val"], [])
    assert result == {[], [%{match: %{"the_key" => %{query: "the_val"}}}]}
  end

  test "parse :filter :term list accumulates correctly" do
    result = Filter.parse([:filter, :term, "the_key", "the_val"], [])
    assert result == {[], [%{term: %{"the_key" => %{value: "the_val"}}}]}
  end

  test "parse :filter :exists :field list accumulates correctly" do
    result = Filter.parse([:filter, :exists, :field, "the_val"], [])
    assert result == {[], [%{exists: %{field: "the_val"}}]}
  end

  # TreeList.rule(@key, :regexp)

  test "parse :filter :prefix list accumulates correctly" do
    result = Filter.parse([:filter, :prefix, "some_field", "the_val"], [])
    assert result == {[], [%{prefix: %{"some_field" => %{value: "the_val"}}}]}
  end

  test "parse :filter :wildcard list accumulates correctly" do
    result = Filter.parse([:filter, :wildcard, "some_field", "the_val"], [])
    assert result == {[], [%{wildcard: %{"some_field" => %{value: "the_val"}}}]}
  end

  test "parse :filter :range list accumulates correctly" do
    result = Filter.parse([:filter, :range, "some_field", :gt, 10, :lt, 40], [])
    assert result == {[], [%{range: %{"some_field" => %{gt: 10, lt: 40}}}]}
  end

  test "parse :filter :fuzzy list accumulates correctly" do
    result = Filter.parse([:filter, :fuzzy, "some_field", "beef"], [])
    assert result == {[], [%{fuzzy: %{"some_field" => %{value: "beef"}}}]}
  end

  test "parse :filter :regexp list accumulates correctly" do
    result = Filter.parse([:filter, :regexp, "some_field", "regex_here"], [])
    assert result == {[], [%{regexp: %{"some_field" => %{value: "regex_here"}}}]}
  end
  # TreeMap.rule(@key, :range)
  # TreeMap.rule(@key, :match)
  # TreeMap.rule(@key, :term)

  test "parse :filter :range map accumulates correctly" do
    result = Filter.parse([:filter, :range, "some_field", :gt, 10, :lt, 40], %{})
    assert result == {[], %{filter: %{range: %{"some_field" => %{gt: 10, lt: 40}}}}}
  end

  test "parse :filter :match map accumulates correctly" do
    result = Filter.parse([:filter, :match, "the_key", "the_val"], %{})
    assert result == {[], %{filter: %{match: %{"the_key" => %{query: "the_val"}}}}}
  end

  test "parse :filter :term map accumulates correctly" do
    result = Filter.parse([:filter, :term, "the_key", "the_val"], %{})
    assert result == {[], %{filter: %{term: %{"the_key" => %{value: "the_val"}}}}}
  end

  test "stems() returns the :filter stems" do
    assert Filter.stems() == [
      :term,
      :match,
      :range,
      :regexp,
      :fuzzy,
      :range,
      :wildcard,
      :prefix,
      :exists,
      :term,
      :match,
    ]
  end

  test "Filter.root() is :filter" do
    assert Filter.root() == :filter
  end

end
