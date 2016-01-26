def search(url)
  $driver.manage.timeouts.implicit_wait = 10

  RSpec.describe "Search Bar" do
    before(:all) do
      @search_bar = $driver.find_element(id: "search_bar")
    end
    it "is present" do
      expect(@search_bar)

    end
    it "has correct header" do
      expect(@search_bar.find_element(tag_name: "h2").text).to eq("Search Jobs")

    end
    it "has form element posting to Search Results" do
      search_form = @search_bar.find_element(tag_name: "form")
      expect(search_form.attribute("name")).to eq("search_jobs")
      expect(search_form.attribute("action")).to eq("#{$root_url}search-results")
      expect(search_form.attribute("method")).to eq("post")
    end
    it "has search button" do
      search_button = @search_bar.find_element(class: "btn")
      expect(search_button.displayed?).to be_truthy
      expect(search_button.attribute("type")).to eq("submit")
      expect(search_button.attribute("value")).to eq("Search")
    end
    it "has text input field" do
      input = @search_bar.find_element(name: "search_bar")
      expect(input.attribute("type")).to eq("text")
    end
    it "has Industry dropdown with correct options" do
      industry_dropdown = @search_bar.find_element(name: "search_category")
      expect(industry_dropdown.tag_name).to eq("select")
      p industry_dropdown.text
      industry_options = industry_dropdown.find_elements(tag_name: "option")
      expect(industry_options[0].text).to eq("Industry")
      expect(industry_options[1].attribute("value")).to eq("Engineering-Design-Jobs")
      expect(industry_options[1].text).to eq("Engineering Design")
      expect(industry_options[2].attribute("value")).to eq("Construction-Infrastructure-Jobs")
      expect(industry_options[2].text).to eq("Construction Infrastructure")
      expect(industry_options[3].attribute("value")).to eq("Biotech-Pharma-Medical-Device-Jobs")
      expect(industry_options[3].text).to eq("Biotech Pharma Medical Device")
      expect(industry_options[4].attribute("value")).to eq("Manufacturing-Food-Beverage-Jobs")
      expect(industry_options[4].text).to eq("Manufacturing Food Beverage")


    end
    it "has Location dropdown with correct options" do
      location_dropdown = @search_bar.find_element(name: "search_location")
      expect(location_dropdown.tag_name).to eq("select")
      location_options = location_dropdown.find_elements(tag_name: "option")
      expect(location_options[0].text).to eq("Location")
      expect(location_options[1].text).to eq("Africa")
      expect(location_options[2].text).to eq("Asia")
      expect(location_options[3].text).to eq("Australia-New-Zealand")
      expect(location_options[4].text).to eq("Canada")
      expect(location_options[5].text).to eq("China")
      expect(location_options[6].text).to eq("Europe")
      expect(location_options[7].text).to eq("India")
      expect(location_options[8].text).to eq("Ireland")
      expect(location_options[9].text).to eq("Middle-East")
      expect(location_options[10].text).to eq("UK")

    end
    it "hides Industry dropdown on load" do
      industry_dropdown = @search_bar.find_element(name: "search_category")
      industry_options = industry_dropdown.find_elements(tag_name: "option")
      expect(industry_options[0].displayed?).to be_truthy
      expect(industry_options[1].displayed?).to be_falsey



    end
    it "hides Location dropdown on load" do

    end
    it "shows Industry dropdown on click" do

    end
    it "shows Location dropdown on click" do

    end
    it "changes Industry field when option is selected" do

    end
    it "changes Location field when option is selected" do

    end
    it "goes to correct page when Industry is selected" do

    end
    it "goes to correct page when Location is selected" do

    end
    it "goes to correct page when both Industry and Location are selected" do

    end
    it "goes to correct page with text input and no options" do

    end
    it "goes to correct page with text input and Industry" do

    end
    it "goes to correct page with text input and Location" do

    end
    it "goes to correct page with text input and both options" do

    end

  end

end
