# frozen_string_literal: true

module TimeHelper
  def tag_time_ago_in_words(date, translate = "time_helper.tag_time_ago_in_words.html")
    t(
      translate,
      time: tag.time(
        time_ago_in_words(date),
        datetime: date.iso8601
      )
    )
  end
end
