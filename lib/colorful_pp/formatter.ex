alias ColorfulPP.Colorizer

defprotocol ColorfulPP.Formatter do
  @fallback_to_any true
  def format(obj)
end

defimpl ColorfulPP.Formatter, for: Atom do
  def format(obj), do: IO.puts Colorizer.atom(inspect obj)
end

defimpl ColorfulPP.Formatter, for: BitString do
  def format(obj), do: IO.puts Colorizer.bitstring(inspect obj)
end

defimpl ColorfulPP.Formatter, for: Integer do
  def format(obj), do: IO.puts Colorizer.integer(inspect obj)
end

defimpl ColorfulPP.Formatter, for: Float do
  def format(obj), do: IO.puts Colorizer.float(inspect obj)
end

defimpl ColorfulPP.Formatter, for: Range do
  def format(obj), do: IO.puts Colorizer.range(inspect obj)
end

defimpl ColorfulPP.Formatter, for: Regex do
  def format(obj), do: IO.puts Colorizer.regex(inspect obj)
end

defimpl ColorfulPP.Formatter, for: Function do
  def format(obj), do: IO.puts Colorizer.function(inspect obj)
end

defimpl ColorfulPP.Formatter, for: PID do
  def format(obj), do: IO.puts Colorizer.pid(inspect obj)
end

defimpl ColorfulPP.Formatter, for: Reference do
  def format(obj), do: IO.puts Colorizer.reference(inspect obj)
end

defimpl ColorfulPP.Formatter, for: Tuple do
  def format(obj) do
    IO.inspect obj
  end
end

defimpl ColorfulPP.Formatter, for: List do
  def format(obj) do
    IO.inspect obj
  end
end

defimpl ColorfulPP.Formatter, for: Map do
  def format(obj) do
    IO.inspect obj
  end
end

defimpl ColorfulPP.Formatter, for: HashSet do
  def format(obj) do
    IO.inspect obj
  end
end

defimpl ColorfulPP.Formatter, for: HashDict do
  def format(obj) do
    IO.inspect obj
  end
end

defimpl ColorfulPP.Formatter, for: Stream do
  def format(obj) do
    IO.inspect obj
  end
end

defimpl ColorfulPP.Formatter, for: Any do
  def format(obj) do
    IO.inspect obj
  end
end

