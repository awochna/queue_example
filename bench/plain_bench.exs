defmodule PlainBench do
  use Benchfella

  bench "add" do
    ["check email"] ++ ["check elixir forum"]
  end

  bench "get" do
    [item | queue] = ["check email", "check elixir forum"]
    item
  end
end
