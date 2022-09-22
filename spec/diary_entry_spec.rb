require_relative "../lib/diary_entry"

RSpec.describe DiaryEntry do

    it " constructs" do
        diary_entry = DiaryEntry.new("title", "contents")
        expect(diary_entry.title).to eq "title"
        expect(diary_entry.contents).to eq "contents"
    end
end