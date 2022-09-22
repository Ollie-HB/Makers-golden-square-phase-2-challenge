require_relative "../lib/diary"
require_relative "../lib/diary_entry"
require_relative "../lib/diary_reader"
require_relative "../lib/phone_number_extractor"


RSpec.describe "integration for diary / phone number extractor" do
    
    it "adds DiaryEntries to Diary and records them in an array" do
        diary = Diary.new
        entry1 = DiaryEntry.new("my_title", "my_contents_1")
        entry2 =DiaryEntry.new("my_title", "my_contents_2")
        diary.add(entry1)
        diary.add(entry2)
        expect(diary.entries).to eq [entry1, entry2]
    end

    it "selects diary entry based on how much time user has and reading speed (exact)" do
        diary = Diary.new
        diary_reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("title1", "one")
        entry_2 = DiaryEntry.new("title1", "one two")
        entry_3 = DiaryEntry.new("title1", "one two three")
        entry_4 = DiaryEntry.new("title1", "one two three four")
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        diary.add(entry_4)
        expect(diary_reader.find_readable(2)).to eq entry_4
    end

    it "selects diary entry based on how much time user has and reading speed (not exact)" do
        diary = Diary.new
        diary_reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("title1", "one")
        entry_2 = DiaryEntry.new("title1", "one two")
        entry_3 = DiaryEntry.new("title1", "one two three")
        entry_4 = DiaryEntry.new("title1", "one two three four five")
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        diary.add(entry_4)
        expect(diary_reader.find_readable(2)).to eq entry_3
    end

    it "returns nil when there are no readable entries" do
        diary = Diary.new
        diary_reader = DiaryReader.new(1, diary)
        entry_1 = DiaryEntry.new("title1", "one two three")
        entry_2 = DiaryEntry.new("title1", "one two three")
        entry_3 = DiaryEntry.new("title1", "one two three")
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        expect(diary_reader.find_readable(1)).to eq nil
    end

    it "returns nil when there are no entries in the diary" do
        diary = Diary.new
        diary_reader = DiaryReader.new(1, diary)
        expect(diary_reader.find_readable(1)).to eq nil
    end

    it "fails when wpm is invalid (0 or less)" do
        diary = Diary.new
        diary_reader = DiaryReader.new(0, diary)
        entry_1 = DiaryEntry.new("title1", "one two three")
        diary.add(entry_1)
        expect{ diary_reader.find_readable(1) }.to raise_error "WPM must be above 0."
    end

    it "finds and records unique phone numbers from diary entries" do
        diary = Diary.new
        phone_numbers = PhoneNumberExtractor.new(diary)
        entry_1 = DiaryEntry.new("title1", "one two three")
        entry_2 = DiaryEntry.new("title1", "my mate 07000000001")
        entry_3 = DiaryEntry.new("title1", "my pal 07000000001")
        entry_4 = DiaryEntry.new("title1", "my mates 07000000002 07000000003")
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        diary.add(entry_4)
        expect(phone_numbers.extract_numbers).to eq [
            "07000000001",
            "07000000002", 
            "07000000003"
        ]
    end

        it "doesn't extract invalid numbers" do
            diary = Diary.new
            phone_numbers = PhoneNumberExtractor.new(diary)
            entry_1 = DiaryEntry.new("title1", "one two three")
            entry_2 = DiaryEntry.new("title1", "my mate 070000001")
            entry_3 = DiaryEntry.new("title1", "my pal 08890000011")
            entry_4 = DiaryEntry.new("title1", "my mates 07000000002 07000000003")
            diary.add(entry_1)
            diary.add(entry_2)
            diary.add(entry_3)
            diary.add(entry_4)
            expect(phone_numbers.extract_numbers).to eq [
                "07000000002", 
                "07000000003"
            ]
         end
end

