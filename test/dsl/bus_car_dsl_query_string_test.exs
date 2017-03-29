defmodule BusCarDslQueryStringTest do
  use ExUnit.Case
  doctest BusCarDsl.QueryString
  alias BusCarDsl.QueryString

  test "query_string map" do
    result = QueryString.parse([:query_string, "jason AND ruby"], %{})
    assert result == {[],  %{query_string: %{query: "jason AND ruby"}}}
  end

  test "stems() returns the :query_string stems" do
    assert QueryString.stems() == [] # there are no stems for query_string
  end
  
  test "QueryString.root() is :prefix" do
    assert QueryString.root() == :query_string
  end

end
