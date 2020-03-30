# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EnumHelper. For example:
#
# describe EnumHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EnumHelper, type: :helper do

  let(:report) { FactoryBot.create(:report) }

   describe "enum helper method" do
     it "options_for_enum" do
       options = options_for_enum(report, :temporal)
       expect(options).to include("D", "W", "Y")
     end

     it "enums_to_translated_options_array" do
       options = enums_to_translated_options_array(report.class.name, 'temporal')
       expect(options).to include(["Diária", "D"], ["Semanal", "W"], ["Mensal", "M"], ["Anual", "Y"])
     end

     it "translate_enum_value" do
       report.temporal = 0
       value = translate_enum_value(report, :temporal)
       expect(value).to eq('Diária')
     end
   end

end
