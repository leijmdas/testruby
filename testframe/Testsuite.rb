require 'Testfixture'
require 'Testlog'

class Sumsuite
  include Testlog
  
  attr_accessor :testresults  
  attr_accessor :success,:total  #FAILED
  
  def initialize    
    @total=0
    @success=0
    @testresults =[]
  end
  
  def showSumsuite
    self<<  "****************************ruby testresult**********************************"
    self<<  "\ttestcase Total:\t\t%d"%@total
    self<<  "\ttestcase Success:\t%d"%@success
    self<<  "\ttestcase Failed:\t\t%d"%(@total-@success)
    self<<  "*************************testcase failed info********************************"
    
    @testresults.each do 
      |ts|
      #self <<  sprintf("%s::%s retcode=[ %d ] Errmsg=[ %s ]",ts.suitename,ts.testname,ts.retcode,ts.errmsg)
      STDERR <<  sprintf("%s::%s retcode=[ %d ] Errmsg=[ %s ]",ts.suitename,ts.testname,ts.retcode,ts.errmsg)
      STDERR << "\n"
    end
  end
  
end


class ITestsuite
  include Testlog
  @@sumsuite=Sumsuite.new
  @@suites={}
  
  def self.clear 
    @@suites.clear
  end

  def self.addSuite(suitename,suite)
    @@suites[suitename]=suite
    suite.addTest
    #puts suitename
  end
    
  def self.showSuite
    
    ts=ITestsuite.new
    ts<<  sprintf("ruby testsuite list %d as:",  @@suites.length)
    ts<<  "==================================="
    i=1
    for suitename,suite in @@suites
      ts<< sprintf("\t[suite %d ] %s",i,suitename)
      i+=1
    end
    ts<<""
    
  end
  
  def self.run
    @@suites.each {|suitename,suite |  suite.run }     
  end
  
  def method_missing(methodid)
    nil  
  end
  
  def self.countSuite
    
    @@sumsuite=Sumsuite.new
    @@suites.each {|suitename,suite |  suite.countSuite(@@sumsuite) }     
    
    @@sumsuite.showSumsuite
  end
  
end
