defmodule FormatterTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  import ColorfulPP.Formatter

  @no_color %ColorfulPP.Formatter{color: false}

  defstruct a: nil, b: nil

  test "protocol implemented" do
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

  test "format list" do
    output = capture_io fn ->
      format ["a", "b", ["c"]], @no_color
    end

    expected = """
    [
      "a"
      "b"
      [
        "c"
      ]
    ]
    """

    assert output == expected
  end

  test "format charlist" do
    output = capture_io(fn -> format 'abc', @no_color end)
    assert output == "'abc'\n"
  end
end
