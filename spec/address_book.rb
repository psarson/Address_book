require_relative '../models/address_book'

RSpec.describe AddressBook do

   let(:book) { AddressBook.new }

   describe "attributes" do
    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      expect(book.entries).to be_a(Array)
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

 describe "get_entry" do
   it "checks the first entry" do
     book.import_from_csv("entries.csv")
     first_entry = book.get_entry(0)
     check_entry(first_entry, "Bill", "555-555-4854", "Bill@blocmail.com")
   end

   it "checks for the second entry"
     book.import_from_csv("entries.csv")
     second_entry = book.get_entry(1)
     check_entry(second_entry, "Charlie", "555-555-6700", "Charlesincharge@gmail.com" )
   end

    it "checks for the last entry"
     book.import_from_csv("entries.csv")
     second_entry = book.get_entry.last
     check_entry(last_entry, "Mic", "555-875-6309", "MicJager@hotmail.com")
  end
 end

 describe "#import_from_csv" do
      it "imports the correct number of entries" do

        book.import_from_csv("entries.csv")
        book_size = book.entries.size


        expect(book_size).to eq 5
      end

    end
  end
