# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CardHelper. For example:
#
# describe CardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CardHelper, type: :helper do
  let(:user) { FactoryBot.create(:user) }
  let(:report) { FactoryBot.create(:report) }

  before { allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user) }

  describe '#card' do
    xit 'create a correctly card' do
      #allow(helper).to receive(:current_user).and_return(user)
      #allow(card_report).to receive(:current_user).and_return(user)

      card = card_report report
      expect(card).to exist
    end
  end
end
