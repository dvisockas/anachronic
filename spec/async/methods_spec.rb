# frozen_string_literal: true

require 'sidekiq'

RSpec.describe Anachronic do
  subject { ExampleClass.new.hello }

  before do
    class ExampleClass
      extend Anachronic

      async def hello
        puts 'World!'
      end
    end
  end

  it 'has a version number' do
    expect(Anachronic::VERSION).not_to be nil
  end

  it 'does something useful' do
    allow(Anachronic::BackgroundExecutor).to receive(:call)

    subject
  end

  it 'does not raise erorrs' do
    expect { subject }.to_not raise_error
  end
end
