require 'spec_helper'

module HtmlRuby
  describe 'Compiler' do

    let(:compiler) { Compiler.new }
    let(:parser) { Parser.new }

    it 'compile tag' do
      parser.scan_str("html 'hi'").compile(compiler)
      expect(compiler.execute).to eq("<html>hi</html>")
    end

    it 'compile expression' do
      parser.scan_str("html {{ name }}").compile(compiler)
      expect(compiler.execute({ name: 'marc' })).to eq("<html>marc</html>")
    end

    it 'compile statement' do
      parser.scan_str("html {\n" +
                     "{% for i in 0..2 %}\n" +
                     "{{ i }} ','\n" +
                     "{% end %}\n" +
                   "}").compile(compiler)

      expect(compiler.execute).to eq("<html>0,1,2,</html>")
    end
  end
end
