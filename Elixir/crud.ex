defmodule CrudTodoList do
  defstruct next_id: 1, entries: %{}

  def new(), do: %CrudTodoList{}

  def add_entry(list, entry) do
    entry = Map.put(entry, :id, list.next_id)
    new_entries = Map.put(list.entries, list.next_id, entry)

    %CrudTodoList{list | entries: new_entries, next_id: list.next_id + 1}
  end

  def entries(list, date) do
    list.entries
    |> Map.values()
    |> Enum.filter(fn entry -> entry.date == date end)
  end

  def update_entry(list, entry_id, updater_fun) do
    case Map.fetch(list.entries, entry_id) do
      :error ->
        list

      {:ok, old_entry} ->
        new_entry = updater_fun.(old_entry)
        new_entries = Map.put(list.entries, new_entry.id, new_entry)
        %CrudTodoList{list | entries: new_entries}
    end
  end

  def delete_entry(list, entry_id) do
    %CrudTodoList{list | entries: Map.delete(list.entries, entry_id)}
  end
end


list =
  CrudTodoList.new()
  |> CrudTodoList.add_entry(%{date: ~D[2018-01-01], title: "Dinner"})
  |> CrudTodoList.add_entry(%{date: ~D[2018-01-02], title: "Dentist"})
  |> CrudTodoList.add_entry(%{date: ~D[2018-01-02], title: "Meeting"})
IO.inspect list
IO.inspect CrudTodoList.entries(list,~D[2018-01-02])
IO.inspect list
|> CrudTodoList.update_entry(1, fn entry -> %{entry | title: "Updated"} end)
|> CrudTodoList.entries(~D[2018-01-01])


IO.inspect list
|> CrudTodoList.delete_entry(1)
|> CrudTodoList.entries(~D[2018-01-01])
