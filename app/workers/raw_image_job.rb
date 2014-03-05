class RawImageJob
  include OpenCV

  @queue = :test_opencv_queue

  def self.perform

    raw_image_path = "#{Rails.root}/vendor/lena.jpg"
    out_image_path = "#{Rails.root}/vendor/lena_out.jpg"

    p "got Job #{raw_image_path}"

    classifier_path = "#{Rails.root}/vendor/haarcascade_frontalface_default.xml"

    detector = CvHaarClassifierCascade::load(classifier_path)
    image = CvMat.load(raw_image_path)
    faces = detector.detect_objects(image)
    img_width = image.width
    img_height = image.height
    p "found #{faces.length} faces"
    faces.each do |face|
      rel_x = face.top_left.x/img_width
      rel_y = face.top_left.y/img_height
      rel_x2 = face.bottom_right.x/img_width
      rel_y2 = face.bottom_right.y/img_height

      color = CvColor::Red
      image.rectangle! face.top_left, face.bottom_right, :color => color
    end

    image.save_image out_image_path
  end
end
