module UserHelper

  def login_as_donor
    visit root_path
    click_link "Sign Up!"
    click_link "Interested in being a supporter?"

      fill_in 'Name', with: 'Scottie'
      fill_in 'donor_email', with: 'scottiepippen@gmail.com'
      fill_in 'donor_password', with: 'bahbi'
      fill_in 'donor_password_confirmation', with: 'bahbi'

      click_button "Create Donor"
  end

end
