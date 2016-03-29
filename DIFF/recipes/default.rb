# Cookbook Name:: DIFF
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
diff = node['DIFF']
#  bash 'compare' do
#    code <<-EOH
#      #compare 2 folders using linux command diff
#      diff -r -I '^#.*' #{diff['SourceFolder']} #{diff['DestinFolder']}
#    EOH
# end
ruby_block "check_diff_command_output" do
    block do
      #tricky way to load this Chef::Mixin::ShellOut utilities
      Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
      cmd = "diff -r -I '^#.*' #{diff['SourceFolder']} #{diff['DestinFolder']}"
      #cmd = "diff -r -I '^#.*' '/r02/helloworld' '/r02/helloworld_Modified'"
      diff_command_out = shell_out(cmd)
      if diff_command_out.stdout == 0
       #puts "#{diff['SourceFolder']} + "and" + #{diff['DestinFolder']} "are alike""
          log 'same' do
            message '#{diff['SourceFolder']} and  #{diff['DestinFolder']} are alike'
            level: info
          end
       end
      elseif diff_command_out.stdout ==1
       #puts "#{diff['SourceFolder']} + "and" + #{diff['DestinFolder']} "are different""
          log 'different' do
            message '#{diff['SourceFolder']} and {diff['DestinFolder']} are different'
            level: info
          end
       end
      else
       #puts "There was something wrong with the diff command"
          log 'troubles' do
            message 'There was something wrong with the diff command'
            level: info
          end
      end
    end
    action :run
end
