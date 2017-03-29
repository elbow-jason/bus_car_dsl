defmodule BusCarDsl.Should do
  use BusCarDsl.Element

  @key :should

  TreeList.rule(@key, :match)
  TreeList.rule(@key, :term)
  TreeList.rule(@key, :exists)
  TreeList.rule(@key, :prefix)
  TreeList.rule(@key, :wildcard)
  TreeList.rule(@key, :range)
  TreeList.rule(@key, :fuzzy)
  TreeList.rule(@key, :regexp)

end
