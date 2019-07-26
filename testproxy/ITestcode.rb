require 'TestBinBuffer'
require 'Testlog'

class ITestcode<Object
  include Testlog
  
  def initialize 
    @testAttrs =  []  #TestAttr.new
    
  end
  
  def setAttr(name,value)
    for attr in @testAttrs
      if name==attr.attr_name
        attr.setValue(value)
      end
    end
  end
  
  def getAttr(name)
    for attr in @testAttrs
      if name==attr.attr_name
        return attr.getValue( )
      end
      
    end
    return "0"
  end
   
  
  def decode(testbin)
    @testAttrs.each{ |x| x.decode(testbin) }
    
  end
  def encode(testbin)
    @testAttrs.each{ |x| x.encode(testbin) }
    
  end 
  
  def loginfo
      log "#{self.class.name} info is:"
      @testAttrs.each{ |x| x.loginfo }
      
  end
  
end