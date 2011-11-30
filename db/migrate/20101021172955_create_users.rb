class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      # t.encryptable
      t.confirmable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both

      t.string :first_name, :limit => 100
      t.string :last_name, :limit => 100
      t.string :url, :limit => 250
      t.boolean :deleteable, :default => true
      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
    if ['development','test'].include?('development')
      u = User.create(:email => 'admin@example.com', :password => 'foobar', :password_confirmation => 'foobar')
      u.confirm!
    end

  end

  def self.down
    drop_table :users
  end
end
