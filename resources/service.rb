property  :cookbook,            String,                   default: 'loki'
property :install_directory,     String, required: false, default: '/etc/loki/bin/'



action :create do 

    template "/etc/systemd/system/loki.service" do
        variables(
            loki_bin: "#{new_resource.install_directory}loki-#{node['os']}-amd64"
        )
        source 'loki.service.erb'
        cookbook new_resource.cookbook
    end

    service 'loki' do
        action [:enable, :start]
    end

end