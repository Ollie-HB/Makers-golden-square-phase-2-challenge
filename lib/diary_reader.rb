
class DiaryReader
    def initialize(wpm, diary)
        @wpm = wpm
        @diary = diary
    end

    def find_readable(time)
        readable_entries = @diary.entries.reject do |entry|
            calculate_reading_time(entry) > time
        end
            readable_entries.max_by do |entry|
                count_words(entry)
            end
    end


    private

    def calculate_reading_time(entry)
        fail "WPM must be above 0." if @wpm <= 0
     return (count_words(entry) / @wpm.to_f).ceil
    end

    def count_words(entry)
        return entry.contents.split(" ").length
    end
end