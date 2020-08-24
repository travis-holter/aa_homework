# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  question_id :integer          not null
#  atext       :string           not null
#
class AnswerChoice < ApplicationRecord
    validates :question_id, presence: true
    validates :atext, presence: true

    belongs_to :question,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :Question

    has_one :response,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: :Response

end
