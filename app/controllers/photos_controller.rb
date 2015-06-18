get '/photos' do
	# photos#index
	# displays a list of all photos
	# erb :to_the_photos_index_view
end

get '/photos/new' do
	# photos#new
	# returns an HTML form for creating a new photo
	# erb :to_the_html_create_form_view
end

post '/photos' do
	# photos#create
	# creates a new photo
	# redirects to desired page
		# (usually '/photos' => updated list with created photo)
end

get '/photos/:id' do
	# photos#show
	# displays a specific photo
	# erb :to_the_specific_photo_view
end

get '/photos/:id/edit' do
	# photos#edit
	# returns an HTML form for editing a photo
	# erb :to_the_html_edit_form_view
end

put 'photos/:id' do
	# photos#update
	# updates a specific photo
	# redirects to desired page
		# (usually '/photos/:id' => updated changes to specific photo)
end

delete '/photos/:id' do
	# photos#destroy
	# deletes a specific photo
	# redirects to desired page
		# (usually '/photos' => updated list without deleted photo)
end
