class AddAttachmentToArticles < ActiveRecord::Migration
  def self.up
      add_attachment :articles, :pics
  end

  def self.down
    remove_attachment :articles, :pics
  end
end
