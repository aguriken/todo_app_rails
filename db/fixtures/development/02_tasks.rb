tasks = ["A", "B", "C", "D", "E", "F"]
project_id = [1, 1, 2, 2, 3, 3]

6.times do |number|
  Task.seed do |s|
    s.id    = number + 1
    s.title = "task#{tasks[number]}"
    s.description = "task#{tasks[number]}の詳細内容です"
    s.project_id = project_id[number]
  end
end
