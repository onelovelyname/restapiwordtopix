class DropColumnFromTable < ActiveRecord::Migration

remove_column :photos, :word_id

end
