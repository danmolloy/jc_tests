def header(url)
  $driver.manage.timeouts.implicit_wait = 10


  RSpec.describe "Header" do
    before(:all) do
      @home_link_element = $driver.find_element(id: "header_home_link")
      @logo_image = @home_link_element.find_element(class: "img")

      @linkedin_header = $driver.find_element(id: "lin_header")
      @linkedin_image = $driver.find_element(id: "lin_header_logo")

      @facebook_header = $driver.find_element(id: "fb_header")
      @facebook_image = $driver.find_element(id: "fb_header_logo")

      @twitter_header = $driver.find_element(id: "tw_header")
      @twitter_image = $driver.find_element(id: "tw_header_logo")
    end

    it "has link to home page" do
      expect(@home_link_element.attribute("href")).to eq("#{$root_url}")
    end

    it "home link contains company logo" do
      expect(@logo_image.attribute("src")).to eq("#{$root_url}images/logo1.png")
    end

    it "has company slogan" do
      slogan = $driver.find_element(id: "company_slogan")
      expect(slogan.text).to eq("Technical Recruitment Specialists")
    end

    it "links to linkedin page" do
      expect(@linkedin_header.attribute("href")).to eq("https://www.linkedin.com/company/2228444")
    end

    it "linkedin link is logo" do
      expect(@linkedin_image.attribute("src")).to eq("#{$root_url}images/lin-flat.png")
    end

    it "links to facebook page" do
      expect(@facebook_header.attribute("href")).to eq("https://www.facebook.com/jobcontax")
    end

    it "facebook link is logo" do
      expect(@facebook_image.attribute("src")).to eq("#{$root_url}images/fb-flat.png")
    end

    it "links to twitter page" do
      expect(@twitter_header.attribute("href")).to eq("https://twitter.com/jobcontax")
    end

    it "twitter link is logo" do
      expect(@twitter_image.attribute("src")).to eq("#{$root_url}images/tw-flat.png")
    end
  end
end
