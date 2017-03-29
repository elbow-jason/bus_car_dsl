defmodule BusCarDsl.Regexp do
  use BusCarDsl.Element

  TreeLeaf.rule(:regexp, :value)
end
