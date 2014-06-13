class Article < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }

  validates :slug, presence: true
  belongs_to :user
  acts_as_taggable_on :tags
  has_attached_file :pics, :styles => { :small => "150x150>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :pics
  validates_attachment_size :pics, :less_than => 5.megabytes
  validates_attachment_content_type :pics, :content_type => ['image/jpeg', 'image/png']
  #attr_accessible :pics
  #has_attached_file :pics, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :pics, :content_type => /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    new_record?
  end
end