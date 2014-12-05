defmodule FormatterTest do
  use ExUnit.Case
  import TestHelper

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

  test "format atom" do
    assert capture_formatted(:atom) == ":atom\n"
  end

  test "format bitstring" do
    assert capture_formatted("string") == ~s("string"\n)
  end

  test "format integer" do
    assert capture_formatted(123) == "123\n"
  end

  test "format float" do
    assert capture_formatted(3.14) == "3.14\n"
  end

  test "format range" do
    assert capture_formatted(1..5) == "1..5\n"
  end

  test "format regex" do
    assert capture_formatted(~r/abc/) == "~r/abc/\n"
  end

  test "format function" do
    assert capture_formatted(& &1) =~ ~r/^#Function<.+>\n$/
  end

  test "format pid" do
    assert capture_formatted(self) =~ ~r/^#PID<.+>\n$/
  end

  test "format reference" do
    assert capture_formatted(make_ref) =~ ~r/^#Reference<.+>\n$/
  end

  test "format list" do
    expected = """
    [
      "a"
      "b"
      [
        "c"
      ]
    ]
    """

    assert expected == capture_formatted(["a", "b", ["c"]])
  end

  test "format charlist" do
    assert capture_formatted('abc') == "'abc'\n"
  end
end
