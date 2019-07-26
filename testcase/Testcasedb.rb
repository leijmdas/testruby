require 'ITestcaseImpl'
class Testcasedb < ITestcaseImpl
  
  def setUp
    
  end
  def tearDown
    
  end
  
  def testMdb 
    self<< 'test mdb'
    checkEQ('1','1')
  end
  
  def testcasePdb 
    self<< 'test pdb'
    checkEQ(22, 2 )
  end
  
  def testHash_each
    ary=['231','112']
    ary.map { |val| val << "2" } 
    p  ary.sort
    hash = {1 => 'one', 2 => 'two', 3 => 'three'}
    
    p "p hash : #{hash}"
    p "hash.each"
    hash.each do |e| #e is [key,value]
      p e
    end
    
    p "hash.each_pair"
    hash.each_pair do |k,v| #k and v class as in hash
      p "#{k}=#{v}"
    end
    checkEQ(12, 2 )
  end
  
  def testBase64
    #md5����
    #require 'md5'   
    #puts MD5.hexdigest('admin')   
    
    #sha1����
    require 'digest/sha1'
    puts Digest::SHA1.hexdigest('admin')  
    
    #base64
    require 'base64'   
    code = Base64.encode64('admin2000y')    
    puts code
    source = Base64.decode64(code) 
    puts source
    puts ["admin"].pack("m")
    puts ["admin"].pack("m").unpack("m")
  end
end