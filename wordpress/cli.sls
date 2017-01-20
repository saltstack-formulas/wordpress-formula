{% from "wordpress/map.jinja" import wordpress with context %}

# This downloads and installs WP-Cli
/usr/local/bin/wp:
  file.managed:
    - source: {{ salt['pillar.get']('wordpress:cli:source') }}
    - source_hash: {{ salt['pillar.get']('wordpress:cli:hash') }}
    - user: {{ wordpress.www_user }}
    - group: {{ wordpress.www_group }}
    - mode: 740
