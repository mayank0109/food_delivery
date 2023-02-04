class CreateHours < ActiveRecord::Migration[7.0]
  def change
    create_view :hours
  end
end
