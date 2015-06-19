get '/surveys/:id/questions/new' do
  @survey = Survey.find(params[:id])
  p @survey
  erb :question_answer_form
end

post '/surveys/:id/questions' do
  survey = Survey.find(params[:id])
  question = Question.new(question: params[:question], survey_id: params[:id])

  if question.save
    answer1 = QuestionAnswer.new(the_answer: params[:answer1], question_id: question.id)
    answer2 = QuestionAnswer.new(the_answer: params[:answer2], question_id: question.id)
    answer3 = QuestionAnswer.new(the_answer: params[:answer3], question_id: question.id)

    answers = [answer1, answer2, answer3]
    answers.each do |answer|
      if !answer.save
        @error = "Invalid Answer!"
        erb :question_answer_form
      end
    end

    if request.xhr?
      content_type :html
      return (erb :_question_answer_form, layout: !request.xhr?, locals: {survey: survey})
    else
      redirect "/surveys/#{survey.id}"
    end
  else
    @error = "Invalid Question!"
    erb :question_answer_form
  end

end
