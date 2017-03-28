defmodule BusCarDslConstantScoreTest do
  use ExUnit.Case
  doctest BusCarDsl.ConstantScore
  alias BusCarDsl.ConstantScore

  test "constant_score can have a filter" do
    result = ConstantScore.parse([
      :constant_score, :filter,
        :match, "val", "you"
    ], %{})
    assert result == {[], %{
      constant_score: %{
        filter: %{
          match: %{"val" => %{query: "you"}}
        }
      }
    }}
  end
end
