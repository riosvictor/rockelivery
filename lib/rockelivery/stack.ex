defmodule Rockelivery.Stack do
  use GenServer
  # Servidor generico de processamento, que
  # recebe chamadas sincronas ou assincronas
  # Tendo a parte de recepção das mensagens (servidor)
  # e a de envio das mensagens (cliente)

  # Client
  def start_lint(initial_stack) when is_list(initial_stack) do
    GenServer.start_link(__MODULE__, initial_stack)
  end

  def push(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server (Callbacks)
  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  # SYNC
  def handle_call({:push, element}, _from, stack) do
    new_stack = [element | stack]
    {:reply, new_stack, new_stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  # ASYNC
  def handle_cast({:push, element}, stack) do
    {:noreply, [element | stack]}
  end
end
