class AddPrintableTitleToLyric < ActiveRecord::Migration
  def change
    add_column :lyrics, :printable_title, :string
  end
end
