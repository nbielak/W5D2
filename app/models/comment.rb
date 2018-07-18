# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  content    :text             not null
#  user_id    :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :content, presence:true
  
  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User
    
  belongs_to :post,
    foreign_key: :post_id,
    class_name: :Post
end
