module SurveysHelper
  def create_base_sentence(sentence_type)
    if sentence_type == 1
        'Which one do you '
    elsif sentence_type == 2
        'Which one is '
    end
  end

  def create_image_tag(pictures, type)
    if pictures.find_by(picture_type: type)
      image_tag(pictures.find_by(picture_type: type).uri, width: '140px', height: 'auto')
    end
  end
end
