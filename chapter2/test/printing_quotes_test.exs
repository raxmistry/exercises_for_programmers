defmodule PrintingQuotesTest do
  use ExUnit.Case

  test "join quote and author" do
    assert PrintingQuotes.says_quote("Obi-Wan Kenobi", "These aren't the droids you're looking for.") == ~s(Obi-Wan Kenobi says, "These aren't the droids you're looking for.")
  end
end
