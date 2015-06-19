get '/surveys' do
	# @surveys = Survey.all
	erb :survey_index
end

get '/surveys/new' do
	erb :new_survey_form
end

post '/surveys' do
	# survey = Survey.new(
	# 	title: params[:title],
	# 	user_id: session[:user_id]
	# 	)

	if survey.save
		redirect "/surveys/#{survey.id}/questions/new"
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

put 'surveys/:id' do
	# surveys#update
	# updates a specific photo
	# redirects to desired page
		# (usually '/surveys/:id' => updated changes to specific photo)
end

delete '/surveys/:id' do
	# surveys#destroy
	# deletes a specific photo
	# redirects to desired page
		# (usually '/surveys' => updated list without deleted photo)
end
