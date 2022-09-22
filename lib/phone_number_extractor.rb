class PhoneNumberExtractor
    def initialize(diary)
        @diary = diary
    end

    def extract_numbers
       return @diary.entries.flat_map do |entry|
            get_numbers(entry)
        end.uniq
    end

    private

    def get_numbers(entry)
        return entry.contents.scan(/07[0-9]{9}/)
    end
end