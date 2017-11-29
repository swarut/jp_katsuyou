defmodule JpKatsuyou.Verb.Dict do
  defmacro __using__(_) do
    quote do

      def dic_past do
        IO.puts("dic past")
      end

    end
  end
end
