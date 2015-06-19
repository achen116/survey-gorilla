get '/surveys/:id/questions/new' do
  # @survey = Survey.find(params[:id])
  erb :question_answer_form
end

post '/surveys/:id/questions' do
  # question = Question.new(question: params[:question], survey_id: params[:id])

  if question.save
    # answer1 = Answer.new(answer: params[:answer1], question_id: question.id)
    # answer2 = Answer.new(answer: params[:answer2], question_id: question.id)
    # answer3 = Answer.new(answer: params[:answer3], question_id: question.id)
    answers = [answer1, answer2, answer3]
    answers.each do |answer|
      if !answer.save
        @error = "Invalid Answer!"
        erb :question_answer_form
      end
    end
    redirect "/surveys/:id"
  else
    @error = "Invalid Question!"
    erb :question_answer_form
  end

end
