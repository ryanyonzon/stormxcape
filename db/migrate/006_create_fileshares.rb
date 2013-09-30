class CreateFileshares < ActiveRecord::Migration
  def self.up
    create_table :fileshares do |t|
    end
  end

  def self.down
    drop_table :fileshares
  end
end
