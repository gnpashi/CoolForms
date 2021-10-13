class Form < ApplicationRecord
    has_many :form_questions, dependent: :destroy
    has_many :questions, through: :form_questions
    has_many :responses, dependent: :destroy
    accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: proc { |attribute| attribute['title'].blank? }

end
