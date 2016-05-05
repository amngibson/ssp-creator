require "ssp/creator/version"
require 'json'

module Ssp
  module Creator
    file = File.read('../../nist-json.json')
    data_hash = JSON.parse(file)
    controls = data_hash['controls']['control']
    controls.each do |c|
      c.each do |key, value|
        value.each do |v|
            case key
              when "family"
                if v != @family
                  family = v
                  @family = family
                  puts "________________FAMILY : #{family}___________________"
                end
              when "number"
                @control = v
              when "title"
                title = v
                puts "#{@control} : #{title}"
              when "priority"
                priority = v
                puts "Priority : #{priority}"
              when "baseline-impact"
                @impact = v
              when "statement"
                v.each do |v, v2|
                  if v2.kind_of?(Array)
                    v2.each do |avals|
                      if avals.kind_of?(Hash)
                        avals.each do |h2key,h2vals|
                          if h2key == "statement"
                            h2vals.each do |sval|
                              if sval.kind_of?(Hash)
                                sval.each do |s2key,s2val|
                                  puts s2val
                                end
                              else
                                puts sval
                              end
                            end
                          else
                            puts h2vals
                          end
                        end
                      else
                        puts avals
                      end
                    end
                  elsif v2.kind_of?(Hash)
                    v2.each do |h2key,h2vals|
                      puts h2vals
                    end
                  else
                    puts v2
                  end
                end
              else
                puts v
            end
          end
        end
      end
    end
  end

