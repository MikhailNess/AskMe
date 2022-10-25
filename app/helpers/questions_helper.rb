module QuestionsHelper
  def question_author(question)
    author = question.author
    if author
      link_to "#{display_nickname(author)}", user_path(author)
    else
      content_tag :i, "Аноним"
    end
  end

  def text_with_hashtag_link(text)
    strip_tags(text).gsub(Hashtag::REGEXP) do |ht|
      link_to ht, hashtag_path(ht.delete('#').downcase)
    end
  end
end
