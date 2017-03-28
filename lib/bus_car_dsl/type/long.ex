#long, integer, short, byte, double, float
defmodule BusCarDsl.Type.Long do
  @behaviour BusCarDsl.Type
  def type,       do: :long
  def properties, do: nil
end
