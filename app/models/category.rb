# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name_en    :string(255)      default(""), not null
#  name_ja    :string(255)      default(""), not null
#

class Category < ApplicationRecord
  validates :name_en, presence: true, length: { maximum: 32 }
  validates :name_ja, presence: true, length: { maximum: 32 }
  has_many :slides, dependent: false
  def name
    if I18n.locale.to_s == 'ja'
      name_ja
    else
      name_en
    end
  end
end
