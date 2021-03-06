defmodule BusCarDslRangeTest do
  use ExUnit.Case
  doctest BusCarDsl.Range
  alias BusCarDsl.Range

  test "range less than" do
    result = Range.parse([:range, "name", :lt, 6], %{})
    map = %{range: %{"name" => %{lt: 6}}}
    assert result == {[], map }
  end

  test "range greater than" do
    result = Range.parse([:range, "name", :gt, 6], %{})
    map = %{range: %{"name" => %{gt: 6}}}
    assert result == {[], map }
  end

  test "range greater than or equal" do
    result = Range.parse([:range, "name", :gte, 6], %{})
    map = %{range: %{"name" => %{gte: 6}}}
    assert result == {[], map }
  end

  test "range less than or equal" do
    result = Range.parse([:range, "name", :lte, 6], %{})
    map = %{range: %{"name" => %{lte: 6}}}
    assert result == {[], map }
  end

  test "range with atom as field" do
    result = Range.parse([:range, :name, :lte, 6], %{})
    map = %{range: %{name: %{lte: 6}}}
    assert result == {[], map }
  end

  test "range with list as accumulator" do
    result = Range.parse([:range, :name, :lte, 6], [])
    list = [%{range: %{name: %{lte: 6}}}]
    assert result == {[], list }
  end


  test "range compound query" do
    result = Range.parse([:range, "name", :lte, 6, :gte, 3], %{})
    map = %{range: %{"name" => %{lte: 6, gte: 3}}}
    assert result == {[], map }
  end

  test "stems() returns the :range stems" do
    assert Range.stems() == []
  end
  
  test "Range.root() is :range" do
    assert Range.root() == :range
  end

end
