class Image < ActiveRecord::Base

  private

  def self.save_photo image, name
    path = File.join('public/img', name)
    if image
      FileUtils.mkdir_p 'public/img'
      File.open(path, 'wb') do |f|
        f.write(image.read)
      end
      return true
    end
  end

  def self.get_message name
    path = File.join('public/img', name)
    if File.exists? path
      message = "#{name} image changed"
    else
      message = "#{name} image uploaded"
    end
    return message
  end
end
