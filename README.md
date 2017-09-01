# Home Of Phone
[![Gem Version](https://badge.fury.io/rb/home_of_phone.svg)](http://badge.fury.io/rb/home_of_phone)

[gem]: https://rubygems.org/gems/home_of_phone

Test how similar two words sound to each other.

This library makes use of the [CMU Pronouncing Dictionary](http://www.speech.cs.cmu.edu/cgi-bin/cmudict).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'home_of_phone'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install home_of_phone

## Usage

```ruby
sim_hilarity_sir_vice = HomeOfPhone.new # preloads large phoneme dictionary
sim_hilarity_sir_vice.similarity("joking", "choking")
# 96

# options modify how similarity is calculated
sim_hilarity_sir_vice.similarity("joking", "choking", {use_rhyme_boost: false, use_phoneme_accents: false})

sim_hilarity_sir_vice_too = HomeOfPhone.new(preload_phonemes: false) # doesn't load phoneme dictionary yet
sim_hilarity_sir_vice_too.similarity("joking", "choking") # loads dictionary at this point

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/home_of_phone/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
