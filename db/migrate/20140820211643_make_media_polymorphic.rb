class MakeMediaPolymorphic < ActiveRecord::Migration
  class Media < ActiveRecord::Base
  end

  class Image < ActiveRecord::Base
    has_attached_file :file

    validates_attachment_content_type :file,
      content_type: /\Aimage\/.*\Z/
    validates_attachment_presence :file
  end

  class Video < ActiveRecord::Base
    has_attached_file :file

    validates_attachment_content_type :file,
      content_type: /\Avideo\/.*\Z/
    validates_attachment_presence :file
  end

  def change
    change_table :media do |t|
      t.string :content_type
      t.integer :content_id, index: true
    end

    Medium.all.each do |medium|
      if medium.file_content_type =~ /\Aimage\/.*\Z/
        image = Image.create!(file: medium.file)
        medium.update!(content_type: "Image", content_id: image.id)
      elsif medium.file_content_type =~ /\Avideo\/.*\Z/
        video = Video.create!(file: medium.file)
        medium.update!(content_type: "Video", content_id: video.id)
      end
    end

    remove_attachment :media, :file
  end
end
