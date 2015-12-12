module CommonUtil

  def self.removeOption(str)
    s = str.gsub(/\(.+?\)/,'')
    return s
  end
  def self.splitData(str)
    sArray = str.split("、")
    return sArray
  end
end
