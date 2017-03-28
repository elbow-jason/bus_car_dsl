defmodule BusCarDslNestedTest do
  use ExUnit.Case
  doctest BusCarDsl.Nested
  alias BusCarDsl.Nested

  test "nested needs path" do
    dsl = [:nested, :path, "category", :query, :bool, :must, :match, "name", "jules"]
    result = Nested.parse(dsl, %{})
    assert result == {[], %{
      nested: %{
        path: "category",
        query: %{
          bool: %{
            must: [
              %{match: %{"name" => %{query: "jules"}}}
            ]
          }
        }
      }
    }}
  end

end
