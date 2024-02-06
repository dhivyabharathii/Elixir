defmodule EcommerceWeb.CartLive.Index do
  use Phoenix.LiveComponent
  alias EcommerceWeb.CartLive.ProductItem

  def mount(_params,_session,socket) do
    {:ok, assign(socket, total_items: 0)}
  end

  def handle_params(params, _,socket) do
    name= params["name"] || "guest"
    {:noreply, assign(socket, name: name)}
  end

  def render(assigns) do
    ~H"""
    Hii <%= @name %> <%= self() |> :erlang.pid_to_list() %>
    <div >
    <h2> Shopping Cart - Total Items: <%= @total_items %></h2>
      <.live_component :for={id <- 1..3} module={ProductItem} id={id} />
    </div>
    """

  end

  def handle_info(:add, socket) do
    {:noreply, update(socket, :total_items, &(&1 + 1))}
  end
end
