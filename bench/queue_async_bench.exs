defmodule QueueAsyncBench do
  use Benchfella

  before_each_bench _ do
    Queue.start_link(["check email"])
  end

  after_each_bench pid do
    Process.exit(pid, :normal)
    :ok
  end

  bench "add", [pid: bench_context] do
    Queue.add(pid, "check elixir forum")
  end

  bench "get sync", [pid: bench_context] do
    Queue.add(pid, "check elixir forum")
    Queue.get(pid)
    :ok
  end
end
