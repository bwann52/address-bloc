require_relative '../models/address_book'

RSpec.describe AddressBook do
    
    # #1 create new instance of the AddressBook model and assign it to the variable named book using the let syntax provided by RSpec. This lets us use book in all our tests
    let(:book) { AddressBook.new }
    
    # #6 a helper method named check_entry which consolidates the redundant code
    def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
end


    describe "attributes" do
        it "responds to entries" do
            expect(book).to respond_to(:entries)
        end
        
        it "initializes entries as an array" do
            expect(book.entries).to be_an(Array)
        end
        
        it "initializes entries as empty" do
            expect(book.entries.size).to eq(0)
        end
    end
    
    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            
            expect(book.entries.size).to eq(1)
        end
        
        it "adds the correct information to entries" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end
    end
    
    #assignemnt
    describe "#remove_entry" do
        it "remove one entry to the address book" do
            book = AddressBook.new
            book.add_entry("A", "B", "C@gmail.com")
            
            name = "Ada Lovelace"
            phone_number = "010.012.1815"
            email_address = "augusta.king@lovelace.com"
            book.add_entry(name, phone_number, email_address)
            
            expect(book.entries.size).to eq(2)
            
            book.remove_entry(name, phone_number, email_address)
            expect(book.entries.size).to eq(1)
            expect(book.entries.first.name).to eq("A") #check the correct one remains
        end
    end
    
    # Test that AddressBook's .import_from_csv() method is working as expected
    describe "#import_from_csv" do
        it "imports the correct number of entries" do
            # #3
            book.import_from_csv("entries.csv")
            book_size = book.entries.size
            
            # Check the size of the entries in AddressBook
            expect(book_size).to eq 5
        end
        
        # #4
        it "imports the 1st entry" do
            book.import_from_csv("entries.csv")
            # Check the first entry
            entry_one = book.entries[0]
            
            # #5

            end
        
        it "imports the 2nd entry" do
            book.import_from_csv("entries.csv")
            # Check the second entry
            entry_two = book.entries[1]
        end
        
        it "imports the 3rd entry" do
            book.import_from_csv("entries.csv")
            # Check the third entry
            entry_three = book.entries[2]
        end
        
        it "imports the 4th entry" do
            book.import_from_csv("entries.csv")
            # Check the fourth entry
            entry_four = book.entries[3]
        end
        
        it "imports the 5th entry" do
            book.import_from_csv("entries.csv")
            # Check the fifth entry
            entry_five = book.entries[4]
        end
    end
    context "import from 2nd csv" do
        it "imports from 2nd cvs correct" do
            book.import_from_csv("entries_2.csv")
            expect(book.entries.size).to eq 3
    end

    end
end
