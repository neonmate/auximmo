class CreateServiceStates < ActiveRecord::Migration
  def change
    create_table :service_states do |t|
      t.string :state
      t.text :comment
      t.string :immobile_identifier
      t.timestamps
    end
  end
end
