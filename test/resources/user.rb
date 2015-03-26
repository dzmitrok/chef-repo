#
# Cookbook Name:: test
# Resource:: jboss_users
#
# Copyright 2014 Andrew DuFour
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This provider will add or remove users from the JBoss 7 management or application realm

actions :create, :delete
default_action :create

attribute :user_name, :name_attribute => true, :kind_of => String, :required => true
attribute :password,	:kind_of => String

attr_accessor :exists
