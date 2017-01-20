{% from "wordpress/map.jinja" import wordpress with context %}

include:
  - wordpress.cli

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
  - unless: test -f {{ wordpress.docroot }}/{{ id }}/wp-config.php

# This command tells wp-cli to create our wp-config.php, DB info needs to be the same as above
configure_{{ id }}:
 cmd.run:
  - name: '/usr/local/bin/wp core config --dbname="{{ site.get('database') }}" --dbuser="{{ site.get('dbuser') }}" --dbpass="{{ site.get('dbpass') }}" --dbhost="{{ site.get('dbhost') }}" --path="{{ wordpress.docroot }}/{{ id }}"'
  - cwd: {{ wordpress.docroot }}/{{ id }}
  - user: {{ wordpress.www_user }}
  - unless: test -f {{ wordpress.docroot }}/{{ id }}/wp-config.php  

# This command tells wp-cli to install wordpress
install_{{ id }}:
 cmd.run:
  - cwd: {{ wordpress.docroot }}/{{ id }}
  - name: '/usr/local/bin/wp core install --url="{{ site.get('url') }}" --title="{{ site.get('title') }}" --admin_user="{{ site.get('username') }}" --admin_password="{{ site.get('password') }}" --admin_email="{{ site.get('email') }}" --path="{{ wordpress.docroot }}/{{ id }}/"'
  - user: {{ wordpress.www_user }}
  - unless: /usr/local/bin/wp core is-installed --path="{{ wordpress.docroot }}/{{ id }}"
{% endfor %}