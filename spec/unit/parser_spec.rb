require 'spec_helper'

describe HtmlRuby::Parser do
  it "parse tag" do
    input = "html 'hi'"
    subject.scan_str(input).inspect
  end

  it "parse expression" do
    input = "html {{ name }}"
    subject.scan_str(input).inspect
  end

  it "parse nested tag" do
    input = "html { p {} }"
    subject.scan_str(input).inspect
  end
end
