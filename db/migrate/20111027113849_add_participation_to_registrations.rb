class AddParticipationToRegistrations < ActiveRecord::Migration
  def self.up
    add_column :registrations, :participation, :integer, :default => 0
  end

  def self.down
    remove_column :registrations, :participation
  end
end
