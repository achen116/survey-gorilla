get '/surveys' do
	@surveys = Survey.all
	erb :survey_index
end

get '/surveys/new' do
	erb :new_survey_form
end

post '/surveys' do
	p "*" * 100
	p params
	p "*" * 100
	survey = Survey.new(
		survey_name: params[:survey_name],
		user_id: session[:user_id]
		)

	if survey.save
		content_type :html
		return (erb :_question_answer_form, layout: !request.xhr?, locals: {survey: survey})
	else
		@error = "Invalid!"
		erb :new_survey_form
	end
end



get '/surveys/:id' do
	@survey = Survey.find(params[:id])
	erb :single_survey_view
end

get '/surveys/:id/edit' do
	# surveys#edit
	# returns an HTML form for editing a photo
	# erb :to_the_html_edit_form_view
end

# put 'surveys/:id' do
# 	# surveys#update
# 	# updates a specific photo
# 	# redirects to desired page
# 		# (usually '/surveys/:id' => updated changes to specific photo)
# end

post '/surveys/:id' do
	p "here is parsed"
	array = params[:content].split('&')
	array.map!{|pair| pair.split('=')}
	hash = Hash[array]

	p params
	answer = ChosenAnswer.new(survey_taker_id: session[:user_id], question_id: hash["question_id"].to_i, question_answer_id: hash["answer_choice"].to_i)
	if answer.save
		# redirect "/"
		p "youre answer saved!"
	else
		@errors = answer.errors
	end
end




delete '/surveys/:id' do
	# surveys#destroy
	# deletes a specific photo
	# redirects to desired page
		# (usually '/surveys' => updated list without deleted photo)
end
