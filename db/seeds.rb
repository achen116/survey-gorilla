require 'faker'

20.times do
  User.create(
    name: Faker::Name.first_name,
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    password_hash: Faker::Lorem.characters(7)
    )

end


20.times do
  userid = (1..20).to_a.sample
  Survey.create(
    user_id: userid,
    survey_name: Faker::Lorem.word
    )
end


10.times do
  userid = (1..20).to_a.sample
  surveyid = (1..20).to_a.sample
  SurveyTaker.create(
    user_id: userid,
    survey_id: surveyid
    )
end




50.times do
  surveyid = (1..20).to_a.sample
  Question.create(
    survey_id: surveyid,
    question: Faker::Lorem.sentence
    )
end


100.times do
  questionid = (1..50).to_a.sample
  QuestionAnswer.create(
    question_id: questionid,
    the_answer: Faker::Lorem.word,
    times_chosen: rand(100)
    )
end

30.times do
  questionid = (1..50).to_a.sample
  userid = (1..20).to_a.sample
  answer = (1..100).to_a.sample

  ChosenAnswer.create(
    survey_taker_id: userid,
    question_id: questionid,
    question_answer_id: answer
    )

end

















