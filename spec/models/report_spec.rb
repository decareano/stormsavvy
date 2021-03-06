require 'spec_helper'

describe Report do

  let!(:r1) { FactoryGirl.create(:report) }
  let!(:r2) { FactoryGirl.create(:report) }
  let!(:r3) { FactoryGirl.create(:report) }
  let!(:r4) { FactoryGirl.create(:report) }
  let!(:attachment) { FactoryGirl.create(:report) }
  let(:reports1) { [ r1, r2 ] }
  let(:reports2) { [ r3, r4 ] }
=begin
  before(:each) do
    @reports1 = [@r1, @r2]
    @reports2 = [@r3, @r4]

    [@r1, @r2].each do |r|
      FactoryGirl.create(
        :report,
        :site_id => 1
      )
    end

    [@r3, @r4].each do |r|
      FactoryGirl.create(
        :report,
        :site_id => 2
      )
    end
  end
=end
  context 'counting' do
    it "creates new report given site_id" do
      expect { Report.create(
        :site_id => 3
        )
      }.to change(Report, :count).by(+1)
    end
  end

  context 'CRUD operations' do
    it "should insert 4 reports" do
      reports2.insert(2, r3, r4)
      reports2.count.should == 4

      reports2.push(r3, r4)
      reports2.count.should == 6
    end

    it "should delete added report" do
      precount = reports1.count
      reports1.delete_at(1)
      reports1.count.should == precount - 1
    end

    it "should find report by id" do
      r1 = Report.find(1)
      r1.id.should eq(1)
    end

    it "should not insert invalid reports given site_id" do
      site = FactoryGirl.create(:site)
      r = Report.new(
        :site => site,
        :site_id => site.object_id
      )
      r.should be_valid

      r5 = Report.create(
        :site => site,
        :site_id => site.object_id
      )
      expect { reports2 << r5 }.to change(Report, :count).by(0)
    end
  end

  context 'scopes' do
    it "should ony return reports needing attention" do
      Report.needs_attention.where_values_hash.should ==
        { 'status' => 'needs_attention' }
    end

    it "should ony return completed reports" do
      Report.completed.where_values_hash.should ==
        { 'status' => 'completed' }
    end
  end

  describe 'file attachments' do
    before do
      Report.any_instance.stub(:save_attached_files).and_return(true) 
      Report.any_instance.stub(:destroy_attached_files).and_return(true) 
    end

    describe "#attachment" do
      it "returns correct url" do
        attachment.attachment.url.should_not be_nil
      end
    end
  end
end
