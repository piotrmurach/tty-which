# frozen_string_literal: true

RSpec.describe TTY::Which, "#executable_file?" do
  it "checks if file in directory is executable" do
    path = "/usr/local/bin/ruby"
    allow(::File).to receive(:join).with("/usr/local/bin", "ruby").and_return(path)
    allow(::File).to receive(:file?).with(path).and_return(true)
    allow(::File).to receive(:executable?).with(path).and_return(true)

    expect(TTY::Which.executable_file?("ruby", "/usr/local/bin")).to eq(true)
  end

  it "checks if only a file is executable" do
    allow(::File).to receive(:file?).with("ruby").and_return(true)
    allow(::File).to receive(:executable?).with("ruby").and_return(true)

    expect(TTY::Which.executable_file?("ruby")).to eql(true)
  end
end
