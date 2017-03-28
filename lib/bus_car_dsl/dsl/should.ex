defmodule BusCarDsl.Should do
  use BusCarDsl

  @key :should

  list_rule(@key, :match)
  list_rule(@key, :term)
  list_rule(@key, :exists)
  list_rule(@key, :prefix)
  list_rule(@key, :wildcard)
  list_rule(@key, :range)
  list_rule(@key, :fuzzy)
  list_rule(@key, :regexp)

end