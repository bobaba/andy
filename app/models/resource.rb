class Resource < ApplicationRecord
  has_many :resource_attachments, dependent: :destroy
  validates :binomial, :common, :description, presence: true
  accepts_nested_attributes_for :resource_attachments

end
