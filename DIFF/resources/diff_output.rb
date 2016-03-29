# ruby_block "check_diff_command_output" do
#     block do
#       #tricky way to load this Chef::Mixin::ShellOut utilities
#       Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
#       cmd = "diff -r -I '^#.*' #{diff['SourceFolder']} #{diff['DestinFolder']}""
#       diff_command_out = shell_out(cmd)
#       if diff_command.stdout == 0
#        puts #{diff['SourceFolder']} "and" #{diff['DestinFolder']} "are alike"
#       elseif diff_command.stdout ==1
#        puts #{diff['SourceFolder']} "and" #{diff['DestinFolder']} "are different"
#       else
#        puts "There was something wrong with the diff command"
#       end
#     end
#     action :run
# end
