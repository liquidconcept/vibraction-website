require 'rails_helper'

describe Agenda do

  describe '.import' do
    let(:file) { File.open(Rails.root.join('spec/fixtures/files/test_vibraction.csv')) }

    after :each do
      file.close
    end

    it 'should read uploaded file' do
      expect(file).to receive(:read).and_call_original

      Agenda.import(file)
    end

    it 'should set start_at with date and time_start' do
      expect do
        Agenda.import(file)
      end.to change { Agenda.where(start_at: DateTime.new(2014, 4, 10, 9, 0)).count }.from(0).to(1)
    end

    it 'should set end_at with date and time_end' do
      expect do
        Agenda.import(file)
      end.to change { Agenda.where(end_at: DateTime.new(2014, 4, 10, 12, 0)).count }.from(0).to(1)
    end

    it 'should test value full and change it to boolean' do
      expect do
        Agenda.import(file)
        expect(Agenda.first(:full).to be_a_kind_of(Boolean))
      end
    end
  end

  describe '.date_of_course' do
    let!(:cours1_group1_session1) { Agenda.create(identifier: 1, group: 1, session: 1) }
    let!(:cours1_group1_session2) { Agenda.create(identifier: 1, group: 1, session: 2) }
    let!(:cours1_group2) { Agenda.create(identifier: 1, group: 2) }
    let!(:cours2_group1) { Agenda.create(identifier: 2, group: 1) }

    subject { Agenda.date_of_course(1) }

    it 'should be grouped by group number' do
      expect(subject.keys).to include(1, 2)
    end

    it 'group should contain right agenda' do
      expect(subject[1]).to include(cours1_group1_session1)
      expect(subject[1]).to_not include(cours1_group2)
      expect(subject[1]).to_not include(cours2_group1)
    end

    it 'group should contain ordered agenda' do
      expect(subject[1]).to eq([cours1_group1_session1, cours1_group1_session2])
    end
  end

end
