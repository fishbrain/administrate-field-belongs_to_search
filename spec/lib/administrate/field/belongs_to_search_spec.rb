require 'administrate/field/belongs_to_search'

RSpec.describe Administrate::Field::BelongsToSearch do
  let(:page) { :edit }
  let(:post) { create(:post) }
  let(:field) { Administrate::Field::BelongsToSearch.new(:author, post.author, page) }

  describe '#to_partial_path' do
    it 'returns a partial based on the page being rendered' do
      expect(field.to_partial_path).to eq("/fields/belongs_to_search/#{page}")
    end
  end

  describe '#associated_class' do
    it 'return the proper class for an association' do
      expect(field.associated_class).to eq Author
    end

    context 'when association data is nil' do
      let(:field) { Administrate::Field::BelongsToSearch.new(:author, nil, page) }

      it 'should return the proper class' do
        expect(field.associated_class).to eq Author
      end
    end
  end

  describe '#associated_resource_options' do
    it 'should return an array with length 1' do
      expect(field.associated_resource_options.length).to eq 1
    end

    it 'should return an array of arrays' do
      expect(field.associated_resource_options).to all(be_an(Array))
    end

    it 'should return the correct attributes' do
      # do not test name equality, as that varies too much.
      selected = field.associated_resource_options.first
      expect(selected.first).to be_a String
      expect(selected.second).to eq post.author.id
    end

    context 'when association data is nil' do
      let(:field) { Administrate::Field::BelongsToSearch.new(:author, nil, page) }

      it 'should return an empty array' do
        expect(field.associated_resource_options).to eq []
      end
    end
  end
end
