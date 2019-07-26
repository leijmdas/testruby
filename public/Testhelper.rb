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
 
 #�������������ֶ��巽��
 #��һ�������϶���һ������
  ppp='dddd'
 def ppp.title?
   self.upcase==self
 end
 
 class   <<ppp
  def objsingle_m
    puts "objsingle_m"
  end
end

#�������չ
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
����shell�ű�
    ruby -I $script_path $script_path/s3sync.rb --progress -p -r -v --cache-control="max-age=86400" $lesson_dir $bucket_name:
    ruby -I $script_path $script_path/s3sync.rb --progress -p -r -v --cache-control="max-age=86400" $lesson_dir $bucket_name:
    
    ����������⣬����ͬ�����غ�Զ�̵�Ŀ¼
    # s3sync.rb --progress -p -r -v --cache-control="max-age=86400" /home/praxis/upload_temp_new/v3_id chinesepod.com:
    ����ͬ�� /home/praxis/upload_temp_new/v3_id Ŀ¼�µ��ļ��� s3.amazonaws.com/chinesepod ��
    
    ams��Ŀ���� /home/praxis/upload_temp_new/v3_id �´����� hashcode Ŀ¼
    http://s3.amazonaws.com/spanishpod.com/0427/4811229928d47c9086bdb7331d3bd59b611878fb/mp3/glossary/source/rec-1245432540281-4.mp3

    s3try.rb - $AWS_S3_HOST = (ENV["AWS_S3_HOST"] or "s3.amazonaws.com")


s3sync.rb (2009-7-28)
    �������н����ļ�Ŀ¼����
    sourcePrefix, destinationPrefix = ARGV


�ļ����� amazon s3 ��2009-7-14��
    http://s3sync.net/wiki


���������д������ (2009-7-13)
    �������з���ִ��ruby�ļ�ʱ����Ҫ���������д������������ʹ��ȫ�ֱ�����ARGV
    def hello(a)
        puts a
    end

    hello(ARGV)


����ļ��Ƿ���ڼ����С 
    FileTest�� exist?�������Լ��һ���ļ��Ƿ����
        flag = FileTest::exist?("LochNessMonster")
        flag = FileTest::exists?("UFO")
        # exists? is a synonym for exist?

    ��С
        if File.new("myfile").stat.size?
          puts "The file has contents."
        else
          puts "The file is empty."
        end

        size1 = File.size("file1")
        size2 = File.stat("file2").size


����Ŀ¼����ͨ�ļ�
    file1 = File.new("/tmp")
    file2 = File.new("/tmp/myfile")
    test1 = file1.directory?          # true
    test2 = file1.file?               # false
    test3 = file2.directory?          # false
    test4 = file2.file?               # true


����·���� 
    str = "/home/dave/podbay.rb"
    dir = File.dirname(str)           # "/home/dave"
    file1 = File.basename(str)        # "podbay.rb"
    file2 = File.basename(str,".rb") # "podbay"
   
    // File.split���������Խ�һ���ļ���·�������ļ����ָ���
    info = File.split(str)        # ["/home/dave","podbay.rb"]

    // expand_path �෽��expand_path ��һ�����·����ת��Ϊһ������·����
    Dir.chdir("/home/poole/personal/docs")
    abs = File.expand_path("../../misc")    # "/home/poole/misc"

    // path ���ڴ򿪵��ļ���path ���᷵������ļ���·����
    file = File.new("../../foobar")
    name = file.path                 # "../../foobar"

    // join �෽���෽��join���ú�split�෴
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

    // relative��absolute�ж�·���Ƿ�����Ե�
    p1 = Pathname.new("/home/dave")
    p1.absolute?                      # true
    p1.relative?                      # false


�ļ����� 
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


�Ӽ���ץȡ���� 
    unixƽ̨
        def getchar
          system("stty raw -echo") # Raw mode, no echo
          char = STDIN.getc
          system("stty -raw echo") # Reset terminal mode
          char
        end

    windowsƽ̨
        require Win32API

        def getchar
          char = Win32API.new("crtdll", "_getch", [], L ).Call
        end


