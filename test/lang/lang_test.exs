defmodule JpKatsuyouTest do
  use ExUnit.Case
  alias JpKatsuyou.Lang

  describe "Lang" do

    test "shift/2 transforms the character to specific column" do
      assert Lang.shift("あ", :i) == "い"
      assert Lang.shift("い", :i) == "い"
      assert Lang.shift("う", :i) == "い"
      assert Lang.shift("い", :u) == "う"
    end

    test "shift_suffix/2 transforms the suffix character to specific column" do
      assert Lang.shift_suffix("話す", :i) == "話し"
      assert Lang.shift_suffix("変える", :i) == "変えり"
      assert Lang.shift_suffix("登る", :a) == "登ら"
      assert Lang.shift_suffix("聞く", :a) == "聞か"
    end

  end
end
