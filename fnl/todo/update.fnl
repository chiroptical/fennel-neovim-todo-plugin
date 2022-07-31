(let [sqlite (require :ljsqlite3)
      insert_todo (fn []
                    :docstring
                    (let [todo_description (vim.fn.input "Enter your description: ")
                          db (sqlite.open :todo.db)]
                      (db:exec (.. "INSERT INTO todo_list(description) VALUES('"
                                   todo_description "');"))
                      (db:close)))
      complete_todo (fn []
                      :docstring
                      (let [db (sqlite.open :todo.db)
                            current_todos (db:exec "SELECT * FROM todo_list WHERE completed = 'No';")]
                        (each [index item (ipairs (. current_todos 2))]
                          ; TODO: tostring prints 1LL but it would be nice if it was 1
                          (print (.. (tostring (. (. current_todos 1) index))
                                     ": " item)))
                        ; TODO: vim.fn.input accepts anything...
                        (local selection
                               (vim.fn.input "Which one did you finish? "))
                        (db:exec (.. "UPDATE todo_list SET completed = 'Yes' WHERE id = "
                                     selection " AND completed = 'No';"))
                        (db:close)))]
  {: insert_todo : complete_todo})
