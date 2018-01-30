[Missing the other part of the readme]

## Running the tests

```
bundle install
bundle exec rspec
```

If you want to run the integration test against a real bucket you need to pass
your aws credentials to the test runner or declare it in your environment.

```
COS_REGION=guangzhou COS_ACCESS_KEY_ID=123 COS_SECRET_ACCESS_KEY=secret COS_LOGSTASH_TEST_BUCKET=mytest bundle exec rspec spec/integration/cos_spec.rb --tag integration
```
