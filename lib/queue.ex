defmodule Queue do
  use GenServer

  def start_link(queue) do
    GenServer.start_link(__MODULE__, queue)
  end
  def start_link(queue, name) do
    GenServer.start_link(__MODULE__, queue, name: name)
  end

  def add(queue, item) do
    GenServer.cast(queue, {:add, item})
  end
  def add(queue, item, _sync) do
    GenServer.call(queue, {:add, item})
  end

  def get(queue) do
    GenServer.call(queue, :get)
  end

  # GenServer callbacks

  def handle_call(:get, _from, [item | queue]) do
    {:reply, item, queue}
  end
  def handle_call({:add, item}, _from, queue) do
    {:reply, :ok, queue ++ [item]}
  end

  def handle_cast({:add, item}, queue) do
    {:noreply, queue ++ [item]}
  end
end
