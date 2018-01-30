# encoding: utf-8
shared_context "setup plugin" do
  let(:temporary_directory) { Stud::Temporary.pathname }

  let(:bucket) { ENV["AWS_LOGSTASH_TEST_BUCKET"] }
  let(:access_key_id) {  ENV["AWS_ACCESS_KEY_ID"] }
  let(:secret_access_key) { ENV["AWS_SECRET_ACCESS_KEY"] }
  let(:size_file) { 100 }
  let(:time_file) { 100 }
  let(:tags) { [] }
  let(:prefix) { "home" }
  let(:region) { ENV['AWS_REGION'] }

  let(:main_options) do
    {
      "bucket" => bucket,
      "prefix" => prefix,
      "temporary_directory" => temporary_directory,
      "access_key_id" => access_key_id,
      "secret_access_key" => secret_access_key,
      "size_file" => size_file,
      "time_file" => time_file,
      "region" => region,
      "tags" => []
    }
  end

  let(:client_credentials) { Aws::Credentials.new(access_key_id, secret_access_key) }
  let(:bucket_resource) {   
      s3 = Aws::S3::Client.new(
      :access_key_id => access_key_id,
      :secret_access_key => secret_access_key,
      :region => region,
      :endpoint => "https://#{bucket}.cos.#{region}.myqcloud.com",
      :force_path_style => true
      )
      
      resource = Aws::S3::Resource.new(client: s3)
      resource.bucket(bucket)       
  }

  subject { LogStash::Outputs::S3.new(options) }
end

def clean_remote_files(prefix = "")
  bucket_resource.objects(:prefix => prefix).each do |object|
    object.delete
  end
end
