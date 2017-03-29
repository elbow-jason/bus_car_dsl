defmodule BusCarDslTermTest do
  use ExUnit.Case
  doctest BusCarDsl.Term
  alias BusCarDsl.Term

  test "parse :term map" do
    result = Term.parse([:term, "name", "jason"], %{})
    assert result == {[], %{term: %{"name" => %{value: "jason"}}}}
  end

  test "parse :term list" do
    result = Term.parse([:term, "name", "json"], [])
    assert result == {[], [%{term: %{"name" => %{value: "json"}}}]}
  end

  test "stems() returns the :term stems" do
    assert Term.stems() == [:value]
  end

  test "Term.root() is :term" do
    assert Term.root() == :term
  end


end
