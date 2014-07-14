require 'spec_helper'
require 'webmock/rspec'

describe "Atlassian Universal Plugin Manager" do

  it "should be get the upm_token" do
    stub_request(:head, "user:password@url").to_return(:headers => { 'upm_token' => 'token123' })
    UPMClient.new('url','user','password').token.should == 'token123'
  end
end
