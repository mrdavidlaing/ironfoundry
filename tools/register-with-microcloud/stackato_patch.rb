#!/usr/bin/env ruby -w

require 'yaml'
require 'etc'
require 'fileutils'

stackato_home = '/home/stackato'
stackato_etc_vcap = File.join(stackato_home, 'stackato/etc/vcap')
Dir.chdir(stackato_home)

vcap_uid = Etc.getpwnam('stackato').uid
vcap_gid = Etc.getgrnam('stackato').gid

cc_config = File.join(stackato_etc_vcap, 'cloud_controller.yml')
cfg = YAML.load_file(cc_config)
cfg['runtimes']['aspdotnet40'] = { 'version' => '4.0.30319.1' }
cfg['builtin_services']['mssql'] = { 'token' => '0xdeadbeef' }
File.open(cc_config, 'w') do |f|
  YAML.dump(cfg, f)
end

unless system('patch -f -p0 < stackato.app.rb.patch')
  $stderr.puts("patch failed: #{$?}")
end

unless system('tar xvf stackato_aspdotnet.tar')
  $stderr.puts("tar failed: #{$?}")
end

stackato_admin = File.join(stackato_home, 'stackato/tools/stackato-admin')
unless system("/usr/bin/env python #{stackato_admin} restart cloud_controller > /tmp/stackato-admin.out 2>&1 < /dev/null")
  $stderr.puts("stackato-admin failed: #{$?}")
end

exit 0
