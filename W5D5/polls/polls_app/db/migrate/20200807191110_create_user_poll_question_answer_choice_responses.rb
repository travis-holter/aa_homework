class CreateUserPollQuestionAnswerChoiceResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, unique: true

      t.datetime
    end

    create_table :polls do |t|
      t.integer :user_id, null: false
      t.string :title, null: false

      t.datetime
    end 
    add_index :polls, :user_id
    
    create_table :questions do |t|
      t.integer :poll_id, null: false
      t.string :qtext, null: false

      t.datetime
    end 
    add_index :questions, :poll_id
    
    create_table :answer_choices do |t|
      t.integer :question_id, null: false
      t.string :atext, null: false

      t.datetime
    end
    add_index :answer_choices, :question_id
    
    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :answer_choice_id, null: false

      t.datetime
    end
    add_index :responses, :user_id
    add_index :responses, :answer_choice_id
  end
end