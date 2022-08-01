(local sql (require :todo.db))

(fn fetch_todos []
  (sql.with-db (fn [db]
                 (local items
                        (db:exec "SELECT * FROM todo_list WHERE completed = 'No';"))
                 (each [_ value (ipairs (. items 2))]
                   (print value)))))

{: fetch_todos}
