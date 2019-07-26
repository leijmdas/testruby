require 'ITestcode'
require 'TestBinBuffer'

class TagValue   < ITestcode
 
  attr_accessor :type,:name,:value
  
   def initialize (atype =0, aname ="unkownTag",avalue="0")
   
    super()
    @type=TestAttr.new(type =TestAttr::ATTRTYPE_INT4,name="tagtype",atype.to_s)
    @name=TestAttr.new(type =TestAttr::ATTRTYPE_STRING,name="tagname",aname,40)
    @value=TestAttr.new(type = TestAttr::ATTRTYPE_STRING,name="tagvalue",avalue)
    
    @testAttrs<<@type<<@name<<@value    
  end  
  
end

class TagArray   < ITestcode
  
  def initialize
    super
    @tagnumber =TestAttr.new(type =TestAttr::ATTRTYPE_INT4,name="tagnumber","0")
    @tagValues=[]
    @testAttrs<< @tagnumber 
    
  end
  
  def decode(testbin)
    @testAttrs.each{ |x| x.decode(testbin) }
    @tagValues.each{ |x| x.decode(testbin) }
    
  end
  
  def encode(testbin)
    @testAttrs.each{ |x| x.encode(testbin) }
    @tagValues.each{ |x| x.encode(testbin) }
    
  end 
  
end