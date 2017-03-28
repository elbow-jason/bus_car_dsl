defmodule BusCarDsl.Bool do
  use BusCarDsl

  branch_list_rule(:bool, :must)
  branch_list_rule(:bool, :must_not)
  branch_list_rule(:bool, :should)
  branch_list_rule(:bool, :filter)

end
