class TestHexStr < ITestcaseImpl
  def initialize
    super
  end
  
  def setUp    
  end
  
  def testbinlog
    a=[100].pack("i").reverse*10+"abcd111111987ghhjji"
    logbin(a,self.class.name)
    
  end
  
end

