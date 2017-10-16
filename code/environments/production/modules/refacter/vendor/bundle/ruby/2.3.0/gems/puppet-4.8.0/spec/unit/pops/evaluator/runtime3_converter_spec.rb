#! /usr/bin/env ruby
require 'spec_helper'

require 'puppet/pops'
require 'puppet/pops/types/type_factory'

describe 'when converting to 3.x' do
  let(:converter) { Puppet::Pops::Evaluator::Runtime3Converter.instance }

  it "converts a resource type starting with Class without confusing it with exact match on 'class'" do
    t = Puppet::Pops::Types::TypeFactory.resource('classroom', 'kermit')
    converted = converter.catalog_type_to_split_type_title(t)
    expect(converted).to eql(['classroom', 'kermit'])
  end

  it "converts a resource type of exactly 'Class'" do
    t = Puppet::Pops::Types::TypeFactory.resource('class', 'kermit')
    converted = converter.catalog_type_to_split_type_title(t)
    expect(converted).to eql(['class', 'kermit'])
  end

  it "errors on attempts to convert an 'Iterator'" do
    expect {
      converter.convert(Puppet::Pops::Types::Iterable.on((1..3)), {}, nil)
    }.to raise_error(Puppet::Error, /Use of an Iterator is not supported here/)
  end

  it 'does not convert a SemVer instance to string' do
    v = Semantic::Version.parse('1.0.0')
    expect(converter.convert(v, {}, nil)).to equal(v)
  end

  it 'converts the symbol :undef to the undef value' do
    v = Semantic::Version.parse('1.0.0')
    expect(converter.convert(:undef, {}, 'undef value')).to eql('undef value')
  end

  it 'converts the nil to the undef value' do
    v = Semantic::Version.parse('1.0.0')
    expect(converter.convert(nil, {}, 'undef value')).to eql('undef value')
  end

  it 'does not convert a symbol nested in an array' do
    v = Semantic::Version.parse('1.0.0')
    expect(converter.convert({'foo' => :undef}, {}, 'undef value')).to eql({'foo' => :undef})
  end

  it 'converts nil to :undef when nested in an array' do
    v = Semantic::Version.parse('1.0.0')
    expect(converter.convert({'foo' => nil}, {}, 'undef value')).to eql({'foo' => :undef})
  end

  it 'does not convert a Regex instance to string' do
    v = /^[A-Z]$/
    expect(converter.convert(v, {}, nil)).to equal(v)
  end

  it 'does not convert a Version instance to string' do
    v = Semantic::Version.parse('1.0.0')
    expect(converter.convert(v, {}, nil)).to equal(v)
  end

  it 'does not convert a VersionRange instance to string' do
    v = Semantic::VersionRange.parse('>=1.0.0')
    expect(converter.convert(v, {}, nil)).to equal(v)
  end

  it 'does not convert a Timespan instance to string' do
    v = Puppet::Pops::Time::Timespan.new(1234)
    expect(converter.convert(v, {}, nil)).to equal(v)
  end

  it 'does not convert a Timestamp instance to string' do
    v = Puppet::Pops::Time::Timestamp.now
    expect(converter.convert(v, {}, nil)).to equal(v)
  end

  it 'does not convert a Sensitive instance to string' do
    v = Puppet::Pops::Types::PSensitiveType::Sensitive.new("don't reveal this")
    expect(converter.convert(v, {}, nil)).to equal(v)
  end

  it 'does not convert a Binary instance to string' do
    v = Puppet::Pops::Types::PBinaryType::Binary.from_base64('w5ZzdGVuIG1lZCByw7ZzdGVuCg==')
    expect(converter.convert(v, {}, nil)).to equal(v)
  end

  context 'the Runtime3FunctionArgumentConverter' do
    let(:converter) { Puppet::Pops::Evaluator::Runtime3FunctionArgumentConverter.instance }

    it 'converts a Regex instance to string' do
      c = converter.convert(/^[A-Z]$/, {}, nil)
      expect(c).to be_a(String)
      expect(c).to eql('/^[A-Z]$/')
    end

    it 'converts a Version instance to string' do
      c = converter.convert(Semantic::Version.parse('1.0.0'), {}, nil)
      expect(c).to be_a(String)
      expect(c).to eql('1.0.0')
    end

    it 'converts a VersionRange instance to string' do
      c = converter.convert(Semantic::VersionRange.parse('>=1.0.0'), {}, nil)
      expect(c).to be_a(String)
      expect(c).to eql('>=1.0.0')
    end

    it 'converts a Timespan instance to string' do
      c = converter.convert(Puppet::Pops::Time::Timespan.new(1234), {}, nil)
      expect(c).to be_a(String)
      expect(c).to eql('0-00:00:00.1234')
    end

    it 'converts a Timestamp instance to string' do
      c = converter.convert(Puppet::Pops::Time::Timestamp.parse('2016-09-15T12:24:47.193 UTC'), {}, nil)
      expect(c).to be_a(String)
      expect(c).to eql('2016-09-15T12:24:47.193 UTC')
    end

    it 'converts a Binary instance to string' do
      b64 = 'w5ZzdGVuIG1lZCByw7ZzdGVuCg=='
      c = converter.convert(Puppet::Pops::Types::PBinaryType::Binary.from_base64(b64), {}, nil)
      expect(c).to be_a(String)
      expect(c).to eql(b64)
    end

    it 'does not convert a Sensitive instance to string' do
      v = Puppet::Pops::Types::PSensitiveType::Sensitive.new("don't reveal this")
      expect(converter.convert(v, {}, nil)).to equal(v)
    end
  end
end
