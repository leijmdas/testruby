#!/usr/bin/env ruby -w
require 'Testlog'

require 'Testfixture'
require 'BSTestInfo'

class  ITestcaseImpl < Testfixture
  
  attr_accessor :bstestinfo
  
  def initilize
    super
    @bstestinfo=BSTestInfo.new
    
  end
  
end
