# frozen_string_literal: true

RSpec.describe Anachronic do
  let(:example_class) do
    class Delayed
      include Anachronic

      async def hello; end
    end
  end

  it 'has a version number' do
    expect(Anachronic::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(Anachronic::BackgroundExecutor).to receive(:call)

    example_class.new.hello
  end
end
