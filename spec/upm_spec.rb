require 'spec_helper'
require 'webmock/rspec'

describe "Atlassian Universal Plugin Manager" do

  before (:each) do
    @client = UPMClient.new('url','user','password')
    @head_stub = stub_request(:head, "user:password@url").to_return(:headers => { 'upm_token' => 'token123' })
    @post_stub = stub_request(:post, "user:password@url?token=token123")
    .with(:headers => {'Content-Type'=> /multipart\/form-data\; boundary=[\d]+/})
    .to_return(:status => 202)
  end

  it "should be get the upm_token" do
    expect(@client.token).to eq 'token123'
    expect(@head_stub).to have_been_requested
  end

  it "should be able to post the plugin to host" do
    expect(File).to receive(:new).with("filename").and_return(double)
    @client.uploadPlugin("filename")
    expect(@post_stub).to have_been_requested
  end
end
