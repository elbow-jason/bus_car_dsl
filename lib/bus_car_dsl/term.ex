defmodule BusCarDsl.Term do
  use BusCarDsl.Tree.Leaf
  leaf_rule(:term, :value)
end
