require 'ITestcaseImpl'
#puts ARGV.length# puts $LOAD_PATH
class TestcaseDemo < ITestcaseImpl
  def initialize
   super
  end
  def setUp
    
  end
  
  def testDemoA
    self<< 'test demoA'
  end  
  
  def testDemoB
    self<< 'test DemoB'
    p 'ddd rffff gg'.split(/\s+/).join(":")
    
    
    puts 1.between?(1,10)    
    hash = {1 => 'one', 2 => 'two', 3 => 'three'}
    
    hash.each do |key,value|
      #p key<<":"<<value
    end
  end
end


