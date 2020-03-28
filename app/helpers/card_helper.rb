# frozen_string_literal: true

module CardHelper
  def card_report(report)
    header_div = tag.div class: 'card-header' do
      concat content_tag :h5, report[:name], class: 'card-title'
    end

    body_div = tag.div class: 'card-body' do
      concat content_tag :p, report[:short_description], class: 'card-text'

      if report[:temporal]
        concat content_tag :p, translate_enum_value(report, :temporal), class: 'card-text'
      end
      if report[:geographic]
        concat content_tag :p, translate_enum_value(report, :geographic), class: 'card-text'
      end

      concat content_tag :p, "Preço: #{number_to_currency(report[:base_price])}",
                         class: 'card-text'
    end

    footer_div = tag.div class: 'card-footer' do
      user_report = UserReport.where(user_id: current_user, report_id: report).first
      if user_report.nil?
        concat link_to 'Adquirir', new_user_report_path(id: report.id), class: 'btn btn-primary'
      else
        concat link_to 'Revogar', user_report_path(user_report), method: :delete, class: 'btn btn-danger',
          data: { confirm: "Tem certeza que deseja revogar o acesso ao relatório '#{report.name}'?" }
      end
    end

    tag.div class: 'card text-center', style: 'width: 18rem; margin-top: 20px;' do
      header_div.concat(body_div).concat(footer_div).html_safe
    end
  end
end
