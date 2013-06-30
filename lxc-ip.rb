#!/usr/bin/env ruby

def get_ip(name)
    ip = ""
    file = "/tmp/test"
    datafile = read_file(file)	        
    datafile.each do |lines|
	arraylines = lines.split(" ")
        if arraylines[3] == name
	    ip = arraylines[2]	    
	end
    end
    return ip
end

def read_file(file)
    descfile = File.open(file, "r")
    data = descfile.read
    descfile.close
    return data
end

def ssh_access(ip, userssh)

    ssh_cmd = "ssh #{userssh}@#{ip}"
    system(ssh_cmd)
end

if ARGV[0] == "--help"
    puts
    puts "Ruby script to get lxc container ip and connect with ssh\n"
    puts "Usage: lxc-ip [options]"
    puts
    puts " --help  	 To get this help"
    puts "-n $NAME 	 To get ip of $NAME lxc container"
    puts "-s $USER	 Enter to container using ssh, is necessary the option -n before"
    puts
    puts "Examples: "
    puts "ruby lxc-ip.rb -n container-name -s" 
    puts "ruby lxc-ip.rb -n container-name -s root"
    puts

elsif ARGV[0] == "-n"
    
    if  ARGV[1].nil?
	puts "Container name is necessary"
	exit!
    end
    ip = get_ip ARGV[1]
    puts ip
    if ARGV[2] == "-s"
       if ARGV[3].nil?
         userssh = "ubuntu"
       else
         userssh = ARGV[3]
       end
    ssh_access ip, userssh
    end

end


