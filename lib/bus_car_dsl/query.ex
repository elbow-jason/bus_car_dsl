defmodule BusCarDsl.Query do
  use BusCarDsl.Element

  TreeMap.rule(:query, :bool)
  TreeMap.rule(:query, :nested)
  TreeMap.rule(:query, :constant_score)
  TreeMap.rule(:query, :query_string)
  TreeMap.rule(:query, :match)
end
