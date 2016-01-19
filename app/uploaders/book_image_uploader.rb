# encoding: utf-8

class BookImageUploader < CarrierWave::Uploader::Base

  storage :file

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end


end
