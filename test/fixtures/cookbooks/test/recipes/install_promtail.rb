
loki_install_promtail 'Promtail install' do
  version 'v1.6.1'
end

loki_config_promtail 'Promtail config'

loki_service_promtail 'Promtail service'
