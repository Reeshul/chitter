feature "when reading peeps" do
  scenario "they should be shown in reverse chronological order" do
    Peep.create(message: "Peep test message 1")
    Peep.create(message: "Peep test message 2")
    Peep.create(message: "Peep test message 3")
    visit("/")
    page.find("#peeps_container div:first-child", text: "Peep test message 3")
    page.find("#peeps_container div:last-child", text: "Peep test message 1")
  end
end