# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  user_id    :integer          not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  validates :title, presence: true
  validates :author, presence: true
  validates :subs, presence: { message: "Must have at least one associated sub" }

  belongs_to :author,
    class_name: "User",
    foreign_key: :user_id

  has_many :post_subs,
    dependent: :destroy,
    inverse_of: :post,
    class_name: "PostSub",
    foreign_key: :post_id

  has_many :subs,
    through: :post_subs,
    source: :sub

  has_many :comments

end
