require 'rails_helper'

RSpec.describe PaymentsController do
  let(:user) { create :user }

  before { sign_in user }

  describe "GET #index" do
    let(:student) { create :student }
    let(:payment) { create :payment, student_id: student.id }
    subject { get :index, student_id: student.id }  

    it_behaves_like 'template rendering action', :index    
  end

  describe "GET #new" do
    let(:student) { create :student }
    subject { get :new, student_id: student.id }  

    it_behaves_like 'template rendering action', :new 
  end

  describe "GET #show" do
    let(:student) { create :student }
    let(:payment) { create :payment, student_id: student.id }    
    subject { get :show, id: payment.id, student_id: student.id }  

    it_behaves_like 'template rendering action', :show 
  end  

  describe "POST #create" do
    let!(:student) { create :student }
    let!(:params) { build(:payment).attributes }
    subject { post :create, student_id: student.id,  payment: params  }

    context "success path" do
      it { is_expected.to redirect_to students_path}
      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq I18n.t('shared.created', resource: 'Payment')
      end
      it 'creates payment' do
        expect{ subject }.to change(Payment, :count).by(1)
      end 
    end

    context 'failure path' do
      include_context 'record save failure'

      it_behaves_like 'template rendering action', :new 
    end   
  end

  describe "GET #full_index" do
    subject { get :full_index }

    it_behaves_like 'template rendering action', :full_index    
  end
end