defmodule BusCarDslMustTest do
  use ExUnit.Case
  doctest BusCarDsl.Must
  alias BusCarDsl.Must

  test "must_not list" do
    result = Must.parse([:must, :term, "name", 34], [])
    expected = [%{term: %{"name" => %{value: 34}}}]
    assert result == {[], expected}
  end

  test "query bool must ... " do
    result = BusCarDsl.parse([:query, :bool, :must, :term, "name", 34])
    expected = %{query: %{bool: %{must: [%{term: %{"name" => %{value: 34}}}]}}}
    assert result == expected
  end

end
