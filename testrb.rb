#!/usr/bin/env ruby #-w
# coding:gbk  

#''' 
#  author: leijming
#  date :20120701
#'''

load 'public/Testhelper.rb'
Testhelper::LoadHelper.loadpath
require 'ITestRunner'  

class ITestRunner
  def run
    unlinklog
    autoLoadsuite
    
    ITestsuite.showSuite
    ITestsuite.run
    ITestsuite.countSuite
    self    #exit
    
  end
  
  def help
    puts "testrb.rb -h"
    puts "testrb.rb -all"
    self
  end
  #gets
end

class ITestRunnerSuite< ITestRunner
  
 def run(suitename) 
    unlinklog
    autoLoadsuite
    
    ITestsuite.showSuite
    ITestsuite.run
    ITestsuite.countSuite
    self    #exit
  end
end

class ITestRunnerTest< ITestRunner
  
 def run(suitename,testname) 
    unlinklog
    autoLoadsuite
    
    ITestsuite.showSuite
    ITestsuite.run
    ITestsuite.countSuite
    self    #exit
  end
end

ITestRunner.instance.run#runner.help

puts ["admin"].pack("m")
puts ["admin"].pack("m").unpack("m")




 


