require 'spec_helper'

describe "Authentication" do

	subject {page}

	describe 'signin page' do 
		before {visit signin_path}

		it {should have_content('New user?')}
	end

end
