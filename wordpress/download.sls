{% from "wordpress/map.jinja" import wordpress with context %}

{% if high_state is defined %}
include:
  - wordpress.cli
{% endif %}

{% for id, site in salt['pillar.get']('wordpress:sites', {}).items() %}
{{ wordpress.docroot }}/{{ id }}:
  file.directory:
    - user: {{ wordpress.www_user }}
    - group: {{ wordpress.www_group }}
    - mode: 755
    - makedirs: True

# This command tells wp-cli to download wordpress
download_wordpress_{{ id }}:
 cmd.run:
  - cwd: {{ wordpress.docroot }}/{{ id }}
  - name: '/usr/local/bin/wp core download --path="{{ wordpress.docroot }}/{{ id }}/"'
  - user: {{ wordpress.www_user }}
  - unless: /usr/local/bin/wp core is-installed --path="{{ wordpress.docroot }}/{{ id }}"
{% endfor %}
