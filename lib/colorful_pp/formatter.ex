alias ColorfulPP.Colorizer
alias ColorfulPP.Formatter, as: F
import ColorfulPP.Utils

defprotocol ColorfulPP.Formatter do
  defstruct indent: 0, color: true

  @fallback_to_any true
  def format(obj, opts \\ %__MODULE__{})
end

defimpl ColorfulPP.Formatter, for: Atom do
  def format(obj, %F{indent: n, color: true}) do
    IO.puts indent(n) <> Colorizer.atom(inspect obj)
  end

  def format(obj, %F{indent: n, color: false}) do
    IO.puts indent(n) <> inspect(obj)
  end
end

defimpl ColorfulPP.Formatter, for: BitString do
  def format(obj, %F{indent: n, color: true}) do
    IO.puts indent(n) <> Colorizer.bitstring(inspect obj)
  end

  def format(obj, %F{indent: n, color: false}) do
    IO.puts indent(n) <> inspect(obj)
  end
end

defimpl ColorfulPP.Formatter, for: Integer do
  def format(obj, %F{indent: n, color: true}) do
    IO.puts indent(n) <> Colorizer.integer(inspect obj)
  end

  def format(obj, %F{indent: n, color: false}) do
    IO.puts indent(n) <> inspect(obj)
  end
end

defimpl ColorfulPP.Formatter, for: Float do
  def format(obj, %F{indent: n, color: true}) do
    IO.puts indent(n) <> Colorizer.float(inspect obj)
  end

  def format(obj, %F{indent: n, color: false}) do
    IO.puts indent(n) <> inspect(obj)
  end
end

defimpl ColorfulPP.Formatter, for: Range do
  def format(obj, %F{indent: n, color: true}) do
    IO.puts indent(n) <> Colorizer.range(inspect obj)
  end

  def format(obj, %F{indent: n, color: false}) do
    IO.puts indent(n) <> inspect(obj)
  end
end

defimpl ColorfulPP.Formatter, for: Regex do
  def format(obj, %F{indent: n, color: true}) do
    IO.puts indent(n) <> Colorizer.regex(inspect obj)
  end

  def format(obj, %F{indent: n, color: false}) do
    IO.puts indent(n) <> inspect(obj)
  end
end

defimpl ColorfulPP.Formatter, for: Function do
  def format(obj, %F{indent: n, color: true}) do
    IO.puts indent(n) <> Colorizer.function(inspect obj)
  end

  def format(obj, %F{indent: n, color: false}) do
    IO.puts indent(n) <> inspect(obj)
  end
end

defimpl ColorfulPP.Formatter, for: PID do
  def format(obj, %F{indent: n, color: true}) do
    IO.puts indent(n) <> Colorizer.pid(inspect obj)
  end

  def format(obj, %F{indent: n, color: false}) do
    IO.puts indent(n) <> inspect(obj)
  end
end

defimpl ColorfulPP.Formatter, for: Reference do
  def format(obj, %F{indent: n, color: true}) do
    IO.puts indent(n) <> Colorizer.reference(inspect obj)
  end

  def format(obj, %F{indent: n, color: false}) do
    IO.puts indent(n) <> inspect(obj)
  end
end

defimpl ColorfulPP.Formatter, for: Tuple do
  def format(obj, opts) do
    IO.inspect obj
  end
end

defimpl ColorfulPP.Formatter, for: List do
  def format(obj, opts = %F{indent: n}) do
    IO.puts indent(n) <> "["
    Enum.each obj, fn e ->
      F.format e, %F{opts | indent: n+2}
    end
    IO.puts indent(n) <> "]"
  end
end

defimpl ColorfulPP.Formatter, for: Map do
  def format(obj, opts) do
    IO.inspect obj
  end
end

defimpl ColorfulPP.Formatter, for: HashSet do
  def format(obj, opts) do
    IO.inspect obj
  end
end

defimpl ColorfulPP.Formatter, for: HashDict do
  def format(obj, opts) do
    IO.inspect obj
  end
end

defimpl ColorfulPP.Formatter, for: Stream do
  def format(obj, opts) do
    IO.inspect obj
  end
end

defimpl ColorfulPP.Formatter, for: Any do
  def format(obj, %F{indent: n}) do
    IO.puts indent(n) <> inspect(obj)
  end
end

