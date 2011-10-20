class AddParticipationTypeToRegistrations < ActiveRecord::Migration
  def self.up
    add_column :registrations, :participation_type, :integer, :default => 0
  end

  def self.down
    remove_column :registrations, :participation_type
  end
end
