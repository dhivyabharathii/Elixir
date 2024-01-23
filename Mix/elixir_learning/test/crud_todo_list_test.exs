defmodule CrudTodoListTest do
  use ExUnit.Case, async: true
  import CrudTodoList
  test "crud" do
    list =
      CrudTodoList.new()
      |> CrudTodoList.add_entry(%{date: ~D[2018-01-01], title: "Dinner"})
      |> CrudTodoList.add_entry(%{date: ~D[2018-01-02], title: "Dentist"})
      |> CrudTodoList.add_entry(%{date: ~D[2018-01-02], title: "Meeting"})

    assert [%{date: ~D[2018-01-01], id: 1, title: "Updated"}] ==
             list
             |> CrudTodoList.update_entry(1, fn entry -> %{entry | title: "Updated"} end)
             |> CrudTodoList.entries(%{date: ~D[2018-01-01]})

    assert [] ==
             list
             |> CrudTodoList.delete_entry(1)
             |> CrudTodoList.entries(%{date: ~D[2018-01-01]})
  end
end
