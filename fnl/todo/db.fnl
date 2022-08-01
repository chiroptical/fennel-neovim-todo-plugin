(local sqlite (require :ljsqlite3))

(fn with-db [action]
  (let [db (sqlite.open :todo.db)]
    (action db)
    (db:close)))

{: with-db}
