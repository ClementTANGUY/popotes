require 'cgi'

module URI
  def self.decode_www_form_component(str, enc=nil, tb=nil)
    if TBLDECWWWCOMP_.empty?
      tbl = {}
      256.times do |i|
        h, l = i>>4, i&15
        tbl['%%%X%X' % [h, l]] = i.chr
        tbl['%%%x%X' % [h, l]] = i.chr
        tbl['%%%X%x' % [h, l]] = i.chr
        tbl['%%%x%x' % [h, l]] = i.chr
      end
      tbl['+'] = ' '
      TBLDECWWWCOMP_.replace(tbl)
      begin
        TBLDECWWWCOMP_.freeze
      rescue TypeError
      end
    end
    str = str.gsub(/%(?![0-9a-fA-F]{2})/, "%25")
    str.gsub(/\+|%[0-9a-fA-F]{2}/) {|m|
      if m == '+'
        ' '
      else
        TBLDECWWWCOMP_[m]
      end
    }.force_encoding(enc)
  end

  def self.encode_www_form_component(str, enc=nil)
    enc = Encoding::UTF_8 if !enc || enc == Encoding::DefaultInternal
    str = str.to_s.dup.force_encoding(enc)
    str.gsub!(/[^*\-.0-9A-Z_a-z]/) {|ch| sprintf('%%%02X', ch.unpack("C")[0]) }
    str.force_encoding(Encoding::US_ASCII)
  end
end

=begin

require 'cgi'

module URI
  module_function

  def decode(url)
    CGI.unescape(url)
  end

  def escape(url)
    CGI.escape(url)
  end
end

#CGI.escape, URI.encode_www_form or URI.encode_www_form_component
#CGI::escape

require 'uri'

module URI
  def CGI.decode(url)
    url
  end

  def CGI.escape(url)
    url
  end
end

require 'uri'

module URI
    class << self
        def decode(str)
            alpha = "a-zA-Z"
            alnum = "#{alpha}\\d"
            unreserved = "\\-_.!~*'()#{alnum}"
            reserved = ";/?:@&=+$,\\[\\]"
            unsafe = Regexp.new("[^#{unreserved}#{reserved}]")
            str.gsub(unsafe) do
                us = $&
                tmp = ''
                us.each_byte do |uc|
                    tmp << sprintf('%%%02X', uc)
                end
                tmp
            end.force_encoding(Encoding::US_ASCII)
        end
    end
end

require "uri"

module URI
  class FormEncoded
    def encode(request)
      encoded_params = []
      request.body.each do |k, v|
        encoded_params.push("#{encode_part(k)}=#{encode_part(v)}")
      end

      encoded_params.join("&")
    end

    def decode(body)
      raise UnsupportedEncodingError.new("FormEncoded does not support deserialization")
    end

    def content_type
      /^application\/x-www-form-urlencoded/
    end

    private

    def encode_part(part)
      URI.encode_www_form_component(part.to_s)
    end
  end
end

=end
