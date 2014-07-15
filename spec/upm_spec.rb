require 'spec_helper'
require 'webmock/rspec'

describe "Atlassian Universal Plugin Manager" do

  before (:each) do
    @client = UPMClient.new('url','user','password')
    stub_request(:head, "user:password@url").to_return(:headers => { 'upm_token' => 'token123' })
    stub_request(:post, "user:password@url").to_return(:status => 200)
  end

  it "should be get the upm_token" do
    expect(@client.token).to eq 'token123'
  end

  it "should be able to post the plugin to host" do
    expect(File).to receive(:new).with("filename").and_return(double)
    @client.uploadPlugin("filename")
    expect(WebMock).to have_requested(:post, "user:password@url").with(:headers => {'token' => 'token123', 'Content-Type'=> /multipart\/form-data\; boundary=[\d]+/})
  end
end
