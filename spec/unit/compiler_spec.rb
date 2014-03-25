require 'spec_helper'

describe 'Compiler' do

  let(:compiler) { HtmlRuby::Compiler.new }
  let(:parser) { HtmlRuby::Parser.new }

  it 'compile tag' do
    parser.scan_str("html 'hi'").compile(compiler)
    compiler.execute.should be == "<html>hi</html>"
  end

  it 'compile expression' do
    parser.scan_str("html {{ name }}").compile(compiler)
    compiler.execute({ name: 'marc' }).should == "<html>marc</html>"
  end

  it 'compile statement' do
    parser.scan_str("html {\n" +
                   "{% for i in 0..2 %}\n" +
                   "{{ i }} ','\n" +
                   "{% end %}\n" +
                 "}").compile(compiler)

    compiler.execute.should be == "<html>0,1,2,</html>"
  end
end
