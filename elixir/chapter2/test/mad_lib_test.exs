defmodule MadLibTest do
  
  use ExUnit.Case

  test "should_print_story" do
    assert MadLib.print_story("dog", "walk", "blue", "quickly") == ~s(Do you walk your blue dog quickly? That's hilarious!)
  end
  
  test "should_replace_newline" do
    assert MadLib.replace_trailing_newline("test\n") == "test"
  end
end
