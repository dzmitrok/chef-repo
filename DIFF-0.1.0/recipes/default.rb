#
# Cookbook Name:: DIFF
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
diff = node['DIFF']

bash 'compare' do
  code <<-EOH
    #compare 2 folders using linux command diff
    diff -r -I '^#.*' #{diff['SourceFolder']} #{diff['DestinFolder']}
  EOH
end
