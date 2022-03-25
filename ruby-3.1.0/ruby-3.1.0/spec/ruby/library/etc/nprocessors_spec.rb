require_relative '../../spec_helper'
require 'etc'

describe "Etc.nprocessors" do
  it "returns the number of online processors" do
    Etc.nprocessors.should be_kind_of(Integer)
    Etc.nprocessors.should >= 1
  end
end
