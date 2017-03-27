# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#



class PostSub < ApplicationRecord

  validates :post, :sub, presence: true
  # validates :post_id, uniqueness: { scope: :sub_id }

  belongs_to :sub
  belongs_to :post
end
