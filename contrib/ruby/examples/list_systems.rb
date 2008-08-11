#!/usr/bin/ruby 
#
# list_systems.rb - example of using rubygem-cobbler to list system.
# 
# Copyright (C) 2008 Red Hat, Inc.
# Written by Darryl L. Pierce <dpierce@redhat.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA  02110-1301, USA.  A copy of the GNU General Public License is
# also available at http://www.gnu.org/copyleft/gpl.html.
 
base = File.expand_path(File.join(File.dirname(__FILE__), ".."))
$LOAD_PATH << File.join(base, "lib")
$LOAD_PATH << File.join(base, "examples")

require 'getoptlong'

require 'cobbler'

include Cobbler

opts = GetoptLong.new(
  ["--server", "-s", GetoptLong::REQUIRED_ARGUMENT ],
  ["--help",   "-h", GetoptLong::NO_ARGUMENT]
)

hostname = nil

opts.each do |opt, arg|
  case opt
  when '--server' then hostname = arg
  when '--help'   then 
    puts "Usage: #{$0} --server hostname\n"
  end
end


Base.hostname = hostname if hostname
  
puts "Results:"
System.find { |system| puts "\"#{system.name}\" is based on \"#{system.profile}\"."}