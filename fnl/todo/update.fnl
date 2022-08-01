(local sql (require :todo.db))

(fn insert_todo []
  (local todo_description (vim.fn.input "Enter your description: "))
  (sql.with-db (fn [db]
                 (db:exec (.. "INSERT INTO todo_list(description) VALUES('"
                              todo_description "');")))))

(fn complete_todo []
  (sql.with-db (fn [db]
                 (local current_todos
                        (db:exec "SELECT * FROM todo_list WHERE completed = 'No';"))
                 (each [index item (ipairs (. current_todos 2))]
                   (print (.. (tostring (. current_todos 1 index)) ": " item)))
                 (local selection (vim.fn.input "Which one did you finish? "))
                 (db:exec (.. "UPDATE todo_list SET completed = 'Yes' WHERE id = "
                              selection " AND completed = 'No';")))))

{: insert_todo : complete_todo}
