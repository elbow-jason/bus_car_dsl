defmodule BusCarDsl.Wildcard do
  use BusCarDsl.Element
  TreeLeaf.rule(:wildcard, :value)
end
