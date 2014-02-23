class AddReferencetoPhotos < ActiveRecord::Migration

def change
    add_column :photos, :word_id, :integer
end

end
