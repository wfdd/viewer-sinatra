# frozen_string_literal: true
require 'test_helper'
require_relative '../../lib/page/house'

describe 'House' do
  subject do
    house = index_at_known_sha
            .country('united-states-of-america')
            .legislature('senate')
    Page::House.new(house: house)
  end

  it 'has the country' do
    subject.country.name.must_equal 'United States of America'
  end

  it 'has the house' do
    subject.house.name.must_equal 'Senate'
  end

  describe 'legislative periods' do
    it 'has all legislative periods' do
      subject.legislative_periods.count.must_equal 18
    end

    it 'is a list containing terms' do
      subject.legislative_periods.first.name.must_equal '114th Congress'
    end
  end

  describe 'title' do
    it 'shows the country name' do
      subject.title.must_include 'United States of America'
    end

    it 'shows the house name' do
      subject.title.must_include 'Senate'
    end
  end
end
