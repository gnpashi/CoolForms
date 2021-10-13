class Question < ApplicationRecord
    default_scope {order(:created_at)}
    has_many :form_questions, dependent: :destroy
    has_many :forms, through: :form_questions
    has_many :responses
    has_many :answers, dependent: :destroy

    enum question_type: { string: 0, text: 1 }
end
