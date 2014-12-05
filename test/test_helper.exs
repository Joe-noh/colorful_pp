ExUnit.start()

defmodule TestHelper do
  import ExUnit.CaptureIO

  alias ColorfulPP.Formatter

  @no_color %Formatter{color: false}

  def capture_formatted(obj) do
    capture_io fn ->
      Formatter.format obj, @no_color
    end
  end
end
