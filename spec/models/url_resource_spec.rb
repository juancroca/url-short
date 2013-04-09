require 'spec_helper'

describe UrlResource do
  it "has a valid factory" do
    expect(create(:url_resource)).to be_valid
  end

  it "is invalid without a url_string" do 
    expect(build(:url_resource, url_string: nil)).not_to be_valid
  end

  it "is invalid without a valid url for url_string" do 
    expect(build(:url_resource, url_string: "123.com")).not_to be_valid
  end
  
  it "is valid with a valid url for url_string" do 
    expect(build(:url_resource, url_string: "http://123.com")).to be_valid
  end

  it "generates a unique token" do 
    resource_1 = create(:url_resource, token: "123")
    resource_2 = create(:url_resource, token: "123")
    expect(resource_1.token).not_to eq(resource_2.token)
  end
  it "set browser count to 1 when nil" do 
    resource = create(:url_resource, browsers: {})
    expect{resource.increase_browser_count("Chrome")}.to change{resource.browsers["Chrome"]}.from(nil).to(1)
  end

  it "increases browser count when existing" do 
    resource = create(:url_resource, browsers: {"Chrome" => 2})
    expect{resource.increase_browser_count("Chrome")}.to change{resource.browsers["Chrome"]}.from(2).to(3)
  end
end
