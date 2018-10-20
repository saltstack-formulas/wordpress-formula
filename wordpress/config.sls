{% from "wordpress/map.jinja" import map with context %}
{% for name, site in pillar['wordpress']['sites'].items() %}

# This command tells wp-cli to create our wp-config.php, DB info needs to be the same as above
configure-{{ name }}:
 cmd.run:
  - name: '/usr/local/bin/wp core config --dbhost={{ site.dbhost }} --dbname={{ site.database }} --dbuser={{ site.dbuser }} --dbpass={{ site.dbpass }}'
  - cwd: {{ map.docroot }}/{{ name }}
  - runas: {{ map.www_user }}
  - unless: test -f {{ map.docroot }}/{{ name }}/wp-config.php

{% endfor %}
