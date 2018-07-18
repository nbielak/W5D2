# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence:true
  validates :sub_ids, presence: true
  
  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User
    
  has_many :post_subs
  
  has_many :comments
  
  has_many :subs,
    through: :post_subs,
    source: :sub
  

end