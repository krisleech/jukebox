require 'support/activerecord_helper'

describe Song do
  it 'can be created' do
    expect(Song.create(title: 'foosong')).to be_truthy
  end
end
