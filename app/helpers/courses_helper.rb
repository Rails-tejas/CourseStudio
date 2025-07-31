module CoursesHelper

  def course_thumbnail(course)
    title = course.title.downcase

    if title.include?("python")
        "thumbnails/python.jpg"

    elsif title.include?("javascript")
        "thumbnails/javascript.jpg"

    elsif title.include?("java")
        "thumbnails/java.jpg"

    elsif title.include?("ruby")
        "thumbnails/ruby.jpg"

    elsif title.include?("html")
        "thumbnails/html.jpg"
    
    elsif title.include?("php")
        "thumbnails/php.jpg"

    elsif title.include?("chatgpt")
        "thumbnails/chatgpt.jpg"

    else
        "thumbnails/default.jpg"
    end
  end

end
