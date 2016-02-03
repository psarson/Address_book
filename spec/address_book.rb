require_relative '../models/address_book'

RSpec.describe AddressBook do

   let(:book) { AddressBook.new }

 def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end

#### ---> Start, CSV Tests <---- ####

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

#### ----> Start, User Generated CSV Tests <---- ####

   describe "import from csv_2" do
    it "imports the correct number of entries from csv_2" do

       book.import_from_csv("entries_2.csv")
       book_size = book.entries.size
       expect(book_size).to eq 4
     end

    it "imports the 1st entry" do
     book.import_from_csv("entries_2.csv")
     entry_one = book.entries[0]
     check_entry(entry_one, "Beth", "432-321-2222", "beth@sanchez.com")
    end

    it "imports the 2nd entry" do
       book.import_from_csv("entries_2.csv")
       entry_two = book.entries[1]
       check_entry(entry_two, "Jerry", "433-322-2211", "jerry@hotmail.com")
     end

     it "imports the 3rd entry" do
       book.import_from_csv("entries_2.csv")
       entry_three = book.entries[2]
       check_entry(entry_three, "Mortimer", "443-332-2221", "morty@gmail.com")
     end

     it "imports the 4th entry" do
       book.import_from_csv("entries_2.csv")
       entry_four = book.entries[3]
       check_entry(entry_four, "Rick", "444-333-2222", "rickster@gmail.com")
     end
  end

#### ------> Start Binary Search Tests <----- ###

  describe "#binary_search" do
    it "searches AddressBook for a non-existent entry" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Dan")
      expect(entry).to be_nil
    end

  it "searches AddressBook for Bill" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bill")
      expect(entry).to be_a Entry
      check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
    end
    it "searches AddressBook for Bob" do
        book.import_from_csv("entries.csv")
        entry = book.binary_search("Bob")
        expect(entry).to be_a Entry
        check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
      end

      it "searches AddressBook for Joe" do
        book.import_from_csv("entries.csv")
        entry = book.binary_search("Joe")
        expect(entry).to be_a Entry
        check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
      end

      it "searches AddressBook for Sally" do
        book.import_from_csv("entries.csv")
        entry = book.binary_search("Sally")
        expect(entry).to be_a Entry
        check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
      end

      it "searches AddressBook for Sussie" do
        book.import_from_csv("entries.csv")
        entry = book.binary_search("Sussie")
        expect(entry).to be_a Entry
        check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
      end
    end

### ----> Start Iterative_Search <---- ####

    describe "iterative_search" do
      it "searches AddressBook for a non-existent entry" do
        book.import_from_csv("entries.csv")
        entry = book.binary_search("Dan")
        expect(entry).to be_nil
      end

    it "searches AddressBook for Bill" do
        book.import_from_csv("entries.csv")
        entry = book.iterative_search("Bill")
        expect(entry).to be_a Entry
        check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
      end
      it "searches AddressBook for Bob" do
          book.import_from_csv("entries.csv")
          entry = book.iterative_search("Bob")
          expect(entry).to be_a Entry
          check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
        end

        it "searches AddressBook for Joe" do
          book.import_from_csv("entries.csv")
          entry = book.iterative_search("Joe")
          expect(entry).to be_a Entry
          check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
        end

        it "searches AddressBook for Sally" do
          book.import_from_csv("entries.csv")
          entry = book.iterative_search("Sally")
          expect(entry).to be_a Entry
          check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
        end

        it "searches AddressBook for Sussie" do
          book.import_from_csv("entries.csv")
          entry = book.iterative_search("Sussie")
          expect(entry).to be_a Entry
          check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
        end
      end

end
