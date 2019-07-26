#coding:gbk

require 'RbConfig'
require 'Pathname'

#$LOAD_PATH<<$HOMEPATH+"/public"
#$LOAD_PATH<<$HOMEPATH+"/testframe"
#$LOAD_PATH<<$HOMEPATH+"/testcase"

module Testhelper
  #include Testlog
  
  class LoadHelper < Object
    
    $HOMEPATH = Dir.pwd
    $LOAD_PATH<<$HOMEPATH 
    
    #rbfiles = File.join("**", "*")
    def self.getDirs
      Dir.entries($HOMEPATH).\
      select { |dir|   not ['.','..'].include?(dir) and Pathname.new(dir).directory? } 
    
    end
    
    def self.loadpath()
      
      self.getDirs.each{        
        |x|      $LOAD_PATH<<$HOMEPATH+"/"+x 
      }
    end
    
  end


  public
  def loginfo
    puts "log testhelper"
  end 
  
  public
  def hex2str(hvalue)
      ret=""
      hvalue.each_byte {    |x|   ret<<sprintf("%02x",x) }
      ret
  end
  
  public 
  def str2hex(str)
    nil
  end

  public
  def loghex2str(hvalue)
    ret="codes len is: #{hvalue.length}.\n"
    i=1
    aa=""
    hvalue.each_byte {    |x| 
      ret<<sprintf("%06d\t",i/16+1) if i%16 ==1    
      ret<<sprintf("%02x ",x)  
       if x>32 and x<126 
            aa<<x   
       else aa<<"." end
       
       if i%16==0  
        ret<<"\t"<<aa <<"\n" 
        aa=""
      end
      i+=1
    }
    i-=1
      if i%16!=0  
        ret<<"   "*(16-i%16)
        ret<<"\t"<<aa <<"\n" 
        aa=""
      end
    ret<<"codes len is: #{hvalue.length}."
 
    ret
  end
  
  def isup?(param)
    return param.upcase==param
  end
  
  
  def os  
        @os ||= (  
          host_os = RbConfig::CONFIG['host_os']  
           case host_os  
           when /mswin|msys|mingw|cygwin|bccwin|wince|emc/  
             :windows  
           when /darwin|mac os/  
            :macosx  
         when /linux/  
         :linux  
           when /solaris|bsd/  
             :unix  
          else  
            raise Error::WebDriverError, "unknown os: #{host_os.inspect}"  
        end        )  
  end  
#m=getss
#eval("def #{m};puts 'Hello'; end")
#eval(m)
    
def someMethod
yield
end 
#someMethod {puts "hello world"}
class ATestM
include Testhelper
def self.a
  puts 'a'
end
def ATestM.aa
  puts 'aa'
end

end 



class <<ATestM
  def clsm
    puts "clsm"
  end
end



obj=ATestM.new

class   <<obj
  def objm
    puts "objm"
  end
end
def obj.newobjm
  puts  "new"
end
#obj.objm
#obj.newobjm

 ppp='dddd'
 def ppp.title?
   self.upcase==self
 end
 #puts ppp.title?
 #index(ppp)
 
 #单件方法的三种定义方法
 #在一个对象上定义一个方法
  ppp='dddd'
 def ppp.title?
   self.upcase==self
 end
 
 class   <<ppp
  def objsingle_m
    puts "objsingle_m"
  end
end

#对象的扩展
module M
  def single_m
    puts "single_m"
  end
end
 
 class   <<ppp
   include M
   
 end
 
 def tstAA
   ppp.single_m
 ppp.objsingle_m 
 puts ppp.title?
 end
 
 
 class Atw
   def tw
     puts 1788
   end
 end
 
  def tstAABB
    a=Atw.new
    m=a.method :tw
    m.call
    ATestM.clsm
ATestM.a
ATestM.aa
  end
  
  def setup(&block)
    @setups=block
    @setups
  end


