#coding: gbk
#TestAttr
require 'Testlog'

class TestAttr
   include Testlog
   
  ATTRTYPE_INT2=1
  ATTRTYPE_INT4=2
  ATTRTYPE_INT8=3
  ATTRTYPE_DOUBLE=4
  
  ATTRTYPE_STRING=8
  ATTRTYPE_BLOB  =10
  
  attr_accessor :attr_type,:attr_name,:attr_value ,:attr_isfix,:attr_len
  def setValue(value)
    @attr_value=value  
  end
  
  def getValue
    @attr_value  
  end
  
  def initialize(type =ATTRTYPE_INT4,name="unknown",\
    value="undefine",len=-1,isfix=true)
    @attr_type   = type
    @attr_name = name
    @attr_value = value
    
    @attr_len =  len
    @attr_isfix =  isfix
    if type == ATTRTYPE_INT2
      @attr_len =  2;@attr_isfix=true;
    end
    if type == ATTRTYPE_INT4
      @attr_len =  4;@attr_isfix=true;
    end
    if type == ATTRTYPE_INT8 or type==ATTRTYPE_DOUBLE
      @attr_len =  8;@attr_isfix=true;
    end
  end
  
  def to_s
    s=sprintf( "attr_name:type=%s:%d \t",@attr_name,@attr_type)
    s<<sprintf( "value=%s\t",@attr_value) 
    s<<sprintf( "len=%d \t",@attr_len)  
    s<<sprintf( "isfix=%s\t",@attr_isfix.to_s)  
   
  end
  
def loginfo
    log to_s
     
  end
  

  
  def decode(testbin)
    if @attr_type==ATTRTYPE_INT4
      @attr_value=testbin.getInt4
    elsif      @attr_type==ATTRTYPE_INT8
      @attr_value=testbin.getInt8
      elsif      @attr_type==ATTRTYPE_BLOB
      @attr_value=testbin.getBlob( @attr_len )
    
    else      @attr_type==ATTRTYPE_STRING
      @attr_value=testbin.getString      
    end
  end
  
  def encode(testbin)
    if @attr_type==ATTRTYPE_INT4
      testbin.putInt4(@attr_value.to_i)
    elsif      @attr_type==ATTRTYPE_INT8
      testbin.putInt8(@attr_value.to_i)
    elsif      @attr_type==ATTRTYPE_BLOB
      testbin.putBlob(@attr_value,@attr_len)
    else      @attr_type==ATTRTYPE_STRING
      testbin.putString(@attr_value)      
    end
  end
end

class TestBinBuffer
  
  attr_accessor :data,:pos,:limit
  
  def initialize
    @data=""
    @pos=0
    @limit=0
  end
  
  def flip
    @limt=@pos
    @pos=0
  end
  
  def getInt4( )    
  end
  
  def putInt4(ivalue)
    @data<<[ivalue].pack("i")
    self
  end
  
  def getInt8( )    
  end
  
  def putInt8(lvalue)
    @data<<[lvalue].pack("q")
    self
  end
  
  def getString( )    
  end
  
  def putString(svalue)
    #@data<<[ivalue].pack("i")
    self
  end
  
    def getBlob( hlen)    
    end
    
    def putBlob(bvalue,blen)
      #@data<<[ivalue].pack("i")
      self
    end
  
  def logbin
    puts @data
    self
  end
  
#  def encode(*testAttr)
#    for attr in testAttr
#      attr.encode(self)
#      end
#  end
#
#  def decode(*testAttr)
#    for attr in testAttr
#      attr.decode(self)
#      end
#  end
  
end