��ȡ�����ļ����ڴ� 
    ��ȡ�����ļ������飬�㲻��Ҫ���ļ���IO.readlines �������������������Լ���open��close. 

    arr = IO.readlines("myfile")
    lines = arr.size
    puts "myfile has #{lines} lines in it."

    longest = arr.collect {|x| x.length}.max
    puts "The longest line in it has #{longest} characters."


    Ҳ������IO.read(������һ������ַ���): 

    str = IO.read("myfile")
    bytes = arr.size
    puts "myfile has #{bytes} bytes in it."

    longest = str.collect {|x| x.length}.max     # strings are enumerable!
    puts "The longest line in it has #{longest} characters."


    ����File�̳���IO,���FileҲ������������. 


���е���һ���ļ� 
    ����ʹ��IO.foreach ����������each�����������ǰ���ļ�����Ҫ��ʾ��
    # Print all lines containing the word "target"
    IO.foreach("somefile") do |line|
      puts line if line =~ /target/
    end

    # Another way...
    file = File.new("somefile")
    file.each do |line|
      puts line if line =~ /target/
    end


�� dir Ŀ¼

�����ļ� ��2009-7-13��
    Dir[ project/*/app/*/*.rb ].each { |file| puts file }


    ��ȡ��ǰ�ű�����Ŀ¼
        Dir::pwd���Ի���Dir.getwd()

    �ı䵱ǰ�ű�����Ŀ¼
        Dir::chdir

    ����Ŀ¼
        Dir::mkdir
        ��ָ��Ŀ¼ȫ����ʱ��ȱʡΪ����Ŀ¼

    ɾ��Ŀ¼
        Dir::rmdir
        ��ָ��Ŀ¼ȫ����ʱ��ȱʡΪ����Ŀ¼

    ����Ŀ¼
        Dir::foreach(arg1){|item1| segment.. }
        �������arg1��ָ����Ŀ¼ȫ���ƣ���"d:/ruby/rubywork/"���������ָ��Ŀ¼��
        �����args1�в���Ŀ¼ȫ���ƣ���"rubywork"�������"��ǰ����Ŀ¼/rubywrok/"��

    ��ȡ��ǰ�ű�Ŀ¼�ķ���
        ȫ�ֱ���$0�ǵ�ǰ�ű���ȫ·�������ԣ��������� File.dirname($0) ����ȡ��ǰ�ű���Ŀ¼��


�� ��������Ӧ�÷���
    http://capify.org/ 
    �ٷ���վ����ϸ˵��


    ��װ
        gem install capistrano 


    �鿴�Ƿ�װ
        gem list | grep cap


    ����capistrano֧��
        cap --apply-to /path/to/my/app MyApplicationName


    �޸������ļ�
        �޸�config/deploy.rb�ļ�

        application:Ӧ������
        repository:�汾����ϵͳ������URL��
        web:web���������б�
        app:Ӧ�÷������б�
        db:���ݿ�������б�
        user:ssh�û�����
        deploy_to:Ӧ�ò���·��


    ��ʼ���������ϵ����л���
        rake remote:exec ACTION=setup
        ��һ����������ķ�����������һЩĿ¼��


    ����
        rake deploy
        ���ӷ���������ɲ���


    ����
        ����setup��deploy��ȱʡ֧�ֵ�������Ҫ�У�

            * disable_web:����maintenance.html�����ϵͳ��Ҫ�ܹ��Լ������ļ���
            * enable_web:ɾ��maintenance.html��
            * update_code:�Ͱ汾������������ͬ����
            * rollback_code:��������귢�������⣬����������������һ����
            * restart:��������ʵ���ǵ�����reaper��
            * migrate:�ڷ�����������rake RAILS_ENV=#{rails_env} migrate��
            * deploy:��ʵ����update_code+symlink+restart��
            * deploy_with_migrations:update_code+migrate+symlink+restart��
            * rollback: rollback_code + restart��


    �����
        cap staging_stable deploy
        cap production deploy


    ssh ������Ϣ
        cd /etc/ssh/sshd_config
            PubkeyAuthentication yes
            #AuthorizedKeysFile>----%h/.ssh/authorized_keys
       cd ~/.ssh/authorized_keys'''