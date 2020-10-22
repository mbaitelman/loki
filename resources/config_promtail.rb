property :config_directory,     String, required: false, default: '/etc/promtail/config/'
property  :owner,               String,                   default: 'promtail'
property  :group,               String,                   default: 'promtail'
property  :cookbook,            String,                   default: 'loki'

action :update do
  user new_resource.owner

  group new_resource.group

  directory new_resource.config_directory do
    owner new_resource.owner
    group new_resource.group
    mode  '0750'
    recursive true
  end

  template "#{new_resource.config_directory}/config-promtail.yml" do
    source 'promtail-local-config.yaml.erb'
    cookbook new_resource.cookbook
  end
end