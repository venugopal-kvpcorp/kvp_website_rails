class AddRepaymentCheckboxAndMinMaxValueToRefineryPages < ActiveRecord::Migration
  def change
  	add_column :refinery_pages, :allow_repayment_widget, :boolean, :default => false, :null => false
  	add_column :refinery_pages, :minimum_value, :float
  	add_column :refinery_pages, :maximum_value, :float
  	add_column :refinery_pages, :default_value, :float
  end
end
