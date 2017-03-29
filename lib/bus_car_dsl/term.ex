defmodule BusCarDsl.Term do
  use BusCarDsl.Element
  TreeLeaf.rule(:term, :value)
end
