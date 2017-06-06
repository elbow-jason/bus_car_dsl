defmodule BusCarDslFromTest do
  use ExUnit.Case
  doctest BusCarDsl.From
  alias BusCarDsl.From

  test "parse :from num map accumulates correctly" do
    assert From.parse([:from, 100], %{}) == {[], %{from: 100}}
  end

  test "stems() returns the :from stems" do
    assert From.stems() ==  []
  end

  test "From.root() is :from" do
    assert From.root() == :from
  end

  test "compound :From parse works" do
    expected = %{
      from: 200,
      size: 100,
      query: %{
        bool: %{
          must: [
            %{match: %{"name" => %{query: "jason"}}}
          ]
        }
      }
    }
    body = [:query, :bool, :must, :match, "name", "jason", :from, 200, :size, 100]
    assert BusCarDsl.parse(body) == expected
  end



end
