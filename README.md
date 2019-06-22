## Formatting
In Terminal:
`cd /myproject`
then:
`rubocop`

## Troubleshooting

https://github.com/rails/rails/issues/26658#issuecomment-255590071

install in 'Gemfile':
`gem 'rb-readline'` in development group

### Cloud 9
err - 1:

`Your Ruby version is 2.4.0, but your Gemfile specified 2.6.0`

solution:

`rvm reinstall ruby`

err - 2:

`You must use Bundler 2 or greater with this lockfile. (Bundler::LockfileError)`

solution:

`gem update --system`