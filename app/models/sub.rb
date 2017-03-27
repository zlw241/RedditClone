# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :string           not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord

  validates :title, :description, :user_id, presence: true
  validates :moderator, presence: true

  belongs_to :moderator,
    class_name: "User",
    foreign_key: :user_id

  has_many :sub_posts,
    dependent: :destroy,
    inverse_of: :sub,
    class_name: "PostSub",
    foreign_key: :sub_id

  has_many :posts,
    through: :sub_posts,
    source: :post
end
