defmodule BusCarDslMustNotTest do
  use ExUnit.Case
  doctest BusCarDsl.MustNot
  alias BusCarDsl.MustNot

  test "must_not list" do
    result = MustNot.parse([:must_not, :term, "name", 34], [])
    expected = [%{term: %{"name" => %{value: 34}}}]
    assert result == {[], expected}
  end

  test "query bool must_not ... " do
    result = BusCarDsl.parse([:query, :bool, :must_not, :term, "name", 34])
    expected = %{query: %{bool: %{must_not: [%{term: %{"name" => %{value: 34}}}]}}}
    assert result == expected
  end

end
