# module Demo
#   module Helper
#     include Chef::Mixin::ShellOut
#     def are_different?
#       cmd = shell_out!("diff -r -I '^#.*' #{diff['SourceFolder']} #{diff['DestinFolder']}", {:returns => [0,2]})
#       cmd.stderr.empty? && (cmd.stdout =~ /^bacon/)
#     end
#   end
# end
