class AddBooleansToProcedures < ActiveRecord::Migration
  def change
    add_column :procedures, :done_by_clinics, :boolean
    add_column :procedures, :done_by_specialists, :boolean
    Procedure.find(:all).each do |p|
      p.done_by_clinics = true
      p.done_by_specialists = true
      p.save
    end
  end
end