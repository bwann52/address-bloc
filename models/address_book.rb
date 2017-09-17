require_relative 'entry' #tell Ruby to lad the library named entry.rb

class AddressBook
    attr_reader :entries
    
    def initialize
        @entries = []
    end

    def add_entry(name, phone_number, email)
        index = 0 #variable to store insertion index
        entries.each do |entry|
            if name < entry.name #compare name with name of current entry, if name lexi-order preceeds entry.name, we would find the inde to insert at
                break
            end
            index+=1 #index increase until location found
        end
        #insert new entry using calculated index
        entries.insert(index, Entry.new(name, phone_number,email))
    end


end
