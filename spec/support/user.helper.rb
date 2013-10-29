module UserHelper

  def signup_as_donor
    visit root_path
    click_link "Sign Up!"
    click_link "Interested in being a supporter?", match: :first

      fill_in 'Name', with: 'Scottie'
      fill_in 'donor_email', with: 'scottiepippen@gmail.com'
      fill_in 'donor_password', with: 'bahbi'
      fill_in 'donor_password_confirmation', with: 'bahbi'

      click_button "Create Supporter Profile"
  end

  def signup_as_candidate
    visit root_path
    click_link "Sign Up!"
    click_link "Interested in applying for a scholarship?", match: :first

      fill_in 'Name', with: 'Derrick Rose'
      fill_in 'candidate_email', with: 'derrickrose@gmail.com'
      fill_in 'candidate_password', with: 'numberone'
      fill_in 'candidate_password_confirmation', with: 'numberone'

      click_button "Create Candidate Profile"
  end


end


