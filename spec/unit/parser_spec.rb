require 'spec_helper'

module HtmlRuby

  describe Parser do
    it "parse tag" do
      input = "html 'hi'"

      expected = Template.new([
        Tag.new("html", [
          Text.new("hi")
        ])
      ])

      expect(subject.scan_str(input)).to eq(expected)
    end

    it "parse expression" do
      input = "html {{ name }}"

      expected = Template.new([
        Tag.new("html", [
          Expression.new("name")
        ])
      ])

      expect(subject.scan_str(input)).to eq(expected)
    end

    it "parse nested tag" do
      input = "html { p {} }"

      expected = Template.new([
        Tag.new("html", [
          Tag.new("p", [])
        ])
      ])

      expect(subject.scan_str(input)).to eq(expected)
    end
  end

end
