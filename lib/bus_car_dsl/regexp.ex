defmodule BusCarDsl.Regexp do
  use BusCarDsl.Tree.Leaf
  leaf_rule(:regexp, :value)
end
