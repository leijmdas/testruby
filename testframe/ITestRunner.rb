#coding: gbk

require 'Singleton'
require 'Testsuite'
require 'Testlog'

$TESTRB_FILE ="testrb.rb"

class ITestRunner < Object
  include Testlog
  include Singleton 
  
  def autoLoadsuite
    
    ITestsuite.clear
    findTestClass.each do |testsuite|
      ITestsuite.addSuite( testsuite.class.name,testsuite )      
    end    
  end
   
  def findrb
    rbfiles = File.join("**", "*.rb")
    Dir.glob(rbfiles)       
  end 
  
  #files.map{|f|  f.gsub(/public\/|testcase\/|testtools\//,"")\
  #                    .gsub(/testframe\/|testproxy\//,"")}\
  #.each do   |f| require f    if f != $TESTRB_FILE end        
  def requireFile(f)
    ff=f.gsub(/public\/|testcase\/|testtools\//,"")\
          .gsub(/testframe\/|testproxy\//,"")
   require ff    if ff != $TESTRB_FILE        
  end
  
  public
  def findTestClass       
    
    objlist=[]     
    for f in self.findrb      
      requireFile(f)
      
      File.open(f) do |file|
        file.each do |line| 
          if (line=~/\s*class\s*/)
            
            clsname= line.gsub(/class\s*/,"").gsub(/\s*\<\s*\w+|\n/,'')                  
            if ( clsname=~/^test/i)  and clsname != 'Testfixture'                 
              obj = instance_eval( clsname+".new" )                       
              objlist<< obj     if obj.kind_of?(Testfixture)
            end
            
          end
        end 
      end
      
    end
    objlist
  end
    

  
  def runSuite(suitename)    
  end
  
  def runTest(suitename,testname)    
  end
  
end


