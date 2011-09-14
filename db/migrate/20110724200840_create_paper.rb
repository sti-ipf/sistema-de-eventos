class CreatePaper < ActiveRecord::Migration
  def self.up
   create_table :papers do |t|
      t.string :title
      t.string :author
      t.string :coauthor
      t.text :resume
      t.string :key_words
      t.integer :paper_type
      t.string :artefact_file_name
      t.string :artefact_content_type
      t.integer :artefact_file_size
      t.datetime :artefact_updated_at
      t.integer :culture_circle
      t.references :registration, :null => false
      t.integer :status
      t.timestamps
    end
    
  end

  def self.down
    drop_table :papers
  end
end

