class CreateBootsyImageGalleries < ActiveRecord::Migration
  def change
    create_table :bootsy_image_galleries do |t|
      t.references :bootsy_resource,plymorphic: true
    end
  end
end
