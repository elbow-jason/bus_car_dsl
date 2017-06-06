defmodule BusCarDslSizeTest do
  use ExUnit.Case
  doctest BusCarDsl.Size
  alias BusCarDsl.Size

  test "parse :size num map accumulates correctly" do
    assert Size.parse([:size, 100], %{}) == {[], %{size: 100}}
  end

  test "stems() returns the :size stems" do
    assert Size.stems() ==  []
  end

  test "Size.root() is :size" do
    assert Size.root() == :size
  end

  test "compound :size parse works" do
    expected = %{
      size: 1,
      query: %{
        bool: %{
          must: [
            %{match: %{"name" => %{query: "jason"}}}
          ]
        }
      }
    }
    body = [:query, :bool, :must, :match, "name", "jason", :size, 1]
    assert BusCarDsl.parse(body) == expected
  end



end
