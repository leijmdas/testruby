require 'Testlog'

class Testresult
  include Testlog
  
  attr_accessor  :suitename,:testname
  attr_accessor :retcode, :errmsg
  
  def loginfo()
    
    self<<sprintf("#{@suitename}::#{@testname} retcode=[ %d ]",@retcode)
   if @errmsg !=""     
    self<<sprintf("errmsg=[ %s ]",@errmsg)
   end
  end
  
  def initialize
    @suitename=""
    @testname=""
    @retcode=0
    @errmsg=""
  end
  
end


class Testfixture <Object
  include Testlog

#attr_accessor :testresults
#attr_accessor :tests

  def checkEQ(exp,real)
    if exp!=real
      raise sprintf("exp: %d != %d :real",exp,real)
    end
  end
 
  def initialize
    
    @tests=[]
    @testresults=[]
  end
  
  def setup    
  end
  
  def tearDown    
  end

  def countSuite(suitesum)
    if @testresults!=nil
    for ts in @testresults 
      suitesum.total+=1
  
      if ts.retcode==0
        suitesum.success+=1
      else
        suitesum.testresults<<ts    
      end
    end
    end
  end
  
def run
  for test in @tests
    ts=Testresult.new
    ts.suitename=self.class.name
    ts.testname=test.to_s
    log "Enter "<<self.class.name<<"::"<<test.to_s
    begin
      
      self.setUp if respond_to?(:setUp)
      self.method(test).call
       
    rescue Exception =>ex
     
      ts.retcode=99999
      ts.errmsg=ex.to_s
    ensure
       self.tearDown  if respond_to?(:tearDown)
       ts.loginfo
     end
     @testresults<<ts  if @testresults  and ts 
      log  "Exit "<<self.class.name<<"::"<<test.to_s 
      log  
    end
  end
  

  
  def addTest    
#    @tests = []    
#    self.class.instance_methods.each     {      |x|    @tests<<x      if (x =~/^test/i )!=nil      }
     @tests = self.class.public_instance_methods(true).grep(/^test/i).map { |m| m.to_s }
  end
  
end

