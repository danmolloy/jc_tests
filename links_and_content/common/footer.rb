
def footer(url)
  $driver.manage.timeouts.implicit_wait = 10


  RSpec.describe "Footer" do
    before(:all) do
      @jobs_ireland_list = $driver.find_element(id: "jobs_in_ireland_list")
      @jobs_location_list = $driver.find_element(id: "jobs_by_location_list")
      @jobs_sector_list = $driver.find_element(id: "jobs_by_sector_list")
      @job_titles_list = $driver.find_element(id: "job_titles_list")
    end




    ##################### Jobs In Ireland #####################################




    it "has Jobs in Ireland list" do
      expect(@jobs_ireland_list.find_element(id: "jobs_in_ireland_list_title").text).to eq("Jobs in Ireland")
    end
    it "has Linkedin CV button" do
      expect(@jobs_ireland_list.find_element(id: "linkedin_cv_btn").text).to eq("Add LinkedIn CV")
    end
    it "has link to Jobs in Ireland" do
      jobs_in_ireland_link = @jobs_ireland_list.find_element(id: "jobs_in_ireland_footer")
      expect(jobs_in_ireland_link.attribute("href")).to eq("#{$root_url}jobs-ireland")
      expect(jobs_in_ireland_link.text).to eq("Jobs in Ireland")
    end
    it "has link to Jobs in Dublin" do
      jobs_in_dublin_link = @jobs_ireland_list.find_element(id: "jobs_in_dublin_footer")
      expect(jobs_in_dublin_link.attribute("href")).to eq("#{$root_url}jobs-in-dublin")
      expect(jobs_in_dublin_link.text).to eq("Jobs in Dublin")
    end
    it "has link to Jobs in Cork" do
      jobs_in_cork_link = @jobs_ireland_list.find_element(id: "jobs_in_cork_footer")
      expect(jobs_in_cork_link.attribute("href")).to eq("#{$root_url}jobs-in-cork")
      expect(jobs_in_cork_link.text).to eq("Jobs in Cork")
    end
    it "has link to Jobs in Galway" do
      jobs_in_galway_link = @jobs_ireland_list.find_element(id: "jobs_in_galway_footer")
      expect(jobs_in_galway_link.attribute("href")).to eq("#{$root_url}jobs-in-galway")
      expect(jobs_in_galway_link.text).to eq("Jobs in Galway")
    end
    it "has link to Jobs in Waterford" do
      jobs_in_waterford_link = @jobs_ireland_list.find_element(id: "jobs_in_waterford_footer")
      expect(jobs_in_waterford_link.attribute("href")).to eq("#{$root_url}jobs-in-waterford")
      expect(jobs_in_waterford_link.text).to eq("Jobs in Waterford")
    end
    it "has link to Jobs in Limerick" do
      jobs_in_limerick_link = @jobs_ireland_list.find_element(id: "jobs_in_limerick_footer")
      expect(jobs_in_limerick_link.attribute("href")).to eq("#{$root_url}jobs-in-limerick")
      expect(jobs_in_limerick_link.text).to eq("Jobs in Limerick")
    end
    it "has link to Jobs in Amgen" do
      jobs_in_amgen_link = @jobs_ireland_list.find_element(id: "jobs_in_amgen_footer")
      expect(jobs_in_amgen_link.attribute("href")).to eq("#{$root_url}amgen-jobs")
      expect(jobs_in_amgen_link.text).to eq("Jobs in Amgen")
    end
    it "has link to Jobs by Title" do
      jobs_by_title_link = @jobs_ireland_list.find_element(id: "jobs_by_title_footer")
      expect(jobs_by_title_link.attribute("href")).to eq("#{$root_url}jobs-by-title")
      expect(jobs_by_title_link.text).to eq("Jobs by Title")
    end
    it "has link to Jobs by Location" do
      jobs_by_location_link = @jobs_ireland_list.find_element(id: "jobs_by_location_footer")
      expect(jobs_by_location_link.attribute("href")).to eq("#{$root_url}jobs-by-location")
      expect(jobs_by_location_link.text).to eq("Jobs by Location")
    end





    ##################### Jobs By Location ####################################





    it "has Jobs by Location list" do
      expect(@jobs_location_list.find_element(id: "jobs_by_location_list_title").text).to eq("Jobs by Location")
    end
    it "has Upload CV button" do
      expect(@jobs_location_list.find_element(id: "upload_cv_btn").text).to eq("Upload your CV")
      expect(@jobs_location_list.find_element(id: "upload_cv_btn").attribute("href")).to eq("#{$root_url}upload-cv")
    end
    it "has link to Jobs in Saudi Arabia" do
      jobs_in_saudi_arabia_link = @jobs_location_list.find_element(id: "jobs_in_saudi_arabia_footer")
      expect(jobs_in_saudi_arabia_link.attribute("href")).to eq("#{$root_url}jobs-saudi-arabia")
      expect(jobs_in_saudi_arabia_link.text).to eq("Jobs in Saudi Arabia")
    end
    it "has link to Jobs in Qatar" do
      jobs_in_qatar_link = @jobs_location_list.find_element(id: "jobs_in_qatar_footer")
      expect(jobs_in_qatar_link.attribute("href")).to eq("#{$root_url}jobs-qatar")
      expect(jobs_in_qatar_link.text).to eq("Jobs in Qatar")

    end
    it "has link to Jobs in UAE" do
      jobs_in_uae_link = @jobs_location_list.find_element(id: "jobs_in_uae_footer")
      expect(jobs_in_uae_link.attribute("href")).to eq("#{$root_url}jobs-uae")
      expect(jobs_in_uae_link.text).to eq("Jobs in UAE")

    end
    it "has link to Jobs in UK" do
      jobs_in_uk_link = @jobs_location_list.find_element(id: "jobs_in_uk_footer")
      expect(jobs_in_uk_link.attribute("href")).to eq("#{$root_url}jobs-uk")
      expect(jobs_in_uk_link.text).to eq("Jobs in UK")

    end
    it "has link to Jobs in China" do
      jobs_in_china_link = @jobs_location_list.find_element(id: "jobs_in_china_footer")
      expect(jobs_in_china_link.attribute("href")).to eq("#{$root_url}jobs-china")
      expect(jobs_in_china_link.text).to eq("Jobs in China")

    end
    it "has link to Jobs in Canada" do
      jobs_in_canada_link = @jobs_location_list.find_element(id: "jobs_in_canada_footer")
      expect(jobs_in_canada_link.attribute("href")).to eq("#{$root_url}jobs-canada")
      expect(jobs_in_canada_link.text).to eq("Jobs in Canada")

    end
    it "has link to Jobs in Africa" do
      jobs_in_africa_link = @jobs_location_list.find_element(id: "jobs_in_africa_footer")
      expect(jobs_in_africa_link.attribute("href")).to eq("#{$root_url}jobs-africa")
      expect(jobs_in_africa_link.text).to eq("Jobs in Africa")

    end
    it "has link to Jobs in Middle East" do
      jobs_in_middle_east_link = @jobs_location_list.find_element(id: "jobs_in_middle_east_footer")
      expect(jobs_in_middle_east_link.attribute("href")).to eq("#{$root_url}jobs-middle-east")
      expect(jobs_in_middle_east_link.text).to eq("Jobs in Middle East")

    end
    it "has link to Jobs in Tanzania" do
      jobs_in_tanzania_link = @jobs_location_list.find_element(id: "jobs_in_tanzania_footer")
      expect(jobs_in_tanzania_link.attribute("href")).to eq("#{$root_url}jobs-tanzania")
      expect(jobs_in_tanzania_link.text).to eq("Jobs in Tanzania")

    end




    ##################### Jobs By Sector ######################################






    it "has Jobs by Sector list" do
      expect(@jobs_sector_list.find_element(id: "jobs_by_sector_list_title").text).to eq("Jobs by Sector")
    end
    it "has Email button" do
      expect(@jobs_sector_list.find_element(id: "email_btn").text).to eq("Email: cv@jobcontax.com")
    end
    it "has link to Biotechnology Jobs" do
      biotechnology_jobs_link = @jobs_sector_list.find_element(id: "biotechnology_jobs_footer")
      expect(biotechnology_jobs_link.attribute("href")).to eq("#{$root_url}biotechnology-jobs")
      expect(biotechnology_jobs_link.text).to eq("Biotechnology Jobs")

    end
    it "has link to Medical Device Jobs" do
      medical_device_jobs_link = @jobs_sector_list.find_element(id: "medical_device_jobs_footer")
      expect(medical_device_jobs_link.attribute("href")).to eq("#{$root_url}medical-device-jobs")
      expect(medical_device_jobs_link.text).to eq("Medical Device Jobs")

    end
    it "has link to Pharmaceutical Jobs" do
      pharmaceutical_jobs_link = @jobs_sector_list.find_element(id: "pharmaceutical_jobs_footer")
      expect(pharmaceutical_jobs_link.attribute("href")).to eq("#{$root_url}pharmaceutical-jobs")
      expect(pharmaceutical_jobs_link.text).to eq("Pharmaceutical Jobs")

    end
    it "has link to Manufacturing Jobs" do
      manufacturing_jobs_link = @jobs_sector_list.find_element(id: "manufacturing_jobs_footer")
      expect(manufacturing_jobs_link.attribute("href")).to eq("#{$root_url}manufacturing-jobs")
      expect(manufacturing_jobs_link.text).to eq("Manufacturing Jobs")

    end
    it "has link to Construction Jobs" do
      construction_jobs_link = @jobs_sector_list.find_element(id: "construction_jobs_footer")
      expect(construction_jobs_link.attribute("href")).to eq("#{$root_url}construction-jobs")
      expect(construction_jobs_link.text).to eq("Construction Jobs")

    end
    it "has link to Infrastructure Jobs" do
      infrastructure_jobs_link = @jobs_sector_list.find_element(id: "infrastructure_jobs_footer")
      expect(infrastructure_jobs_link.attribute("href")).to eq("#{$root_url}infrastructure-jobs")
      expect(infrastructure_jobs_link.text).to eq("Infrastructure Jobs")

    end
    it "has link to Engineering Jobs" do
      engineering_jobs_link = @jobs_sector_list.find_element(id: "engineering_jobs_footer")
      expect(engineering_jobs_link.attribute("href")).to eq("#{$root_url}engineering-jobs")
      expect(engineering_jobs_link.text).to eq("Engineering Jobs")

    end
    it "has link to Lineman Jobs" do
      lineman_jobs_link = @jobs_sector_list.find_element(id: "lineman_jobs_footer")
      expect(lineman_jobs_link.attribute("href")).to eq("#{$root_url}lineman-jobs")
      expect(lineman_jobs_link.text).to eq("Lineman Jobs")

    end
    it "has link to Jobs By City" do
      jobs_by_city_link = @jobs_sector_list.find_element(id: "jobs_by_city_footer")
      expect(jobs_by_city_link.attribute("href")).to eq("#{$root_url}jobs-by-city")
      expect(jobs_by_city_link.text).to eq("Jobs By City")

    end




    ##################### Jobs By Title ######################################





    it "has Job Titles list" do
      expect(@job_titles_list.find_element(id: "job_titles_list_title").text).to eq("Job Titles")
    end
    it "has Phone button" do
      expect(@job_titles_list.find_element(id: "phone_btn").text).to eq("Tel: +353-1-7978720")
      expect(@job_titles_list.find_element(id: "phone_btn").attribute("href")).to eq("tel:+35317978720")
    end
    it "has link to Architect Jobs" do
      architect_jobs_link = @job_titles_list.find_element(id: "architect_jobs_footer")
      expect(architect_jobs_link.attribute("href")).to eq("#{$root_url}architect-architecture-jobs")
      expect(architect_jobs_link.text).to eq("Architect Jobs")
    end
    it "has link to Automation Engineer Jobs" do
      automation_engineer_jobs_link = @job_titles_list.find_element(id: "automation_engineer_jobs_footer")
      expect(automation_engineer_jobs_link.attribute("href")).to eq("#{$root_url}automation-engineer-jobs")
      expect(automation_engineer_jobs_link.text).to eq("Automation Engineer Jobs")
    end
    it "has link to MEP Jobs" do
      mep_jobs_link = @job_titles_list.find_element(id: "mep_jobs_footer")
      expect(mep_jobs_link.attribute("href")).to eq("#{$root_url}mep-jobs")
      expect(mep_jobs_link.text).to eq("MEP Jobs")

    end
    it "has link to Qualified Person QP Jobs" do
      qp_jobs_link = @job_titles_list.find_element(id: "qp_jobs_footer")
      expect(qp_jobs_link.attribute("href")).to eq("#{$root_url}qualified-person-qp-jobs")
      expect(qp_jobs_link.text).to eq("Qualified Person QP Jobs")

    end
    it "has link to Project Manager Jobs" do
      project_manager_jobs_link = @job_titles_list.find_element(id: "project_manager_jobs_footer")
      expect(project_manager_jobs_link.attribute("href")).to eq("#{$root_url}project-manager-jobs")
      expect(project_manager_jobs_link.text).to eq("Project Manager Jobs")

    end
    it "has link to Rail - Railway Jobs" do
      railway_jobs_link = @job_titles_list.find_element(id: "railway_jobs_footer")
      expect(railway_jobs_link.attribute("href")).to eq("#{$root_url}rail-railway-jobs")
      expect(railway_jobs_link.text).to eq("Rail - Railway Jobs")

    end
    it "has link to Sales Jobs" do
      sales_jobs_link = @job_titles_list.find_element(id: "sales_jobs_footer")
      expect(sales_jobs_link.attribute("href")).to eq("#{$root_url}sales-jobs")
      expect(sales_jobs_link.text).to eq("Sales Jobs")

    end
    it "has link to Water - Wastewater Jobs" do
      water_jobs_link = @job_titles_list.find_element(id: "water_jobs_footer")
      expect(water_jobs_link.attribute("href")).to eq("#{$root_url}water-wastewater-jobs")
      expect(water_jobs_link.text).to eq("Water - Wastewater Jobs")

    end
    it "has link to JobContax Recruitment Agency" do
      recruitment_agency_link = @job_titles_list.find_element(id: "recruitment_agency_footer")
      expect(recruitment_agency_link.attribute("href")).to eq("#{$root_url}recruitment-agency")
      expect(recruitment_agency_link.text).to eq("JobContax Recruitment Agency")

    end

    it "has copyright info" do
      expect($driver.find_element(id: "copyright_container").text).to eq("© 2015 JobContax All Rights Reserved")

    end


  end
end
