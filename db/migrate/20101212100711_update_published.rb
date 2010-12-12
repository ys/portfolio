
class UpdatePublished < ActiveRecord::Migration
  def self.up
    execute "UPDATE photos SET published = 'true';"
  end

  def self.down
  end
end