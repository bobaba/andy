class Resource < ApplicationRecord
  has_many :resource_attachments
  accepts_nested_attributes_for :resource_attachments

end
