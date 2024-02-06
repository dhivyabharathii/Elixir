defmodule EcommerceWeb.CartLive.ProductItem do
  use Phoenix.LiveComponent
  def update(assigns, socket) do
    socket = socket |> assign(assigns) |> assign(amount: 0)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
     <span>
     Product Name <%= @id %>
     </span>
    <button phx-click="add" phx-target={@myself}>+</button>
    </div>
    """
  end

  def handle_event("add", _,socket) do
    send self(), :add
    {:noreply, update(socket, :amount, &(&1 +1))}
  end

end
