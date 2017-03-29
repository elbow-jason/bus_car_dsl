defmodule BusCarDsl.ConstantScore do
  use BusCarDsl.Element

  TreeMap.rule(:constant_score, :filter)

end
