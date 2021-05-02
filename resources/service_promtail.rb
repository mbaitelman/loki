property :cookbook, String, default: 'loki'
property :install_directory, String, required: false, default: '/etc/promtail/bin/'

action :create do
  template '/etc/systemd/system/promtail.service' do
    variables(
        promtail_bin: "#{new_resource.install_directory}promtail-#{node['os']}-amd64"
      )
    source 'promtail.service.erb'
    cookbook new_resource.cookbook
  end

  service 'promtail' do
    action [:enable, :start]
  end
end
