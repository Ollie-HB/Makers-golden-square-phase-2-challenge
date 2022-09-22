1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

record experiences in diary
read past entries
select entries based on time/readings speed
record todo list
record phone numbers from diary entries

2. Design the Class System

Diary class - add(entry), entries                                
DiaryEntry class - title, contents                           

PhoneNumberExtractor class -  init with diary, extract_numbers

DiaryReader class - init with wpm & a diary, find_readable(time)

TaskList class - all
Task class - title


class Diary
    def add(entry) # entry is an instance of DiaryEntry
    end

    def entries
        # returns a list of DiaryEntriies
    end
end

class DiaryEntry
    def init(title, contents) # both are strings
    
    def title
        # returns title as a string
    end

    def contents
        # returns contents as a string
    end
end

class PhoneNumberExtractor
    def init(diary) # diary is an instance of Diary
    end

    def extract_numbers
        # returns list of strings representing phone numbers from all diary entries
    end
end

class DiaryReader
    def init(wpm, diary)
        # wpm is integer representing words user can read per minute
        # diary is an instance of Diary
    end

    def find_readable(time)
        # returns longest readable DiaryEntry based on time available and wpm reading speed
    end
end

class TaskList
    def add(task) # task is an instance of Task
    end

    def all
        # returns a list of all tasks
    end
end

class Task
    def init(title) # title is a string
    end

    def title
        # returns title as a string
    end
end

3. Create Examples as Integration Tests

#1 keeping diary and reading past entries

diary = Diary.new
entry1 = DiaryEntry.new("my_title", "my_contents_1")
entry2 =DiaryEntry.new("my_title", "my_contents_2")
diary.add(entry1)
diary.add(entry2)
expect(diary.entries.to eq [entry1, entry2]

#2 select diary entry based on how much time user has and reading speed (exact)

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



4. Create Examples as Unit Tests

#1 returns empty array for empty Diary

it "empty Diary returns empty array"do
        diary = Diary.new
        expect(diary.entries).to eq []
    end
end



5. Implement the Behaviour

For each example you create as a test, implement the behaviour that allows the class to behave according to your example.

Then return to step 3 until you have addressed the problem you were given. You may also need to revise your design, for example if you realise you made a mistake earlier.