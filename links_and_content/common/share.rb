#### More to be done on this ########

def share(url)
  $driver.manage.timeouts.implicit_wait = 10

  RSpec.describe "Share" do
    before(:all) do
      @sharebar = $driver.find_element(id: "sharebar")
    end

    it "sharebar is present" do
      expect(@sharebar.find_element(class: "share-text").text).to eq("Share this Page")

    end
    it "has Share This button" do
      sharethis = @sharebar.find_element(class: "st_sharethis_large")
      expect(sharethis.find_element(class: "stLarge").displayed?).to be_truthy
      expect(sharethis.find_element(class: "stLarge").attribute("style")).to \
          eq("background-image: url(http://w.sharethis.com/images/sharethis_32.png);")

    end
    it "has Email button" do
      email = @sharebar.find_element(class: "st_email_large")
      expect(email.find_element(class: "stLarge").displayed?).to be_truthy
      expect(email.find_element(class: "stLarge").attribute("style")).to \
          eq("background-image: url(http://w.sharethis.com/images/email_32.png);")

    end
    it "has LinkedIn button" do
      linkedin = @sharebar.find_element(class: "st_linkedin_large")
      expect(linkedin.find_element(class: "stLarge").displayed?).to be_truthy
      expect(linkedin.find_element(class: "stLarge").attribute("style")).to \
          eq("background-image: url(http://w.sharethis.com/images/linkedin_32.png);")

    end
    it "has Facebook button" do
      facebook = @sharebar.find_element(class: "st_facebook_large")
      expect(facebook.find_element(class: "stLarge").displayed?).to be_truthy
      expect(facebook.find_element(class: "stLarge").attribute("style")).to \
          eq("background-image: url(http://w.sharethis.com/images/facebook_32.png);")

    end
    it "has Twitter button" do
      twitter = @sharebar.find_element(class: "st_twitter_large")
      expect(twitter.find_element(class: "stLarge").displayed?).to be_truthy
      expect(twitter.find_element(class: "stLarge").attribute("style")).to \
          eq("background-image: url(http://w.sharethis.com/images/twitter_32.png);")

    end
    it "has Google Plus button" do
      googleplus = @sharebar.find_element(class: "st_googleplus_large")
      expect(googleplus.find_element(class: "stLarge").displayed?).to be_truthy
      expect(googleplus.find_element(class: "stLarge").attribute("style")).to \
          eq("background-image: url(http://w.sharethis.com/images/googleplus_32.png);")
    end

  end

end
