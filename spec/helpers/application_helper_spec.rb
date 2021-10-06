require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#full_title" do
    it '引数がない場合はSearching outletを返す' do
      expect(helper.full_title).to eq("Searching outlet")
    end

    it '引数が空文字列の場合はSearching outletを返す' do
      expect(helper.full_title('')).to eq("Searching outlet")
    end

    it '引数がnilの場合はSearching outletを返す' do
      expect(helper.full_title(nil)).to eq("Searching outlet")
    end

    it '引数がある場合は引数+Searching outletを返す' do
      expect(helper.full_title('test')).to eq("test | Searching outlet")
    end
  end
end
