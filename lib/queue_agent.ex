defmodule QueueAgent do

  def start_link(queue) do
    Agent.start_link(fn -> queue end)
  end
  def start_link(queue, name) do
    Agent.start_link(fn -> queue end, name: name)
  end

  def set(queue, items) do
    Agent.update(queue, fn(_) -> items end)
  end

  def add(queue, item) do
    Agent.cast(queue, fn(state) -> state ++ [item] end)
  end
  def add(queue, item, _sync) do
    Agent.update(queue, fn(state) -> state ++ [item] end)
  end

  def get(queue) do
    Agent.get_and_update(queue, fn([item | state]) -> {item, state} end)
  end
end

