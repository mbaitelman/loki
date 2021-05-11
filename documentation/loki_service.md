[back to resource list](https://github.com/mbaitelman/loki#resources)

---

# loki_service

Creates a systemd service for Loki

## Actions

- `:create`

## Properties

| Name                  | Type        |  Default         | Description                                                            | Allowed Values
| --------------------- | ----------- | ---------------- | ---------------------------------------------------------------------- | --------------- |
| `cookbook`            |  String     | `loki`           | Allows for overriding the default `loki.service.erb` cookbook location |
| `install_directory`   |  String     | `/etc/loki/bin/` |                                                                        |

## Examples

Installs latest Loki from [Github](https://github.com/grafana/loki/releases):

```ruby
loki_install 'loki'

loki_service 'loki'

service 'loki' do
  action [:enable, :start]
  subscribes :restart, ['template[//etc/loki/config/config-loki.yml]'], :delayed
end

```