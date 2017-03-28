defmodule BusCarDslQueryTest do
  use ExUnit.Case
  doctest BusCarDsl.Query
  alias BusCarDsl.Query

  test "query can have a bool" do
    result = Query.parse([
      :query, :bool, :must,
        :match, "val", "you"
    ], %{})
    assert result == {[], %{
      query: %{
        bool: %{
          must: [
            %{match: %{"val" => %{query: "you"}}}
          ],
        }
      }
    }}
  end
end
