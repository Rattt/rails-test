require 'spec_helper'

RSpec.describe Book, :type => :model do

  subject(:book){ FactoryGirl.create :book }


  describe 'validation and creating' do

    let(:book_empty_name) { FactoryGirl.build(:book,  name: '') }

    it 'is valid' do
      expect(subject).to be_valid
    end

    it 'is invalid without a name' do
      expect(book_empty_name).not_to be_valid
    end

    it 'is invalid with a duplicated name' do
      new_book = Book.new(name: subject.name)
      expect(new_book).not_to be_valid
    end

  end

end
