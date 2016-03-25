ruby_block "check_diff_command_output" do
    block do
      #tricky way to load this Chef::Mixin::ShellOut utilities
      Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
      cmd = "diff -r -I '^#.*' /r02/helloworld /r02/helloworld_Modified"
      diff_command_out = shell_out(cmd)
      if diff_command.stdout == 0
       puts "/r02/helloworld and /r02/helloworld_Modified are alike"
      elseif diff_command.stdout ==1
       puts "/r02/helloworld differs from /r02/helloworld_Modified"
      else
       puts "There was something wrong with the diff command"
      end
    end
    action :create
end
