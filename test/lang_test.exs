defmodule JpKatsuyouTest do
  use ExUnit.Case
  alias JpKatsuyou

  describe "lang" do

    test "shift/2 transform the right character" do
      assert JpKatsuyou.shift("あ", :i) == "い"
    end

    test "shift_suffix/2 transforms the suffix character" do
      assert JpKatsuyou.shift_suffix("話す", :i) == "話し"
    end

  end
end
