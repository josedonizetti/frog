require 'spec_helper'

describe Tilt::FrogTemplate do

  it "registered for '.liquid' files" do
    expect(Tilt['frog']).to eq(Tilt::FrogTemplate)
  end

  it "preparing and evaluating templates on #render" do
    template = Tilt::FrogTemplate.new { |t| "p 'Hello World!'" }
    expect(template.render).to eq("<p>Hello World!</p>")
  end

  it "can be rendered more than once" do
    template = Tilt::FrogTemplate.new { |t| "p 'Hello World!'" }
    3.times { expect(template.render).to eq("<p>Hello World!</p>") }
  end

  it "passing locals" do
    template = Tilt::FrogTemplate.new { "p 'Hey \#{ name }!'" }
    expect(template.render(nil, :name => 'Joe')).to eq("<p>Hey Joe!</p>")
  end

end
