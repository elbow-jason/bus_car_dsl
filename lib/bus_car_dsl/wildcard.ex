defmodule BusCarDsl.Wildcard do
  use BusCarDsl.Tree.Leaf
  leaf_rule(:wildcard, :value)
end
