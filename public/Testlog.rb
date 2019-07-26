require 'Testhelper'

module Testlog
  include  Testhelper 
  
  $FILELOG="log/rbtest.log"
  def unlinklog
    if   FileTest::exists?($FILELOG)
      File.delete($FILELOG)
    end 
    self
  end
  
  def log(inf="")
    self<<inf
  end
  
  def <<(inf)
   
    file = File.open($FILELOG,'a')
    puts inf+"\n"
    file.write(inf+"\n")
    file.close
  end
  
  def logbin(data,prompt="")
      if prompt 
        print  prompt<<" "
      end
      self<<loghex2str(data)
  end
  
  end