#TestBinBuffer.new.putInt4(11).logbin
#"""Format | Returns | Function
#-------+---------+-----------------------------------------
#  A    | String  | with trailing nulls and spaces removed
#-------+---------+-----------------------------------------
#  a    | String  | string
#-------+---------+-----------------------------------------
#  B    | String  | extract bits from each character (msb first)
#-------+---------+-----------------------------------------
#  b    | String  | extract bits from each character (lsb first)
#-------+---------+-----------------------------------------
#  C    | Fixnum  | extract a character as an unsigned integer
#-------+---------+-----------------------------------------
#  c    | Fixnum  | extract a character as an integer
#-------+---------+-----------------------------------------
#  d,D  | Float   | treat sizeof(double) characters as
#       |         | a native double
#-------+---------+-----------------------------------------
#  E    | Float   | treat sizeof(double) characters as
#       |         | a double in little-endian byte order
#-------+---------+-----------------------------------------
#  e    | Float   | treat sizeof(float) characters as
#       |         | a float in little-endian byte order
#-------+---------+-----------------------------------------
#  f,F  | Float   | treat sizeof(float) characters as
#       |         | a native float
#-------+---------+-----------------------------------------
#  G    | Float   | treat sizeof(double) characters as
#       |         | a double in network byte order
#-------+---------+-----------------------------------------
#  g    | Float   | treat sizeof(float) characters as a
#       |         | float in network byte order
#-------+---------+-----------------------------------------
#  H    | String  | extract hex nibbles from each character
#       |         | (most significant first)
#-------+---------+-----------------------------------------
#  h    | String  | extract hex nibbles from each character
#       |         | (least significant first)
#-------+---------+-----------------------------------------
#  I    | Integer | treat sizeof(int) (modified by _)
#       |         | successive characters as an unsigned
#       |         | native integer
#-------+---------+-----------------------------------------
#  i    | Integer | treat sizeof(int) (modified by _)
#       |         | successive characters as a signed
#       |         | native integer
#-------+---------+-----------------------------------------
#  L    | Integer | treat four (modified by _) successive
#       |         | characters as an unsigned native
#       |         | long integer
#-------+---------+-----------------------------------------
#  l    | Integer | treat four (modified by _) successive
#       |         | characters as a signed native
#       |         | long integer
#-------+---------+-----------------------------------------
#  M    | String  | quoted-printable
#-------+---------+-----------------------------------------
#  m    | String  | base64-encoded
#-------+---------+-----------------------------------------
#  N    | Integer | treat four characters as an unsigned
#       |         | long in network byte order
#-------+---------+-----------------------------------------
#  n    | Fixnum  | treat two characters as an unsigned
#       |         | short in network byte order
#-------+---------+-----------------------------------------
#  P    | String  | treat sizeof(char *) characters as a
#       |         | pointer, and  return \emph{len} characters
#       |         | from the referenced location
#-------+---------+-----------------------------------------
#  p    | String  | treat sizeof(char *) characters as a
#       |         | pointer to a  null-terminated string
#-------+---------+-----------------------------------------
#  Q    | Integer | treat 8 characters as an unsigned 
#       |         | quad word (64 bits)
#-------+---------+-----------------------------------------
#  q    | Integer | treat 8 characters as a signed 
#       |         | quad word (64 bits)
#-------+---------+-----------------------------------------
#  S    | Fixnum  | treat two (different if _ used)
#       |         | successive characters as an unsigned
#       |         | short in native byte order
#-------+---------+-----------------------------------------
#  s    | Fixnum  | Treat two (different if _ used) 
#       |         | successive characters as a signed short
#       |         | in native byte order
#-------+---------+-----------------------------------------
#  U    | Integer | UTF-8 characters as unsigned integers
#-------+---------+-----------------------------------------
#  u    | String  | UU-encoded
#-------+---------+-----------------------------------------
#  V    | Fixnum  | treat four characters as an unsigned
#       |         | long in little-endian byte order
#-------+---------+-----------------------------------------
#  v    | Fixnum  | treat two characters as an unsigned
#       |         | short in little-endian byte order
#-------+---------+-----------------------------------------
#  w    | Integer | BER-compressed integer (see Array.pack)
#-------+---------+-----------------------------------------
#  X    | ---     | skip backward one character
#-------+---------+-----------------------------------------
#  x    | ---     | skip forward one character
#-------+---------+-----------------------------------------
#  Z    | String  | with trailing nulls removed
#       |         | upto first null with *
#-------+---------+-----------------------------------------
#  @    | ---     | skip to the offset given by the 
#       |         | length argument
#-------+---------+-----------------------------------------'
#"""
