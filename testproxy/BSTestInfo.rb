require 'Testfixture'
require 'ITestcode'
require 'TagValue'

class TestcaseResult < ITestcode
  
  #@suitename=""
  #@testname=""
  #@retcode=0
  #@errmsg=""
  def initialize
    super 
    @suitename=TestAttr.new(type =TestAttr::ATTRTYPE_STRING,name="suitename","",40)
    @testname = TestAttr.new(type = TestAttr::ATTRTYPE_STRING,name="testname")
    @retcode   = TestAttr.new(type =TestAttr::ATTRTYPE_INT4,name="retcode","0")
    @errmsg    = TestAttr.new(type = TestAttr::ATTRTYPE_STRING,name="errmsg")
    
    @testAttrs<< @suitename << @testname <<@retcode<< @errmsg
    
  end
end

class BSTestInfo< ITestcode
  def initialize
     super
     @cmdtype=TestAttr.new(type =TestAttr::ATTRTYPE_INT4,name="cmdtype","0")
     @cmddesc=TestAttr.new(type =TestAttr::ATTRTYPE_STRING,name="cmddesc","",40)
     @testresult=TestcaseResult.new
     @tagarray =TagArray.new
     
     @testAttrs<< @cmdtype << @cmddesc
  end
  
  def decode(testbin)
    super
    @testresult.decode(testbin)
    @tagarray.decode(testbin)
    
  end
  
  def encode(testbin)
    super
    @testresult.encode(testbin)
    @tagarray.encode(testbin)
    
  end
    
  def loginfo
    super
  end
  
end

