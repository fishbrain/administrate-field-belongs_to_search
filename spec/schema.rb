ActiveRecord::Schema.define do
  self.verbose = false

  create_table :authors, force: true do |t|
  end

  create_table :posts, force: true do |t|
    t.integer :author_id
  end
end
