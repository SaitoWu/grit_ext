# encoding: UTF-8

require "spec_helper"

describe GritExt do
  describe :encode! do
    it "should return nil if the message is nil" do
      message = GritExt.encode! nil
      message.should be_nil
    end

    it "should return binary it self when message is binary" do
      message = "\xFF\xD8\xFF\xE0"
      encoded_message = GritExt.encode!(message)
      encoded_message.bytes.to_a.should eql(message.bytes.to_a)
      message.encoding.name.should eql("ASCII-8BIT")
    end

    it "cleans up UTF-8 strings with invalid encoding" do
      message = GritExt.encode!("yummy\xE2 \xF0\x9F\x8D\x94 \x9F\x8D\x94")
      message.should eql("yummy 🍔 ")
      message.encoding.name.should eql("UTF-8")
    end

    it "encode string to UTF-8" do
      message = GritExt.encode!("{foo \xC3 'bar'}")
      message.should eql("{foo Ã 'bar'}")
      message.encoding.name.should eql("UTF-8")

      message = "我爱你".encode("GBK")
      message.encoding.name.should eql("GBK")
      GritExt.encode!(message)
      message.should eql("我爱你")
      message.encoding.name.should eql("UTF-8")
    end
  end
end
