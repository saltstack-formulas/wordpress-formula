{% from "wordpress/map.jinja" import wordpress with context %}

{% for id, site in salt['pillar.get']('wordpress:sites', {}).items() %}
# This command tells wp-cli to install wordpress
install_{{ id }}:
 cmd.run:
  - cwd: {{ wordpress.docroot }}/{{ id }}
  - name: '/usr/local/bin/wp core install --url="{{ site.get('url') }}" --title="{{ site.get('title') }}" --admin_user="{{ site.get('username') }}" --admin_password="{{ site.get('password') }}" --admin_email="{{ site.get('email') }}" --path="{{ wordpress.docroot }}/{{ id }}/"'
  - user: {{ wordpress.www_user }}
  - unless: /usr/local/bin/wp core is-installed --path="{{ wordpress.docroot }}/{{ id }}"
{% endfor %}