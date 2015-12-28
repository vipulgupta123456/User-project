class AddDateToPhones < ActiveRecord::Migration
  def change
add_column :phones, :date, :date
  end

end
