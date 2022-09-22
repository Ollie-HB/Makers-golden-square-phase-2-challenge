class TaskList
    def initialize
        @list = []
    end

    def add(task) 
        @list << task
    end

    def all
        return @list
    end
end