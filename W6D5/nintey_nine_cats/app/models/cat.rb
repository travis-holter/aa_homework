# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    COLORS = ["white", "black", "orange", "purple"]
    validates :color, inclusion: COLORS, presence: true 
    validates :sex, inclusion: ["M", "F"], presence: true 
    validates :name, presence: true 
    validates :birth_date, presence: true 
    validates :description, presence: true 
    

    include ActionView::Helpers::DateHelper
    def age
        time_ago_in_words(self.birth_date)
    end
end
