# == Schema Information
#
# Table name: users_sign_ins
#
#  id         :integer          not null, primary key
#  e_mail     :string
#  password   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Users::SignIn < ApplicationRecord
end
