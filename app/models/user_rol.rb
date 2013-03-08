class UserRol < ActiveRecord::Base
  belongs_to :user
  belongs_to :rol
  # attr_accessible :title, :body
end
