require 'spec_helper'

require 'carrierwave/test/matchers'

describe ContactPhotoUploader do
  include CarrierWave::Test::Matchers

  let(:uploader) do
    ContactPhotoUploader.new(FactoryGirl.build(:contact), :contact_photo)
  end

  let(:path) do
    Rails.root.join('spec/images/valid_contact_image.jpg')
  end

  before do
    ContactPhotoUploader.enable_processing = true
  end

  after do
    ContactPhotoUploader.enable_processing = false
  end

  it 'stores without error' do
    expect( lambda { uploader.store!(File.open(path)) }).to_not raise_error
    expect( lambda { uploader.store!(File.open(path)) }).to_not raise_error

  end

end


