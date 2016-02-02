require_relative '../models/address_book'

RSpec.describe AddressBook do

   let(:book) { AddressBook.new }

 def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end

  describe "display_entry" do
   it "checks the first entry" do
     book.import_from_csv("entries.csv")
     first_entry = book.display_entry(0)
     check_entry(first_entry, "Bill", "555-555-4854", "Bill@blocmail.com")
   end

   it "checks for the second entry" do
     book.import_from_csv("entries.csv")
     second_entry = book.get_entry(1)
     check_entry(second_entry, "Bob", "555-555-5415", "bob@blocmail.com" )
   end

    it "checks for the last entry" do
     book.import_from_csv("entries.csv")
     second_entry = book.get_entry.last
     check_entry(last_entry, "Mic", "555-555-3660", "joe@blocmail.com" )
  end
 end

 describe "import_from_csv" do
      it "imports the correct number of entries" do

        book.import_from_csv("entries.csv")
        book_size = book.entries.size
        expect(book_size).to eq 5
      end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
    end

    it "imports the 2nd entry" do
        book.import_from_csv("entries.csv")
        entry_two = book.entries[1]
        check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
      end

      it "imports the 3rd entry" do
        book.import_from_csv("entries.csv")
        entry_three = book.entries[2]
        check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
      end

      it "imports the 4th entry" do
        book.import_from_csv("entries.csv")
        entry_four = book.entries[3]
        check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
      end

      it "imports the 5th entry" do
        book.import_from_csv("entries.csv")
        entry_five = book.entries[4]
        check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
      end
   end
end
