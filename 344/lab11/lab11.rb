#!/usr/bin/ruby -w

$filename = "/user/student/souza/344/lab11/mydata"

class Parse
  def self.resource
     lines = open($filename).map { |line| line.split(/\n/)}
     resources = Hash.new
        lines.each {|x| x = x[0].to_s
                    words = x.split(' ')
                    resource = words[6]
                    mydate = words[3]
                    day = mydate[1,2]
                    #mon = mydate[4,3]
                    day = day.to_i
                   # puts "day = #{day} mon = #{mon}"
                    #number = words[8]
                  user = ARGV[2].split('-')
                  if user.length == 2
                          num1 = user[0]
                          num2 = user[1]
                  else
                          input = user[0]
                  end
                  if ARGV[1] == "--day" 
                   if user.length == 2
                     if ("#{num1}".."#{num2}").include?("#{day}")
                        if resources.has_key?(resource)
                            resources[resource] += 1
                        else
                            resources[resource] = 1
                        end
                     end
                   elsif user.length == 1
#                           puts "#{day} #{input}"
                       if input.to_i == day
                               if resources.has_key?(resource)
                                       resources[resource] += 1
                               else
                                       resources[resource] = 1
                               end
                       end
                   end
                  else
                      if resources.has_key?(resource)
                              resources[resource] += 1
                      else
                              resources[resource] = 1
                      end
                  end
        }
#                puts "loop"    
  if ARGV[3] == "--number" 
     info = ARGV[4]
     resources = resources.sort_by{|k,v| v}.reverse.first(info.to_i)
  end

     resources.each do |k,v|
             puts "#{v} #{k}"
     end
  end

  def self.requesters
     lines = open($filename).map { |line| line.split(/\n/)}
     requesters = Hash.new
        lines.each {|x| x = x[0].to_s
                    words = x.split(' ')
                    requester = words[0]
           #         puts requester
                    mydate = words[3]
                    day = mydate[1,2]
                    day = day.to_i
                    user = ARGV[2].split('-')
                    if user.length == 2
                            num1 = user[0]
                            num2 = user[1]
                    else
                            input = user[0]
                    end
                    if ARGV[1] == "--day"
                         if user.length == 2
                            if ("#{num1}".."#{num2}").include?("#{day}")
                                    if requesters.has_key?(requester)
                                            requesters[requester] += 1
                                    else
                                            requesters[requester] = 1
                                    end
                            end
                         elsif user.length == 1
                                 if input.to_i == day
                                         if requesters.has_key?(requester)
                                                 requesters[requester] += 1
                                         else
                                                 requesters[requester] = 1
                                         end
                                 end
                         end
                    else
                            if requesters.has_key?(requester)
                                    requesters[requester] += 1
                            else
                                    requesters[requester] = 1
                            end
                    end
        }
      if ARGV[3] == "--number"
        info = ARGV[4]
        requesters = requesters.sort_by{|k,v| v}.reverse.first(info.to_i)
      end

        requesters.each do |k,v|
                puts "#{v} #{k}"
        end

  end
  def self.errors
     lines = open($filename).map { |line| line.split(/\n/)}
     errors = Hash.new
        lines.each {|x| x = x[0].to_s
                    words = x.split(' ')
                    error = words[6] + " " + words[8] 
                    #puts error
                    mydate = words[3]
                    day = mydate[1,2]
                    day = day.to_i
                    user = ARGV[2].split('-')
                    if user.length == 2
                            num1 = user[0]
                            num2 = user[1]
                    else
                            input = user[0]
                    end
                    if ARGV[1] == "--day"
                       if user.length == 2
                            if ("#{num1}".."#{num2}").include?("#{day}")
                                    if errors.has_key?(error)
                                            errors[error] += 1
                                    else
                                            errors[error] = 1
                                    end
                            end
                       elsif user.length == 1
                               if input.to_i == day
                                       if errors.has_key?(error)
                                               errors[error] += 1
                                       else
                                               errors[error] = 1
                                       end
                               end
                       end
                    else
                            if errors.has_key?(error)
                                    errors[error] += 1
                            else
                                    errors[error] = 1
                            end
                    end
        }
       if ARGV[3] == "--number"
        info = ARGV[4]
       errors = errors.sort_by{|k,v| v}.reverse.first(info.to_i)
       end

       errors.each do |k,v|
                puts "#{v} #{k}"
        end
  end
  def self.hourly    
     lines = open($filename).map { |line| line.split(/\n/)}
     hours = Hash.new
        lines.each {|x| x = x[0].to_s
                    words = x.split(' ')
                    test = words[3]
                    nex = test.split(':')
                    hour = nex[0].tr('[','') + " " + nex[1] + ":" + nex[2]
                    mydate = words[3]
                    day = mydate[1,2]
                    day = day.to_i
                    user = ARGV[2].split('-')
                    if user.length == 2
                            num1 = user[0]
                            num2 = user[1]
                    else
                            input = user[0]
                    end

                    if ARGV[1] == "--day"
                       if user.length == 2
                            if ("#{num1}".."#{num2}").include?("#{day}")
                                    if hours.has_key?(hour)
                                            hours[hour] += 1
                                    else
                                            hours[hour] = 1
                                    end
                            end
                       elsif user.length == 1
                               if input.to_i == day
                                       if hours.has_key?(hour)
                                               hours[hour] += 1
                                       else
                                               hours[hour] = 1
                                       end
                               end
                       end
                    else
                                    if hours.has_key?(hour)
                                            hours[hour] += 1
                                    else
                                            hours[hour] = 1
                                    end
                    end
        }

      if ARGV[3] == "--number"
        info = ARGV[4]
       hours = hours.sort_by{|k,v| v}.reverse.first(info.to_i)
      end

      hours.each do |k,v|
                puts "#{v} #{k}"
        end
  end

  def self.help1
puts "
Usage: lab11 [--type] [--day #|#-#] [options] [/path/to/logfile]

    The --type argument is required. The types of searches are:
      --resources
        Displays a list of the resources requested, sorted from most requested to least.
      --requesters
        Displays a list of the hosts/IP addresses that requested resources and the number of request made, sorted from most to least.
      --errors
        Displays the number of times a resource was requested and the request returned an error sorted from most to least.
      --hourly
        Counts the number of requests received, sorts and then displays them by the hour in which the request was received.

    The --day argument is required and defines the day, or range of days, to be parsed. The format is --day 12 | --day 9-20
    The only option currently available is --number. Options are optional.
        --number #
          This option causes the script to display only the top # results.
          The format is --number 10
      
    Examples:
        lab11.rb --resources --day 12-15 access_log_Jul95
        lab11.rb --hourly --day 7 --number 100 access_log_Jul95

"

  end
end


case ARGV[0]
    when '--help'
            Parse.help1
            abort
    when '--resources'
            Parse.resource
            abort
    when '--requesters'
            Parse.requesters
            abort
    when '--errors'
            Parse.errors
            abort
    when '--hourly'
            Parse.hourly
            abort
end
