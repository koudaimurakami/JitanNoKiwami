class AddSessionIdentifierToUserAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :user_answers, :session_identifier, :string
  end
end
