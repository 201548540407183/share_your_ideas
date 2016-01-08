class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,limit:20,null:false
      t.string :password,null:false
      t.string :email,limit:50,null:false
      #t.string :image,                      comment:"icon"
      #t.integer :right,null:false,default:2
      #t.booleam :admin

      t.timestamps null:false
    end
  add_index :users,:email,unique:true
  end
end