end
'''
部分shell脚本
    ruby -I $script_path $script_path/s3sync.rb --progress -p -r -v --cache-control="max-age=86400" $lesson_dir $bucket_name:
    ruby -I $script_path $script_path/s3sync.rb --progress -p -r -v --cache-control="max-age=86400" $lesson_dir $bucket_name:
    
    可以这样理解，就是同步本地和远程的目录
    # s3sync.rb --progress -p -r -v --cache-control="max-age=86400" /home/praxis/upload_temp_new/v3_id chinesepod.com:
    就是同步 /home/praxis/upload_temp_new/v3_id 目录下的文件到 s3.amazonaws.com/chinesepod 下
    
    ams项目里在 /home/praxis/upload_temp_new/v3_id 下创建了 hashcode 目录
    http://s3.amazonaws.com/spanishpod.com/0427/4811229928d47c9086bdb7331d3bd59b611878fb/mp3/glossary/source/rec-1245432540281-4.mp3

    s3try.rb - $AWS_S3_HOST = (ENV["AWS_S3_HOST"] or "s3.amazonaws.com")


s3sync.rb (2009-7-28)
    从命令行接收文件目录参数
    sourcePrefix, destinationPrefix = ARGV


文件传输 amazon s3 （2009-7-14）
    http://s3sync.net/wiki


从命令行中传入参数 (2009-7-13)
    在命令行方法执行ruby文件时，需要从命令行中传入参数，可以使用全局变量：ARGV
    def hello(a)
        puts a
    end

    hello(ARGV)


检测文件是否存在及其大小 
    FileTest的 exist?方法可以检测一个文件是否存在
        flag = FileTest::exist?("LochNessMonster")
        flag = FileTest::exists?("UFO")
        # exists? is a synonym for exist?

    大小
        if File.new("myfile").stat.size?
          puts "The file has contents."
        else
          puts "The file is empty."
        end

        size1 = File.size("file1")
        size2 = File.stat("file2").size


区分目录和普通文件
    file1 = File.new("/tmp")
    file2 = File.new("/tmp/myfile")
    test1 = file1.directory?          # true
    test2 = file1.file?               # false
    test3 = file2.directory?          # false
    test4 = file2.file?               # true


操作路径名 
    str = "/home/dave/podbay.rb"
    dir = File.dirname(str)           # "/home/dave"
    file1 = File.basename(str)        # "podbay.rb"
    file2 = File.basename(str,".rb") # "podbay"
   
    // File.split方法，可以将一个文件的路径名和文件名分隔开
    info = File.split(str)        # ["/home/dave","podbay.rb"]

    // expand_path 类方法expand_path 将一个相对路径，转换为一个绝对路径名
    Dir.chdir("/home/poole/personal/docs")
    abs = File.expand_path("../../misc")    # "/home/poole/misc"

    // path 对于打开的文件，path 将会返回这个文件的路径名
    file = File.new("../../foobar")
    name = file.path                 # "../../foobar"

    // join 类方法类方法join正好和split相反
    path = File.join("usr","local","bin","someprog")

    // pathname
    require pathname
    path = Pathname.new("home/hal")
    file = Pathname.new("file.txt")
    p2 = path + file
    path.directory?         # true
    path.file?              # false
    p2.directory?           # false
    p2.file?                # true

    puts parts = p2.split     # [Pathname:/home/hal, Pathname:file.txt]
    puts ext = p2.extname     # .txt

    // relative和absolute判断路径是否是相对的
    p1 = Pathname.new("/home/dave")
    p1.absolute?                      # true
    p1.relative?                      # false


文件操作 
    File.delete("history")
    File.unlink("toast")
    File.rename("Ceylon","SriLanka")
    File.link("/etc/hosts","/etc/hostfile")   # hard link
    File.symlink("/etc/hosts","/tmp/hosts")   # symbolic link
    File.truncate("myfile",1000)    # Now at most 1000 bytes

    require "fileutils"
    same = FileUtils.compare_file("alpha","beta") # true
    # Copy epsilon to theta and log any errors.
    FileUtils.copy("epsilon","theta", true)
    FileUtils.move("/tmp/names","/etc")     # Move to new directory
    FileUtils.move("colours","colors")      # Just a rename
    FileUtils.safe_unlink("alpha","beta","gamma")
    # Log errors on the next two files
    FileUtils.safe_unlink("delta","epsilon",true)
    FileUtils.install("foo.so","/usr/lib")


从键盘抓取输入 
    unix平台
        def getchar
          system("stty raw -echo") # Raw mode, no echo
          char = STDIN.getc
          system("stty -raw echo") # Reset terminal mode
          char
        end

    windows平台
        require Win32API

        def getchar
          char = Win32API.new("crtdll", "_getch", [], L ).Call
        end


读取整个文件到内存 
    读取整个文件到数组，你不需要打开文件，IO.readlines 可以完成这个工作，他自己会open和close. 

    arr = IO.readlines("myfile")
    lines = arr.size
    puts "myfile has #{lines} lines in it."

    longest = arr.collect {|x| x.length}.max
    puts "The longest line in it has #{longest} characters."


    也可以用IO.read(它返回一个大的字符串): 

    str = IO.read("myfile")
    bytes = arr.size
    puts "myfile has #{bytes} bytes in it."

    longest = str.collect {|x| x.length}.max     # strings are enumerable!
    puts "The longest line in it has #{longest} characters."


    由于File继承了IO,因此File也有这两个方法. 


逐行迭代一个文件 
    可以使用IO.foreach 方法，或者each方法，如果是前者文件不需要显示打开
    # Print all lines containing the word "target"
    IO.foreach("somefile") do |line|
      puts line if line =~ /target/
    end

    # Another way...
    file = File.new("somefile")
    file.each do |line|
      puts line if line =~ /target/
    end


◆ dir 目录

查找文件 （2009-7-13）
    Dir[ project/*/app/*/*.rb ].each { |file| puts file }


    获取当前脚本工作目录
        Dir::pwd属性或者Dir.getwd()

    改变当前脚本工作目录
        Dir::chdir

    创建目录
        Dir::mkdir
        不指定目录全名称时，缺省为工作目录

    删除目录
        Dir::rmdir
        不指定目录全名称时，缺省为工作目录

    遍历目录
        Dir::foreach(arg1){|item1| segment.. }
        如果参数arg1中指定了目录全名称，如"d:/ruby/rubywork/"，则遍历该指定目录。
        如参数args1中不是目录全名称，如"rubywork"，则遍历"当前工作目录/rubywrok/"。

    获取当前脚本目录的方法
        全局变量$0是当前脚本的全路径，所以，可以依靠 File.dirname($0) 来获取当前脚本的目录。


◆ 部署网络应用服务
    http://capify.org/ 
    官方网站有详细说明


    安装
        gem install capistrano 


    查看是否安装
        gem list | grep cap


    加入capistrano支持
        cap --apply-to /path/to/my/app MyApplicationName


    修改配置文件
        修改config/deploy.rb文件

        application:应用名。
        repository:版本管理系统的链接URL。
        web:web服务器名列表。
        app:应用服务器列表。
        db:数据库服务器列表。
        user:ssh用户名。
        deploy_to:应用部署路径


    初始化服务器上的运行环境
        rake remote:exec ACTION=setup
        这一步会连上你的服务器，创建一些目录。


    部署
        rake deploy
        连接服务器，完成部署


    命令
        除了setup和deploy，缺省支持的命令主要有：

            * disable_web:生成maintenance.html，你的系统需要能够自检测这个文件。
            * enable_web:删除maintenance.html。
            * update_code:和版本管理器做代码同步。
            * rollback_code:如果部署完发现有问题，可以用这个命令换回上一个。
            * restart:重启，其实就是调用了reaper。
            * migrate:在服务器端运行rake RAILS_ENV=#{rails_env} migrate。
            * deploy:其实就是update_code+symlink+restart。
            * deploy_with_migrations:update_code+migrate+symlink+restart。
            * rollback: rollback_code + restart。


    命令发布
        cap staging_stable deploy
        cap production deploy


    ssh 配置信息
        cd /etc/ssh/sshd_config
            PubkeyAuthentication yes
            #AuthorizedKeysFile>----%h/.ssh/authorized_keys
       cd ~/.ssh/authorized_keys'''