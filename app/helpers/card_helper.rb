module CardHelper

  def card_report(report)
    tag.div class: 'card', style: 'width: 18rem; margin-top: 20px;' do
      tag.div class: 'card-body' do
        concat content_tag(:h5, report[:name], class: 'card-title')
        concat content_tag :p, report[:short_description], class: 'card-text'
        concat content_tag :p, report[:temporal], class: 'card-text'
        concat content_tag :p, report[:geographic], class: 'card-text'
        concat content_tag :p, number_to_currency(report[:base_price]) , class: 'card-text'

        user_report = UserReport.where(user_id: current_user, report_id: report).first
        if user_report.nil?
          concat link_to "Adquirir", new_user_report_path(id: report.id), class: 'btn btn-primary'
        else
          concat link_to "Revogar", user_report_path(user_report), method: :delete, class: 'btn btn-danger',
                 data: { confirm: "Tem certeza que deseja revogar o acesso ao relatório '#{report.name}'?" }
        end
      end
    end
  end
end
