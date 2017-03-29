defmodule BusCarDslQueryTest do
  use ExUnit.Case
  doctest BusCarDsl.Query
  alias BusCarDsl.Query

  test "parse :query :bool map" do
    result = Query.parse([:query, :bool, :must, :match, "val", "you"], %{})
    assert result == {[], %{
      query: %{
        bool: %{
          must: [%{
            match: %{
              "val" => %{
                query: "you"
              }
            }
          }],
        }
      }
    }}
  end

  test "parse :query :nested map" do
    q = [:query, :nested, :path, "category", :query, :bool, :must, :match, "name", "jules"]
    result = Query.parse(q, %{})
    assert result ==  {[], %{query:
      %{nested: %{path: "category", query: %{bool: %{must: [%{match: %{"name" => %{query: "jules"}}}]}}}}
    }}
  end

  test "parse :query :constant_score map" do
    q = [:query, :constant_score, :filter, :match, "val", "you"]
    result = Query.parse(q, %{})
    assert result == {[], %{query: %{constant_score: %{filter: %{match: %{"val" => %{query: "you"}}}}}}}
  end

  test "parse :query :query_string map" do
    q = [:query, :query_string, "jason OR wildman"]
    result = Query.parse(q, %{})
    assert result == {[], %{query: %{query_string: %{query: "jason OR wildman"}}}}
  end

  test "parse :query :match map" do
    q = [:query, :match, "name", "wildman"]
    result = Query.parse(q, %{})
    assert result == {[], %{query: %{match: %{"name" => %{query: "wildman"}}}}}
  end

  test "stems() returns the :query stems" do
    assert Query.stems() == [:match, :query_string, :constant_score, :nested, :bool]
  end
  
  test "Query.root() is :query" do
    assert Query.root() == :query
  end

end
