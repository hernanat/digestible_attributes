# DigestibleAttributes
This plugin lets you compute a hash digest based on the
values of a set of attributes, and store it on your model.

## Usage

### Options

* `fields` - list of attribute fields to be digested
* `algorithm` - which hash algorithm to use for digest (defaults to `:MD5`)
* `digest_column` - where to store the digest (defaults to `*ALGORITHM*_digest`; i.e. `md5_digest`)

### Quick start
If you have a model with fields `foo`, `bar`, `baz`,
simply add the following to your model file:

```rb
digestible_attributes fields: [:foo, :bar, :baz]
```

### Supported hash algorithms
This gem uses `OpenSSL::Digest` to compute digests. The currently supported
algorithms are:

* `:MD2`
* `:MD4`
* `:MD5`
* `:MDC2`
* `:RIPEMD160`
* `:SHA1`
* `:SHA224`
* `:SHA256`
* `:SHA384`
* `:SHA512`

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'digestible_attributes'
```

And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install digestible_attributes
```

## Things to come
- Generators
- RSpec Matchers
- Any ideas you might have?

## Contributing
For any suggested changes, you can fork the repo, make your changes, and then open up a PR.
Please be sure to include a helpful commit message / explanation for your changes.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
