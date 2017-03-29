defmodule BusCarDsl.Bool do
  use BusCarDsl.Element

  TreeBranchList.rule(:bool, :must)
  TreeBranchList.rule(:bool, :must_not)
  TreeBranchList.rule(:bool, :should)
  TreeBranchList.rule(:bool, :filter)

end
