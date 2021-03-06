describe "Unregistered user can visit the root page" do
  it "sees what it is supposed to see in the header" do
    visit "/"

    expect(page).to have_link "Login"
    expect(page).to have_link "Sign Up"
    expect(page).to have_link "Home"
    expect(page).to have_link "BatteryWiz"
  end

  it "sees what it is supposed to see in the body" do
    visit '/'

    expect(page).to have_link "Solar Installation and Battery Calculator"
    expect(page).to have_css ".hero"
  end
end
