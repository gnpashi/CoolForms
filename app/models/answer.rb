class Answer < ApplicationRecord
  default_scope {joins(:question).order('questions.created_at ASC')}
  belongs_to :form
  belongs_to :question
  belongs_to :response
end
