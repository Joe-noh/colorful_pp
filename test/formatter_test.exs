defmodule FormatterTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  import ColorfulPP.Formatter

  defstruct a: nil, b: nil

  test "protocol implemented" do
    capture_io fn ->
      format :atom
      format "bitstring"
      format 1
      format 1.0
      format 1..2
      format ~r/regex/
      format fn -> :function end
      format self
      format make_ref
      format {:tuple}
      format ["list"]
      format 'char_list'
      format %{"type" => "map"}
      format HashSet.new
      format HashDict.new
      format Stream.map(1..2, &(&1))
      format %__MODULE__{}
    end
  end
end
