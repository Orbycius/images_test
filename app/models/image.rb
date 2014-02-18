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
    if Image.image_exists? name
      message = "#{name} image changed"
    else
      message = "#{name} image uploaded"
    end
    return message
  end

  def self.image_exists? name
    path = File.join('public/img', name)
    if File.exists? path
      return true
    else
      return false
    end
  end
end
