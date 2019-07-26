require 'ITestcaseImpl'

# puts ARGV.length
# puts $LOAD_PATH

class TestBSInfo < ITestcaseImpl
  def initialize
   super
 end
 
  def setUp
    
  end
  
  def testBsinfo
    TagValue.new(2,'TableName','CBP_NODE').loginfo
    BSTestInfo.new.loginfo
  end
end
