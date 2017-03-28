defmodule BusCarDsl.Type.String do
  @behaviour BusCarDsl.Type 
  def type,       do: :string
  def properties, do: nil
end
