require 'spec_helper'

describe Question do
  it 'should have many question_answers' do
    question = Question.create!(
      survey_id: 1,
      question: 'What is the air speed of an unladened swallow',
    )

    expect(question.question_answers).to eq []

    answer1 = question.question_answers.create!(
      the_answer: 'African or European?'
    )

    question.question_answers.reload
    expect(question.question_answers).to eq [answer1]

    answer2 = QuestionAnswer.create!(
      question: question,
      the_answer: 'Thats easy!'
    )

    question.question_answers.reload
    expect(question.question_answers).to eq [answer1, answer2]
  end

end

