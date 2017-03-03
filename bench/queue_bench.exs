defmodule QueueBench do
  use Benchfella

  before_each_bench _ do
    Queue.start_link(["check email"])
  end

  after_each_bench pid do
    Process.exit(pid, :normal)
    :ok
  end

  bench "set", [pid: bench_context] do
    Queue.set(pid, ["check elixir forum"])
  end

  bench "add", [pid: bench_context] do
    Queue.set(pid, ["check elixir forum"])
    Queue.add(pid, "check elixir forum")
  end

  bench "get", [pid: bench_context] do
    Queue.set(pid, ["check elixir forum"])
    Queue.get(pid)
  end
end
