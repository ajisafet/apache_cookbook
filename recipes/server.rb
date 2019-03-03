package 'httpd' do
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'httpd'
  when 'debian', 'ubuntu'
    package_name 'apache2'
  end

  action :install
end

file '/var/www/html/index.html' do
  content '<h1>Welcome to home page</h1>'
  owner 'vagrant'
  group 'vagrant'
  mode '0744'
  action :create
end

service 'httpd.service' do
  action [:enable, :start]
end
