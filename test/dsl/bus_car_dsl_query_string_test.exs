defmodule BusCarDslQueryStringTest do
  use ExUnit.Case
  doctest BusCarDsl.QueryString
  alias BusCarDsl.QueryString

  test "query_string map" do
    result = QueryString.parse([:query_string, "jason AND ruby"], %{})
    assert result == {[],  %{query_string: %{query: "jason AND ruby"}}}
  end

  test "stems() returns the :prefix stems" do
    assert QueryString.stems() == []
  end
  
  test "Prefix.root() is :prefix" do
    assert QueryString.root() == :query_string
  end

end
