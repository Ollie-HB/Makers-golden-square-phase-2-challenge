require_relative "../lib/task_list"

RSpec.describe TaskList do

    it "constructs" do
        task_list = TaskList.new
        expect(task_list.all).to eq []
    end  
end