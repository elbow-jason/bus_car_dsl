defmodule BusCarDslConstantScoreTest do
  use ExUnit.Case
  doctest BusCarDsl.ConstantScore
  alias BusCarDsl.ConstantScore

  test "constant_score can have a filter" do
    result = ConstantScore.parse([:constant_score, :filter, :match, "val", "you"], %{})
    assert result == {[], %{
      constant_score: %{
        filter: %{
          match: %{"val" => %{query: "you"}}
        }
      }
    }}
  end
  
  test "stems() returns all :constant_score stems" do
    assert ConstantScore.stems() == [:filter]
  end

  test "ConstantScore.root() is :constant_score" do
    assert ConstantScore.root() == :constant_score
  end

end
