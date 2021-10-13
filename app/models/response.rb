class Response < ApplicationRecord
  default_scope {order(:created_at)}
  belongs_to :form
  has_many :questions
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: proc { |attribute| attribute['content'].blank? }

end
