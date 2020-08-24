# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
    user1 = User.create!(name: 'Travis')
    user2 = User.create!(name: 'Donald')
    user3 = User.create!(name: 'McNick')
    user4 = User.create!(name: 'OldNick')
    user5 = User.create!(name: 'BigGreen')

  Poll.destroy_all
    poll1 = Poll.create!(author: user1, title: 'foods')
    poll2 = Poll.create!(author: user2, title: 'religions')
    poll3 = Poll.create!(author: user2, title: 'colors')
    poll4 = Poll.create!(author: user4, title: 'iPhone models')
    poll5 = Poll.create!(author: user5, title: 'quests')

  Question.destroy_all
    q1 = Question.create!(poll: poll1, qtext: 'What''s your favorite food?')
    q2 = Question.create!(poll: poll1, qtext: 'Do you cook?')
    q3 = Question.create!(poll: poll1, qtext: 'Hot sauce?')
    q4 = Question.create!(poll: poll2, qtext: 'Are you religious?')
    q5 = Question.create!(poll: poll2, qtext: 'Does God exist?')
    q6 = Question.create!(poll: poll2, qtext: 'What happens when we die?')
    q7 = Question.create!(poll: poll3, qtext: 'What''s your favorite color?')
    q8 = Question.create!(poll: poll4, qtext: 'Do you iPhone?')
    q9 = Question.create!(poll: poll4, qtext: 'How many pages is your homescreen?')
    q10 = Question.create!(poll: poll5, qtext: 'What kind of quest?')
    q11 = Question.create!(poll: poll5, qtext: 'Where''s the princess?')
    q12 = Question.create!(poll: poll5, qtext: 'Where''s the beef?')

  AnswerChoice.destroy_all
    a1 = AnswerChoice.create!(question: q1, atext: 'pizza')
    a2 = AnswerChoice.create!(question: q1, atext: 'avocado')
    a3 = AnswerChoice.create!(question: q2, atext: 'yes')
    a4 = AnswerChoice.create!(question: q2, atext: 'no')
    a5 = AnswerChoice.create!(question: q3, atext: 'Cholula')
    a6 = AnswerChoice.create!(question: q3, atext: 'never')
    a7 = AnswerChoice.create!(question: q3, atext: 'I guess sometimes')
    a8 = AnswerChoice.create!(question: q4, atext: 'Of course not')
    a9 = AnswerChoice.create!(question: q4, atext: 'I''m spiritual')
    a10 = AnswerChoice.create!(question: q4, atext: 'Jewish')
    a11 = AnswerChoice.create!(question: q4, atext: 'Protestant')
    a12 = AnswerChoice.create!(question: q5, atext: 'He must')
    a13 = AnswerChoice.create!(question: q5, atext: 'someone''s out to get me')
    a14 = AnswerChoice.create!(question: q5, atext: 'no')
    a15 = AnswerChoice.create!(question: q6, atext: 'we get our own planet')
    a16 = AnswerChoice.create!(question: q6, atext: 'idk')
    a17 = AnswerChoice.create!(question: q7, atext: 'blue')
    a18 = AnswerChoice.create!(question: q8, atext: 'iYes')
    a19 = AnswerChoice.create!(question: q8, atext: 'I''m not a fascist')
    a20 = AnswerChoice.create!(question: q9, atext: '1')
    a21 = AnswerChoice.create!(question: q9, atext: '2')
    a22 = AnswerChoice.create!(question: q9, atext: '3+')
    a23 = AnswerChoice.create!(question: q10, atext: 'HUGE')
    a24 = AnswerChoice.create!(question: q10, atext: 'grow turnips')
    a25 = AnswerChoice.create!(question: q11, atext: 'another castle')
    a26 = AnswerChoice.create!(question: q11, atext: 'this castle')
    a27 = AnswerChoice.create!(question: q11, atext: 'she''s dead')
    a28 = AnswerChoice.create!(question: q12, atext: 'rotting out back')
    a29 = AnswerChoice.create!(question: q12, atext: 'in the cow')
    a30 = AnswerChoice.create!(question: q12, atext: 'rotting in the cow out back')

  Response.destroy_all
    r1 = Response.create!(respondent: user1, answer_choice: a17)
    r2 = Response.create!(respondent: user1, answer_choice: a8)
    r3 = Response.create!(respondent: user1, answer_choice: a14)
    r4 = Response.create!(respondent: user1, answer_choice: a15)
    r5 = Response.create!(respondent: user2, answer_choice: a2)
    r6 = Response.create!(respondent: user2, answer_choice: a3)
    r7 = Response.create!(respondent: user2, answer_choice: a5)
    r8 = Response.create!(respondent: user3, answer_choice: a9)
    r9 = Response.create!(respondent: user3, answer_choice: a13)
    r10 = Response.create!(respondent: user3, answer_choice: a16)
    r11 = Response.create!(respondent: user3, answer_choice: a18)
    r12 = Response.create!(respondent: user3, answer_choice: a22)
    r13 = Response.create!(respondent: user5, answer_choice: a23)
    r14 = Response.create!(respondent: user5, answer_choice: a26)
    r15 = Response.create!(respondent: user5, answer_choice: a29)

end