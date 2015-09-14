#!/usr/bin/ruby -w
puts "Choose an option:"
puts "1. Find Mask Needed"
puts "2. Find Subnet IP"
puts "3. Find Broadcast IP"
puts "4. First valid host IP"
puts "5. Find valid host IP range"
puts "6. Determine if valid subnet IP"
puts ""
print "Option: "
option = gets.chomp
case option
when '1'
        print "Subnet IP: "
        subnet = gets.chomp
        print "Max hosts: "
        hosts = gets.chomp.to_i
        ip = subnet.split('.')
        

        whatever = 32 - (Math.log10(hosts+2)/Math.log10(2))
        whatever = whatever.floor.to_i
        #case whatever
        #when '30'
        #puts "Subnet = #{ip[0]}.#{ip[1]}.#{ip[2]}.#{ip[3]}/#{whatever}"
        puts "CIDR = /#{whatever}"
when '2'
       print "Host IP: "
userip = gets.chomp
       print "Subnet Mask: "
usermask = gets.chomp
split = userip.split('.')
mymask = usermask.split('.')

puts "Subnet IP: #{(split[0].to_i & mymask[0].to_i).to_s(2).to_i(2)}.#{(split[1].to_i & mymask[1].to_i).to_s(2).to_i(2)}.#{(split[2].to_i & mymask[2].to_i).to_s(2).to_i(2)}.#{(split[3].to_i & mymask[3].to_i).to_s(2).to_i(2)}"

when '3'
        print "Subnet IP: "
        subnet = gets.chomp
        print "Subnet Mask: "
        mask = gets.chomp
        ip = subnet.split('.')
        mymask = mask.split('.')
print "Broadcast IP: #{((mymask[0].to_i^255).to_s(2).to_i(2) | ip[0].to_i).to_s(2).to_i(2)}"
print ".#{((mymask[1].to_i^255).to_s(2).to_i(2) | ip[1].to_i).to_s(2).to_i(2)}"
print ".#{((mymask[2].to_i^255).to_s(2).to_i(2) | ip[2].to_i).to_s(2).to_i(2)}"
puts ".#{((mymask[3].to_i^255).to_s(2).to_i(2) | ip[3].to_i).to_s(2).to_i(2)}"


when '4'
        print "Subnet IP: "
        subnet = gets.chomp
        print "Subnet Mask: "
        mask = gets.chomp
        ip = subnet.split('.')
        mymask = mask.split('.')

#broadcast = "#{((mymask[0].to_i^255).to_s(2).to_i(2) | ip[0].to_i).to_s(2).to_i(2)}.#{((mymask[1].to_i^255).to_s(2).to_i(2) | ip[1].to_i).to_s(2).to_i(2)}.#{((mymask[2].to_i^255).to_s(2).to_i(2) | ip[2].to_i).to_s(2).to_i(2)}.#{((mymask[3].to_i^255).to_s(2).to_i(2) | ip[2].to_i).to_s(2).to_i(2)}"

subnetip = "#{(ip[0].to_i & mymask[0].to_i).to_s(2).to_i(2)}.#{(ip[1].to_i & mymask[1].to_i).to_s(2).to_i(2)}.#{(ip[2].to_i & mymask[2].to_i).to_s(2).to_i(2)}.#{(ip[3].to_i & mymask[3].to_i).to_s(2).to_i(2)}"
#broad = broadcast.split('.')
sub = subnetip.split('.')

puts "First valid host IP is: #{sub[0]}.#{sub[1]}.#{sub[2]}.#{sub[3].to_i+1}"
        
when '5'
        print "Host IP: "
        subnet = gets.chomp
        print "Subnet Mask: "
        mask = gets.chomp
        ip = subnet.split('.')
        mymask = mask.split('.')

broadcast = "#{((mymask[0].to_i^255).to_s(2).to_i(2) | ip[0].to_i).to_s(2).to_i(2)}.#{((mymask[1].to_i^255).to_s(2).to_i(2) | ip[1].to_i).to_s(2).to_i(2)}.#{((mymask[2].to_i^255).to_s(2).to_i(2) | ip[2].to_i).to_s(2).to_i(2)}.#{((mymask[3].to_i^255).to_s(2).to_i(2) | ip[3].to_i).to_s(2).to_i(2)}"

subnetip = "#{(ip[0].to_i & mymask[0].to_i).to_s(2).to_i(2)}.#{(ip[1].to_i & mymask[1].to_i).to_s(2).to_i(2)}.#{(ip[2].to_i & mymask[2].to_i).to_s(2).to_i(2)}.#{(ip[3].to_i & mymask[3].to_i).to_s(2).to_i(2)}"

broad = broadcast.split('.')
sub = subnetip.split('.')
puts broadcast
puts "Valid host IP range: #{sub[0]}.#{sub[1]}.#{sub[2]}.#{sub[3].to_i+1} - #{broad[0]}.#{broad[1]}.#{broad[2]}.#{broad[3].to_i-1}"

when '6'
        print "Subnet IP: "
        subnet = gets.chomp
        print "Subnet Mask: "
        mask = gets.chomp
        ip = subnet.split('.')
        mymask = mask.split('.')


subnetip = "#{(ip[0].to_i & mymask[0].to_i).to_s(2).to_i(2)}.#{(ip[1].to_i & mymask[1].to_i).to_s(2).to_i(2)}.#{(ip[2].to_i & mymask[2].to_i).to_s(2).to_i(2)}.#{(ip[3].to_i & mymask[3].to_i).to_s(2).to_i(2)}"

if subnetip != subnet
        puts "Not a valid subnet IP"
else
        puts "Valid subnet IP"
end

end
