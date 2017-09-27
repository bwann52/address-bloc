require_relative 'entry' #tell Ruby to lad the library named entry.rb
require "csv"

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
    
    # The method starts by reading the file, using  File.read. The file will be in a CSV format. We use the CSV class to parse the file. The result of CSV.parse is an object of type CSV::Table.
    def import_from_csv(file_name)
        csv_text = File.read(file_name)
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
        # #8  iterate over the CSV::Table object's rows. On the next line we create a hash for each row. We convert each row_hash to an Entry by using the add_entry method which will also add the Entry to the AddressBook's entries.
        csv.each do |row|
            row_hash = row.to_hash
            add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
        end
    end
    
    def remove_entry(name, phone_number, email)
        del_entry = nil
        
        entries.each do |entry|
            if name == entry.name && phone_number == entry.phone_number && email == entry.email
            del_entry = entry
            end
        end
        
        entries.delete(del_entry)
        end

end
