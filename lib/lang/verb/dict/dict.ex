defmodule JpKatsuyou.Verb.Dict do
  defmacro __using__(_) do
    quote do

      def dic_past(%{kumi: "ichidan", verb: verb}) do
        IO.puts("dic past #{verb}")
      end
      def dic_past(%{kumi: "godan", verb: verb}) do
        IO.puts("dic past #{verb}")
      end
      def dic_past(%{kumi: "irregular", verb: verb}) do
        IO.puts("dic past #{verb}")
      end

      def dic_present(%{kumi: "ichidan", verb: verb}) do
        IO.puts("dic past #{verb}")
      end
      def dic_present(%{kumi: "godan", verb: verb}) do
        IO.puts("dic past #{verb}")
      end
      def dic_present(%{kumi: "irregular", verb: verb}) do
        IO.puts("dic past #{verb}")
      end

      def dic_present do
      end

    end
  end
end
