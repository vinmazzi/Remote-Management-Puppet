require 'spec_helper'

describe 'single_quote_string_with_variables' do
  let(:msg) { 'single quoted string containing a variable found' }

  context 'multiple strings in a line' do
    let(:code) { "\"aoeu\" '${foo}'" }

    it 'should only detect a single problem' do
      expect(problems).to have(1).problem
    end

    it 'should create an error' do
      expect(problems).to contain_error(msg).on_line(1).in_column(8)
    end
  end
end
