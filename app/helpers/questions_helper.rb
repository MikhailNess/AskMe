module QuestionsHelper
  def question_author(question)
    author = question.author
    if author
      link_to "#{display_nickname(author)}", user_path(author)
    else
      content_tag :i, "Аноним"
    end
  end
end
