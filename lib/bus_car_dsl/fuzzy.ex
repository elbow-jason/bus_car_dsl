defmodule BusCarDsl.Fuzzy do
  use BusCarDsl.Element

  TreeLeaf.rule(:fuzzy, :value)
end
