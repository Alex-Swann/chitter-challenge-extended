
feature 'Sign Up' do

  scenario 'user can sign up using form' do
    sign_up
    user = User.first
    expect(page).to have_content "Welcome #{user.user_name}"
  end

  scenario "doesn't allow duplicate user_names" do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
  end

  scenario "doesn't allow duplicate emails" do
    sign_up
    expect{ sign_up(user_name: 'Lex') }.not_to change(User, :count)
  end

  scenario 'user with same name and password can still sign up' do
    sign_up
    expect{ sign_up(user_name: 'Lex', email: 'howdy@yahoo.com') }
          .to change(User, :count).by 1
  end

  scenario 'make sure emails are checked and validated' do
    expect{ sign_up(email: 'invalid@email') }.not_to change(User, :count)
  end

  scenario 'email is required' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'password is required' do
    expect{ sign_up(password: nil) }.not_to change(User, :count)
  end

  scenario 'name is required' do
    expect{ sign_up(name: nil) }.not_to change(User, :count)
  end

  scenario 'user_name is required' do
    expect{ sign_up(user_name: nil) }.not_to change(User, :count)
  end
end