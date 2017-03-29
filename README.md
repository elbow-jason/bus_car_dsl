# BusCarDsl
[![Build Status](https://travis-ci.org/elbow-jason/bus_car_dsl.svg?branch=master)](https://travis-ci.org/elbow-jason/bus_car_dsl)

**A Domain Specific Language for composing ElasticSearch queries without all the nesting.**


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bus_car_dsl` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:bus_car_dsl, "~> 0.1.2"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bus_car_dsl](https://hexdocs.pm/bus_car_dsl).

## Examples

```elixir
iex> BusCarDsl.parse([:query, :bool, :must, :range, "age", :gte, 18, :must_not, :match, "likes", "dogs", [boost: 2.0], :fuzzy, "name", "jason", [fuzziness: 2]])
%{query: %{bool: %{must: [%{range: %{"age" => %{gte: 18}}}],
      must_not: [%{fuzzy: %{"name" => %{fuzziness: 2, value: "jason"}}},
       %{match: %{"likes" => %{boost: 2.0, query: "dogs"}}}]}}}
```