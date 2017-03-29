defmodule DslBoolTest do
  use ExUnit.Case
  doctest BusCarDsl.Bool
  alias BusCarDsl.Bool

  test "parse :bool :must map accumulates correctly" do
    result = Bool.parse([:bool, :must, :term, "apples", "oranges"], %{})
    expected = %{
      bool: %{
        must: [
          %{term: %{"apples" => %{value: "oranges"}}}
        ]
      }
    }
    assert result == {[], expected}
  end

  test "parse :bool :must_not map accumulates correctly" do
    result = Bool.parse([:bool, :must_not, :term, "apples", "oranges"], %{})
    expected = %{
      bool: %{
        must_not: [
          %{term: %{"apples" => %{value: "oranges"}}}
        ]
      }
    }
    assert result == {[], expected}
  end

  test "parse :bool :should map accumulates correctly" do
    result = Bool.parse([:bool, :should, :term, "apples", "oranges"], %{})
    expected = %{
      bool: %{
        should: [
          %{term: %{"apples" => %{value: "oranges"}}}
        ]
      }
    }
    assert result == {[], expected}
  end

  test "parse :bool :filter map  accumulates correctly" do
    result = Bool.parse([:bool, :filter, :term, "apples", "oranges"], %{})
    expected = %{
      bool: %{
        filter: [
          %{term: %{"apples" => %{value: "oranges"}}}
        ]
      }
    }
    assert result == {[], expected}
  end

  test "stems() returns all :bool stems" do
    assert Bool.stems() == [:filter, :should, :must_not, :must]
  end

  test "Bool.root() is :bool" do
    assert Bool.root() == :bool
  end

end
