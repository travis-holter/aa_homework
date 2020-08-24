# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#
class Response < ApplicationRecord
    validates :answer_choice_id, presence: true
    validates :user_id, presence: true

    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: :AnswerChoice

    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    has_one :question,
        through: :answer_choice,
        source: :question

    def not_duplicate_response
        siblings = self.sibling_responses
        siblings.each { |response| return false if self.id == response.id }
        true
    end

    def sibling_responses
        self.question.responses.where.not('responses.id = ?', self.id )
    end
end

