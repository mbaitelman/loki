




property :version,          String, required: false # v.1.6.1
property :install_directory,     String, required: false, default: '/etc/loki/bin/'
property  :owner,               String,                   default: 'loki'
property  :group,               String,                   default: 'loki'


action :install do 

    user new_resource.owner

    group new_resource.group

    directory new_resource.install_directory do 
        owner new_resource.owner
        group new_resource.group
        mode  '0750'
        recursive true
    end

    source_version = new_resource.version || 'latest' 

    source_file = "loki-#{node['os']}-amd64" # #{node['kernel']['machine']}
    source_url = "https://github.com/grafana/loki/releases/download/#{source_version}/#{source_file}.zip"
    local_file = "loki.zip"

    package 'unzip'

    remote_file "#{new_resource.install_directory}#{source_file}.zip" do 
        source source_url
        notifies :run, 'execute[Unzip]', :immediately
    end

    execute 'Unzip' do 
        command "unzip -o #{new_resource.install_directory}#{source_file} -d #{new_resource.install_directory}"
        action :nothing
    end

end