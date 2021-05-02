[back to resource list](https://github.com/mbaitelman/loki#resources)

---

# loki_install

Installs Loki from [Github](https://github.com/grafana/loki/releases).

## Actions

- `:install`

## Properties

| Name                  | Type        |  Default      | Description                                               | Allowed Values
| --------------------- | ----------- | ------------- | --------------------------------------------------------- | --------------- |
| `version`             |  String     | `nil`                                                     | Use if you want to install a specific version (Must exist in repo)|
| `install_directory`   |  String     | `/etc/loki/bin/` | |
| `user`                |  String     | `loki`           | |
| `group`               |  String     | `loki`           | |

## Notes

After install please create a `service` resource for `loki` so it can restart on config changes

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