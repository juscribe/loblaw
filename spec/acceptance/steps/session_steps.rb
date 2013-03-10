# encoding: utf-8

step 'I am a new visitor' do
  @current_user = build(:user)
end

step 'I am a registered user' do
  @current_user = create(:user)
end
