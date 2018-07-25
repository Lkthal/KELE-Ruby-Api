# Kele

Welcome to Kele gem! Kele is a gem that allows user to be authorized to the Bloc application via JSON Web Token. Put your Ruby code in the file `lib/kele`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kele'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kele

## Usage

###Retrieving Current User

replace the email with the user you are searching for.
```
$ irb
>> require './lib/kele'
=> true
>> kele_client = Kele.new("jane@gmail.com", "abc123")
>> kele_client.get_me

```

### Checking if Mentor is available

```
$ irb
>> require './lib/kele'
=> true
>> kele_client = Kele.new("jane@gmail.com", "abc123")
>> mentor_id = 99
>> kele_client.get_mentor_availability(mentor_id)
```

###Retrieving Roadmap

```
$ irb
>> require './lib/kele'
=> true
>> kele_client = Kele.new("jane@gmail.com", "abc123")
>> chain_id = 99
>> kele_client.get_roadmap(chain_id)

```

###Retrieving Messages

```
$ irb
>> require './lib/kele'
=> true
>> kele_client = Kele.new("Hannah.McExample@gmail.com", "abc123")
>> kele_client.get_messages(1) # returns the first page of message threads
>> kele_client.get_messages # returns all message threads

```

###Retrieving Remaining Checkpoint

```
$ irb
>> require './lib/kele'
=> true
>> kele_client = Kele.new("Hannah.McExample@gmail.com", "abc123")
>> kele_client.get_remaining_checkpoints(chain_id)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[LKThal]/kele. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Kele project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/kele/blob/master/CODE_OF_CONDUCT.md).
