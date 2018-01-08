defmodule JpKatsuyou.Verb.Dict do

  alias JpKatsuyou.Lang

  defmacro __using__(_) do
    quote do

      def dic_present(%{kumi: "ichidan", verb: verb}) do
        verb
      end
      def dic_present(%{kumi: "godan", verb: verb}) do
        verb
      end
      def dic_present(%{kumi: "irregular", verb: verb}) do
        verb
      end

      def dic_present_negative(%{kumi: "ichidan", verb: verb}) do
        verb
        |> String.replace_suffix("る", "ない")
      end
      def dic_present_negative(%{kumi: "godan", verb: verb}) do
        verb
        |> Lang.shift_suffix(:a)
        |> String.replace_suffix("", "ない")
      end
      def dic_present_negative(%{kumi: "irregular", verb: verb}) do
        case verb do
          "する" -> "しない"
          "来る" -> "来ない"
        end
      end

      def dic_past(%{kumi: "ichidan", verb: verb}) do
        verb
        |> String.replace_suffix("る", "た")
      end
      def dic_past(%{kumi: "godan", verb: verb}) do
        verb
        |> Lang.shift_suffix(:i)
        |> String.replace_suffix("", "た")
      end
      def dic_past(%{kumi: "irregular", verb: verb}) do
        case verb do
          "する" -> "した"
          "来る" -> "来た"
        end
      end

      def dic_order(%{kumi: "ichidan", verb: verb}) do
        verb
        |> Lang.shift_suffix(:o)
      end
      def dic_order(%{kumi: "godan", verb: verb}) do
        verb
        |> Lang.shift_suffix(:e)
      end
      def dic_order(%{kumi: "irregular", verb: verb}) do
        case verb do
          "する" -> "しろ"
          "来る" -> "来い"
        end
      end
      defdelegate dic_imperative(map), to: __MODULE__, as: :dic_order

      def dic_conditional(%{kumi: "ichidan", verb: verb}) do
        verb
        |> String.replace_suffix("る", "れば")
      end
      def dic_conditional(%{kumi: "godan", verb: verb}) do
        verb
        |> Lang.shift_suffix(:e)
        |> String.replace_suffix("", "ば")
      end
      def dic_conditional(%{kumi: "irregular", verb: verb}) do
        case verb do
          "する" -> "すれば"
          "来る" -> "来れば"
        end
      end

      def dic_conditional_negative(%{verb: verb}) do
        verb
        |> dic_present_negative
        |> String.replace_suffix("い", "ければ")
      end

    end
  end
end
