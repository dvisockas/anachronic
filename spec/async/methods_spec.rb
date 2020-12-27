# frozen_string_literal: true

RSpec.describe Anachronic do
  before do
    class ExampleClass
      extend Anachronic

      async def hello; end
    end
  end

  it 'has a version number' do
    expect(Anachronic::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(Anachronic::BackgroundExecutor).to receive(:call)
    expect { ExampleClass.new.hello }.to_not raise_error
  end
end
