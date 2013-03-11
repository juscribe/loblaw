# encoding: utf-8

shared_context 'Controller Specs', type: :controller do
  let(:klass) { controller.controller_path.singularize.classify.constantize rescue nil }
  let(:verb) { example.metadata[:verb] || :get }
  let(:action) { example.metadata[:action] || :index }
  let(:id) { example.metadata[:id] }
  let(:params) { (example.metadata[:params] || {}).merge(example.metadata.slice(:id)) }

  def make_request!(*args)
    __send__(verb, action, params.merge(use_route: :loblaw))
  end

  let(:mock_record) { stub_model(klass) }
  before { klass.stub(:find) { mock_record } if klass }

end

shared_examples 'Reachable actions' do
  it 'is a validly reachable action' do
    expect { make_request! }.not_to raise_error
  end
end

shared_examples 'Default renderers' do
  it 'renders the correct template' do
    make_request!
    expect(page).to have_rendered action.to_s
  end
end
