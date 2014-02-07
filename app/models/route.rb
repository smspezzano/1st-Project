# == Schema Information
#
# Table name: routes
#
#  id                :integer          not null, primary key
#  startLocation     :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  endLocation       :string(255)
#  roadGradeStrategy :string(255)
#

class Route < ActiveRecord::Base
 belongs_to :user

 validates :startLocation, presence: true
 validates :endLocation, presence: true
 validates :roadGradeStrategy, presence: true
 validates :user_id, presence: true

end
