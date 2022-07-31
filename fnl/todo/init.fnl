(let [fetch (require :todo.fetch)
      update (require :todo.update)]
  {:fetch_todos fetch.fetch_todos
   :insert_todo update.insert_todo
   :complete_todo update.complete_todo})
