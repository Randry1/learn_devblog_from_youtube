class AddIndexPostToPictures < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :post, foreign_key: true
  end
end
