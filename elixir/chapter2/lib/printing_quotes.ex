defmodule PrintingQuotes do

  def says_quote_with_input() do
    quote = IO.gets "What is the quote?"
    author = IO.gets "Who said it?"
    says_quote(author, quote)
  end

  def says_quote(author, quote) do
    author <> " says, " <> ~s(") <> quote <> ~s(")
  end
end

