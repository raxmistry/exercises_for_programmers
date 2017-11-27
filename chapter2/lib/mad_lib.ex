defmodule MadLib do
  
  def print_story_with_input() do
    noun = IO.gets "Enter a noun:"
    verb = IO.gets "Enter a verb:"
    adjective = IO.gets "Enter an adjective:"
    adverb = IO.gets "Enter an adverb:"

    noun = replace_trailing_newline(noun)
    verb = replace_trailing_newline(verb)
    adjective = replace_trailing_newline(adjective)
    adverb = replace_trailing_newline(adverb)

    print_story(noun, verb, adjective, adverb)
  end

  def replace_trailing_newline(string) do
    string |> String.replace_trailing("\n", "")
  end

  def print_story(noun, verb, adjective, adverb) do
    "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
  end
end
