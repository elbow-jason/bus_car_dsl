defmodule BusCarDslQueryStringTest do
  use ExUnit.Case
  doctest BusCarDsl.QueryString
  alias BusCarDsl.QueryString

  test "query_string map" do
    result = QueryString.parse([:query_string, ".jason"], %{})
    assert result == {[],  %{query_string: %{query: ".jason"}}}
  end

  # test "regexp list" do
  #   result = QueryString.parse([:query_string, "name", ".json"], [])
  #   assert result == {[], [%{query_string: %{"name" => %{value: ".json"}}}]}
  # end
end
