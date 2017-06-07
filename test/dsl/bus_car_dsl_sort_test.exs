defmodule BusCarDslSortTest do
  use ExUnit.Case
  doctest BusCarDsl.Sort
  alias BusCarDsl.Sort

  test "parse :sort string map accumulates correctly" do
    assert Sort.parse([:sort, "name"], %{}) == {[], %{sort: ["name"]}}
  end

  test "parse :sort string :asc map accumulates correctly" do
    assert Sort.parse([:sort, "name", :asc], %{}) == {[], %{sort: [%{"name" => :asc}]}}
  end

  test "parse :sort string :desc map accumulates correctly" do
    assert Sort.parse([:sort, "name", :desc], %{}) == {[], %{sort: [%{"name" => :desc}]}}
  end

  test "parse :sort string opts map accumulates correctly" do
    assert Sort.parse([:sort, "name", [order: :desc, mode: :max]], %{}) == {[], %{sort: [%{"name" => %{order: :desc, mode: :max}}]}}
  end

  test "parse :sort base works for a complex query" do
    result = BusCarDsl.parse([:query, :query_string, "beef AND carrots", :sort, "name", [order: :desc, mode: :max]])
    expected = %{
      query: %{
        query_string: %{
          query: "beef AND carrots"
        }
      },
      sort: [
        %{"name" => %{order: :desc, mode: :max}}
      ]
    }
    assert result == expected
  end

  test "stems() returns the :sort stems" do
    assert Sort.stems() ==  []
  end

  test "Source.root() is :source" do
    assert Sort.root() == :sort
  end

end
