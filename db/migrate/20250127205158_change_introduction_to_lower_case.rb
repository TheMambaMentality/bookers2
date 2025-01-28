class ChangeIntroductionToLowerCase < ActiveRecord::Migration[6.1]
  def up
    rename_column :users, :Introduction, :introduction
  end

  def down
    rename_column :users, :introduction, :Introduction
  end
end