require_relative "../lib/task"

RSpec.describe Task do

    it "constructs" do
        task = Task.new("learn to code")
        expect(task.title).to eq "learn to code"
    end
end