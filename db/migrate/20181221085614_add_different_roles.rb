class AddDifferentRoles < ActiveRecord::Migration[5.2]
  def change
    arr = [:admin, :power_user, :user]
    arr.each do |role|
      Role.create! name: role
    end
  end
end
