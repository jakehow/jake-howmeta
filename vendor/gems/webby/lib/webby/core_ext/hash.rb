
class Hash

  def sanitize!
    h = self.injecting({}) do |h, (k, v)|
          h[k] = case v
                 when 'none', 'nil'; nil
                 when 'true', 'yes'; true
                 when 'false', 'no'; false
                 else v end
        end
    self.replace h
  end

  def stringify_keys
    h = {}
    self.each {|k,v| h[k.to_s] = v}
    return h
  end

  def symbolize_keys
    h = {}
    self.each {|k,v| h[k.to_sym] = v}
    return h
  end
end  # class Hash

# EOF
