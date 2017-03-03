defmodule QueueAgentBench do
  use Benchfella

  before_each_bench _ do
    QueueAgent.start_link(["check email"])
  end

  after_each_bench pid do
    Process.exit(pid, :normal)
    :ok
  end

  bench "set", [pid: bench_context] do
    QueueAgent.set(pid, ["check elixir forum"])
  end

  bench "add", [pid: bench_context] do
    QueueAgent.set(pid, ["check elixir forum"])
    QueueAgent.add(pid, "check elixir forum")
  end

  bench "get", [pid: bench_context] do
    QueueAgent.set(pid, ["check elixir forum"])
    QueueAgent.get(pid)
  end
end
