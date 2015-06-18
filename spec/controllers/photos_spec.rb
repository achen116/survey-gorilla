require 'spec_helper'

# utilize binding.pry in test code if need to debug

describe 'index controller' do

  describe 'GET /' do
    it '' do
      get '/'
      # test for status
      # test for content type
      # test for body
    end
  end

  describe 'POST /' do
    it '' do
      post '/'
      # test for status
      # test for content type
      # test for location (since post is supposed to redirect)
    end
  end

end