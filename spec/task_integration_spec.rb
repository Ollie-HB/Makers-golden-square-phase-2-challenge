require_relative "../lib/task"
require_relative "../lib/task_list"

RSpec.describe "task and task list integration" do
    it "adds tasks to task list" do
        task_list = TaskList.new
        task_1 = Task.new("learn to code")
        task_2 = Task.new("learn more coding")
        task_list.add(task_1)
        task_list.add(task_2)
        expect(task_list.all).to eq [task_1, task_2]
    end
end