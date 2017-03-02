defmodule CreateBench do
  use Benchfella

  bench "GenServer" do
    {result, _pid} = Queue.start_link(["check email"])
    result
  end

  bench "Agent" do
    {result, _pid} = Queue.start_link(["check_email"])
    result
  end
end
