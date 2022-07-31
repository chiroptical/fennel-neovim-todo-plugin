(let [sqlite (require :ljsqlite3)
      fetch_todos (fn []
                    :docstring
                    (let [db (sqlite.open :todo.db)
                          items (db:exec "SELECT * FROM todo_list WHERE completed = 'No';")]
                      (each [_ value (ipairs (. items 2))]
                        (print value))
                      (db:close)))]
  {: fetch_todos})
