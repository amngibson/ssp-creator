require "ssp/creator/version"
require 'json'

module Ssp
  module Creator
    def Creator.start

    file = File.read('../../nist-json.json')
    output = File.new('../../output.html', 'w')
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
                  output.write("\n\n________________FAMILY : #{family}___________________\n")
                end
              when "number"
                @control = v
              when "title"
                title = v
                puts "#{@control} : #{title}"
                output.write("\n\n#{@control} : #{title}\n")
              when "priority"
                priority = v
                puts "Priority : #{priority}"
              when "baseline-impact"
                @impact = v
              when "statement"
                output.write("#{v["description"].first}\n")
                v.each do |v2key, v2val|
                  if v2val.kind_of?(Array)
                    v2val.each do |avals|
                      if avals.kind_of?(Hash)
                        avals.each do |h2key,h2vals|
                          if h2key == "statement"
                            h2vals.each do |sval|
                              if sval.kind_of?(Hash)
                                sval.each do |s2key,s2val|
                                  case s2key
                                    when "number"
                                      @number_l2 = s2val
                                    when "description"
                                      @description_l2 = s2val
                                      puts "#{@number_l2.first} : #{@description_l2.first}"
                                      output.write("#{@number_l2.first} : #{@description_l2.first}\n")
                                    else
                                      puts s2val
                                      output.write("#{@number_l2.first} : #{s2val}\n")
                                  end
                                end
                              else
                                puts sval
                                output.write("#{@number_l2.first} : #{sval}\n")
                              end
                            end
                          else
                            case h2key
                              when "number"
                                @number_l1 = h2vals
                              when "description"
                                @description_l1 = h2vals
                                puts "#{@number_l1.first} : #{@description_l1.first}"
                                output.write("#{@number_l1.first} : #{@description_l1.first}\n")
                              else
                                puts h2vals
                            end
                          end
                        end
                      else
                        puts avals
                      end
                    end
                  end
                end
              when "supplemental-guidance"
                puts "Supplmental Guidance: "
                output.write("\nSupplmental Guidance:\n")
                if v.key?("description")
                  output.write("#{v["description"].first}\n\n")
                end
                if v.key?("related")
                  output.write("Related Controls: \n")
                  v["related"].each do |r|
                    output.write("#{r}\n")
                  end
                  output.write("\n")
                end

              when "control-enhancements"
                puts "Control Enhancements: "
                output.write("Control Enhancements: \n")
                v.each do |value_ch_key,value_ch|
                  value_ch.each do |v_ch|
                    v_ch.each do |v_ch_key, v_ch_value|
                       case v_ch_key
                      when "number"
                        @control_ch = v_ch_value
                      when "title"
                        title_ch = v_ch_value
                        puts "#{@control_ch.first} : #{title_ch.first}"
                           output.write("#{@control_ch.first} : #{title_ch.first}\n")
                      when "baseline-impact"
                        @impact_ch = v_ch_value
                      when "statement"
                        v_ch_value.each do |v2key_ch, v2val_ch|
                          if v2val_ch.kind_of?(Array)
                            v2val_ch.each do |avals_ch|
                              if avals_ch.kind_of?(Hash)
                                avals_ch.each do |h2key_ch,h2vals_ch|
                                  if h2key_ch == "statement"
                                    h2vals_ch.each do |sval_ch|
                                      if sval_ch.kind_of?(Hash)
                                        sval_ch.each do |s2key_ch,s2val_ch|
                                          case s2key_ch
                                            when "number"
                                              @number_l2_ch = s2val_ch
                                            when "description"
                                              @description_l2_ch = s2val_ch
                                              puts "#{@number_l2_ch.first} : #{@description_l2_ch.first}"
                                              output.write("#{@number_l2_ch.first} : #{@description_l2_ch.first}\n")
                                            else
                                              puts s2val_ch
                                          end
                                        end
                                      else
                                        puts sval_ch
                                      end
                                    end
                                  else
                                    case h2key_ch
                                      when "number"
                                        @number_l1_ch = h2vals_ch
                                      when "description"
                                        @description_l1_ch = h2vals_ch
                                        puts "#{@number_l1_ch.first} : #{@description_l1_ch.first}"
                                        output.write("#{@number_l1_ch.first} : #{@description_l1_ch.first}")
                                      else
                                        puts h2vals_ch
                                    end
                                  end
                                end
                              else
                                puts avals_ch
                              end
                            end
                          end
                        end
                      when "supplemental-guidance"
                        puts "Supplmental Guidance: "
                        v.each do |v2key, v2val|
                          if v2val.kind_of?(Array)
                            v2val.each do |avals|
                              if avals.kind_of?(Hash)
                                avals.each do |h2key,h2vals|
                                  if h2key == "description"
                                    h2vals.each do |sval|
                                      if sval.kind_of?(Hash)
                                        sval.each do |s2key,s2val|
                                          case s2key
                                            when "description"
                                              @description_sup = s2val
                                              puts @description_sup
                                              output.write("#{@description_sup}\n")
                                            else
                                              puts s2val
                                          end
                                        end
                                      else
                                        puts sval
                                      end
                                    end
                                  else
                                    case h2key
                                      when "number"
                                        @number_l1 = h2vals
                                      when "description"
                                        @description_l1 = h2vals
                                        puts "#{@number_l1.first} : #{@description_l1.first}"
                                        output.write("#{@number_l1.first} : #{@description_l1.first}\n")
                                      else
                                        puts h2vals
                                    end
                                  end
                                end
                              else
                                puts avals
                              end
                            end
                          end
                        end
                      when "control-enhancements"
                        puts "Control Enhancements: "
                        @enhancement = v
                        puts @enhancement
                           output.write("#{@enhancement}\n")
                      else
                        puts v
                    end
                    end
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
end



