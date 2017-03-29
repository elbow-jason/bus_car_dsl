defmodule BusCarDslTest do
  use ExUnit.Case
  doctest BusCarDsl
  alias BusCarDsl, as: Dsl
  alias BusCarDsl.Term
  test "multi bool" do
    assert Dsl.parse([
      :query, :bool,
        :must,      :term,  :age,         33,
        :must_not,  :match, :name,        "beef",
        :should,    :match, :first_name,  "Jason",
        :filter,    :term,  :last_name,   "gold",
    ]) == %{
      query: %{
        bool: %{
          must: [
            %{term: %{age: %{value: 33}}}
          ],
          must_not: [
            %{match: %{name: %{query: "beef"}}}
          ],
          should: [
            %{match: %{first_name: %{query: "Jason"}}}
          ],
          filter: [
            %{term: %{last_name: %{value: "gold"}}}
          ],
        }
      }
    }
  end



  test "tirex example" do
    assert Dsl.parse([
        :query, :nested, :path, "comments",
          :query, :bool, :must,
            :match, "comments.message", "cool",
            :match, "comments.author",  "John",
    ]) == %{
      query: %{
        nested: %{
          path: "comments",
          query: %{
            bool: %{
              must: [
                %{match: %{"comments.author"  => %{query: "John"}}},
                %{match: %{"comments.message" => %{query: "cool"}}},
              ]
            }
          }
        }
      }
    }
  end

  test "query bool must match <field> <term>" do
    expected = %{
      query: %{
        bool: %{
          must: [
            %{
              match: %{
                "field" => %{
                  query: "term"
                }
              }
            }
          ]
        }
      }
    }
    assert Dsl.parse([:query, :bool, :must, :match, "field", "term"]) == expected
  end

  test "query match _all <value>" do
    expected = %{
      query: %{
        match: %{
          _all: "value"
        }
      }
    }
    assert Dsl.parse([:query, :match, :_all, "value"]) == expected
  end

  test "term without options" do
    assert Term.parse([:term, "key1", "value1"], %{}) == {[], %{
      :term => %{
        "key1" => %{value: "value1"},
      }
    }}
  end

  test "term with options" do
    assert Term.parse([
      :term, "key1", "value1", [boost: 2.0]
    ], %{}) == {[], %{
      :term => %{
        "key1" => %{boost: 2.0, value: "value1"}
      }
    }}
  end

  test "multi terms list" do
    assert Term.parse([
      :term, "key1", "value1",
      :term, "key2", "value2"
    ], []) == {[], [
      %{term: %{"key2" => %{value: "value2"}}},
      %{term: %{"key1" => %{value: "value1"}}}
    ]}
  end

  test "multi terms list with options" do
    assert Term.parse([
      :term, "key1", "value1", [boost: 2.0],
      :term, "key2", "value2"
    ], []) == {[], [
      %{term: %{"key2" => %{value: "value2"}}},
      %{term: %{"key1" => %{value: "value1", boost: 2.0}}}
    ]}
  end

  test "multi terms list with mixed options" do
    assert Term.parse([
      :term, "key1", "value1", [boost: 2.0],
      :term, "key2", "value2",
    ], []) == {[], [
      %{term: %{"key2" => %{value: "value2"}}},
      %{term: %{"key1" => %{value: "value1", boost: 2.0}}}
    ]}
  end

  test "multi terms list with all options" do
    assert Term.parse([
      :term, "key1", "value1", [boost: 2.0],
      :term, "key2", "value2", [boost: 1.1]
    ], []) == {[], [
      %{term: %{"key2" => %{value: "value2", boost: 1.1}}},
      %{term: %{"key1" => %{value: "value1", boost: 2.0}}}
    ]}
  end

end
