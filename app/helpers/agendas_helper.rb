module AgendasHelper
  def date_of_course(identifier)
    Agenda.date_of_course(identifier).map do |group, dates|
      if dates.last.start_at.to_date > Date.today
        button_class = ''
        button_class << ' started' if dates.first.start_at.to_date < Date.today
        button_class << ' full' if dates.first.full

        content_tag(:div, class: 'course') do
          content_tag(:ul, dates_html(dates)) +
          content_tag(:a, 'inscription', class: "submit#{button_class}" , href: "./inscription.html?cours_name=#{dates.first.name}&cours_date=#{dates.first.start_at}")
        end
      end
    end.join.html_safe
  end

  private

  def dates_html(dates)
    dates.map do |date|
      content_tag(:li) do
        l(date.start_at, format: :agenda_start) + l(date.end_at, format: :agenda_end)
      end
    end.join.html_safe
  end
end
