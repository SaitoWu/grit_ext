# GritExt

grit_ext is a grit extension gem.

1. auto transcoding `blob.data` to utf-8 encoding

2. give blob a language method, show the blob's programming language

3. give blob a encoding method, show the blob's text encoding.

## Installation

Add this line to your application's Gemfile:

    gem 'grit_ext'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grit_ext

## Usage

```ruby
[1] pry(main)> require'grit'
=> true
[2] pry(main)> require'grit_ext'
=> true
[3] pry(main)> repo = Grit::Repo.new("/Users/saito/Develop/grit_ext")
=> #<Grit::Repo "/Users/saito/Develop/grit_ext/.git">
[4] pry(main)> blob = repo.tree / 'Gemfile'
=> #<Grit::Blob "015bb0f8c189aca154b2a54e511415e6723d104d">
[5] pry(main)> blob.language
=> "Ruby"
[6] pry(main)> blob.encoding
=> "ISO-8859-1"
[7] pry(main)> blob.data
=> "source 'https://rubygems.org'\n\n# Specify your gem's dependencies in grit_ext.gemspec\ngemspec\n"
[8] pry(main)> blob.text?
=> true
[9] pry(main)> blob.image?
=> false
[10] pry(main)> blob.binary?
=> false
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
