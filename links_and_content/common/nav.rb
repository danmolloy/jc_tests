def nav(url)
  $driver.manage.timeouts.implicit_wait = 10

  RSpec.describe "Nav" do
    #look only in nav element
    before(:all) do
      @nav_element = $driver.find_element(tag_name: "nav")
      @jobs_dropdown = @nav_element.find_element(id: "jobs_nav_dropdown")
      @jobs_dropdown_menu = @nav_element.find_element(id: "jobs_nav_dropdown_menu")
    end

    it "has link to Home" do
      home_link = @nav_element.find_element(id: "home_nav_link")
      expect(home_link.attribute("href")).to eq("#{$root_url}")
      expect(home_link.text).to eq("Home")
    end
    it "has link to About" do
      about_link = @nav_element.find_element(id: "about_nav_link")
      expect(about_link.attribute("href")).to eq("#{$root_url}about")
      expect(about_link.text).to eq("About")
    end
    it "has dropdown menu for Current Jobs" do
      expect(@jobs_dropdown.attribute("data-toggle")).to include("dropdown")
      expect(@jobs_dropdown.attribute("href")).to eq("#{$root_url}current-jobs")
      expect(@jobs_dropdown.text).to eq("Current Jobs")
    end
    it "dropdown has link to Current Jobs" do
      current_jobs_link = @jobs_dropdown_menu.find_element(id: "current_jobs_nav_link")
      expect(current_jobs_link.attribute("href")).to eq("#{$root_url}current-jobs")
      #Must use textContent here because the element is hidden
      expect(current_jobs_link.attribute("textContent")).to eq("Current Jobs")

    end
    it "dropdown has link to Jobs by Industry" do
      jobs_industry_link = @jobs_dropdown_menu.find_element(id: "jobs_industry_nav_link")
      expect(jobs_industry_link.attribute("href")).to eq("#{$root_url}jobs-by-industry")
      expect(jobs_industry_link.attribute("textContent")).to eq("Jobs by Industry")

    end
    it "dropdown has link to Jobs by Title" do
      jobs_title_link = @jobs_dropdown_menu.find_element(id: "jobs_title_nav_link")
      expect(jobs_title_link.attribute("href")).to eq("#{$root_url}jobs-by-title")
      expect(jobs_title_link.attribute("textContent")).to eq("Jobs by Title")

    end
    it "dropdown has link to Jobs by Location" do
      jobs_location_link = @jobs_dropdown_menu.find_element(id: "jobs_location_nav_link")
      expect(jobs_location_link.attribute("href")).to eq("#{$root_url}jobs-by-location")
      expect(jobs_location_link.attribute("textContent")).to eq("Jobs by Location")
    end
    it "dropdown has link to Jobs by Country" do
      jobs_country_link = @jobs_dropdown_menu.find_element(id: "jobs_country_nav_link")
      expect(jobs_country_link.attribute("href")).to eq("#{$root_url}jobs-by-country")
      expect(jobs_country_link.attribute("textContent")).to eq("Jobs by Country")
    end
    it "dropdown has link to Amgen Jobs" do
      jobs_amgen_link = @jobs_dropdown_menu.find_element(id: "jobs_amgen_nav_link")
      expect(jobs_amgen_link.attribute("href")).to eq("#{$root_url}amgen-jobs")
      expect(jobs_amgen_link.attribute("textContent")).to eq("Amgen Jobs")
    end
    it "dropdown buttons are hidden on load" do
      expect(@jobs_dropdown_menu.find_element(id: "current_jobs_nav_link").displayed?).to be_falsey
      expect(@jobs_dropdown_menu.find_element(id: "jobs_industry_nav_link").displayed?).to be_falsey
      expect(@jobs_dropdown_menu.find_element(id: "jobs_title_nav_link").displayed?).to be_falsey
      expect(@jobs_dropdown_menu.find_element(id: "jobs_location_nav_link").displayed?).to be_falsey
      expect(@jobs_dropdown_menu.find_element(id: "jobs_country_nav_link").displayed?).to be_falsey
      expect(@jobs_dropdown_menu.find_element(id: "jobs_amgen_nav_link").displayed?).to be_falsey
    end
    it "dropdown buttons are displayed on click" do
      @jobs_dropdown.click
      sleep 1
      expect(@jobs_dropdown_menu.find_element(id: "current_jobs_nav_link").displayed?).to be_truthy
      expect(@jobs_dropdown_menu.find_element(id: "jobs_industry_nav_link").displayed?).to be_truthy
      expect(@jobs_dropdown_menu.find_element(id: "jobs_title_nav_link").displayed?).to be_truthy
      expect(@jobs_dropdown_menu.find_element(id: "jobs_location_nav_link").displayed?).to be_truthy
      expect(@jobs_dropdown_menu.find_element(id: "jobs_country_nav_link").displayed?).to be_truthy
      expect(@jobs_dropdown_menu.find_element(id: "jobs_amgen_nav_link").displayed?).to be_truthy

    end
    it "has link to Blog" do
      blog_link = @nav_element.find_element(id: "blog_nav_link")
      expect(blog_link.attribute("href")).to eq("#{$root_url}blog")
      expect(blog_link.text).to eq("Blog")
    end
    it "has link to Jobseeker" do
      jobseeker_link = @nav_element.find_element(id: "jobseeker_nav_link")
      expect(jobseeker_link.attribute("href")).to eq("#{$root_url}jobseekers")
      expect(jobseeker_link.text).to eq("Jobseeker")
    end
    it "has link to Employers" do
      employer_link = @nav_element.find_element(id: "employer_nav_link")
      expect(employer_link.attribute("href")).to eq("#{$root_url}employer")
      expect(employer_link.text).to eq("Employers")
    end
    it "has link to Contact" do
      contact_link = @nav_element.find_element(id: "contact_nav_link")
      expect(contact_link.attribute("href")).to eq("#{$root_url}contact")
      expect(contact_link.text).to eq("Contact")
    end
  end
end
