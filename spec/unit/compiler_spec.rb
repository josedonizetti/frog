require 'spec_helper'

module Frog
  describe 'Compiler' do

    let(:compiler) { Compiler.new }
    let(:parser) { Parser.new }

    it 'compile tag' do
      parser.scan_str("html 'hi'").compile(compiler)
      expect(compiler.execute).to eq("<html>hi</html>")
    end

    it 'compile expression' do
      parser.scan_str("html \#{ name }").compile(compiler)
      expect(compiler.execute({ name: 'marc' })).to eq("<html>marc</html>")
    end

    it 'compile statement' do
      parser.scan_str("html {\n" +
                     "- for i in 0..2\n" +
                     "\#{ i } ','\n" +
                     "- end\n" +
                   "}").compile(compiler)

      expect(compiler.execute).to eq("<html>0,1,2,</html>")
    end

    it "compile tag using a class" do
      parser.scan_str("html.purple { }").compile(compiler)
      expect(compiler.execute).to eq("<html class='purple'></html>")
    end

    it "compile a tag using an id" do
      parser.scan_str("html#green { }").compile(compiler)
      expect(compiler.execute).to eq("<html id='green'></html>")
    end

    it "compile a tag using an id and a class" do
      parser.scan_str("html#green.purple { }").compile(compiler)
      expect(compiler.execute).to eq("<html id='green' class='purple'></html>")
    end

    it "compile a tag using multiples classes and id" do
      parser.scan_str("html.reset.purple#green { }").compile(compiler)
      expect(compiler.execute).to eq("<html class='reset purple' id='green'></html>")
    end

  end
end
