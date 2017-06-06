defmodule BusCarDslSourceTest do
  use ExUnit.Case
  doctest BusCarDsl.Source
  alias BusCarDsl.Source

  test "parse :source string map accumulates correctly" do
    assert Source.parse([:source, "name"], %{}) == {[], %{source: "name"}}
  end

  test "parse :source list map accumulates correctly" do
    assert Source.parse([:source, ["one", "two"]], %{}) == {[], %{source: ["one", "two"]}}
  end

  test "parse :source :includes list map accumulates correctly" do
    assert Source.parse([:source, :includes, ["one", "two"]], %{}) == {[], %{source: %{includes: ["one", "two"]}}}
  end

  test "parse :source :excludes list map accumulates correctly" do
    assert Source.parse([:source, :excludes, ["one", "two"]], %{}) == {[], %{source: %{excludes: ["one", "two"]}}}
  end

  test "parse :source :excludes and includes list map accumulates correctly" do
    assert Source.parse([:source, :excludes, ["one", "two"], :includes, ["three"]], %{}) == {[], %{source: %{excludes: ["one", "two"], includes: ["three"]}}}
  end


  test "stems() returns the :should stems" do
    assert Source.stems() ==  [:excludes, :includes]
  end

  test "Source.root() is :source" do
    assert Source.root() == :source
  end

end
