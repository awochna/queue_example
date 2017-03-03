defmodule QueueAgentBench do
  use Benchfella

  before_each_bench _ do
    QueueAgent.start_link(["check email"])
  end

  after_each_bench pid do
    Process.exit(pid, :normal)
    :ok
  end

  bench "add sync", [pid: bench_context] do
    QueueAgent.add(pid, "check elixir forum", :sync)
  end

  bench "get", [pid: bench_context] do
    QueueAgent.add(pid, "check elixir forum", :sync)
    QueueAgent.get(pid)
    :ok
  end
end
