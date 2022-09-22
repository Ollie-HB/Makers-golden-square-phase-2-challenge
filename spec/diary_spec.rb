require_relative "../lib/diary"

RSpec.describe Diary do

    it "empty Diary returns empty array"do
        diary = Diary.new
        expect(diary.entries).to eq []
    end
end