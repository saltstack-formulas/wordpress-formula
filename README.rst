=================
wordpress-formula
=================

A saltstack formula to install and configure WordPress on Debian, Ubuntu, and RHEL.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``wordpress``
-------------

Install and configure WordPress sites

``wordpress.cli``
-------------

Installs wp-cli

``wordpress.config``
-------------

Configure WordPress sites

``wordpress.plugin``
-------------

Installs Wordpress plugins


Pillar customizations:
======================

.. code-block:: yaml

    wordpress:
      cli:
        source: https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        hash: 2906a669a28d2a344da88c63c96aff3c
      sites:
        sitename:
          username: <your-wordpress-username>
          password: <your-wordpress-user-password>
          database: <your-wordpress-database-name>
          dbuser: <your-wordpress-db-username>
          dbpass: <your-wordpress-db-password>
          url: http://example.ie
          title: 'My Blog'
          email: 'john.doe@acme.com'
          plugins:
            - '<plugin-name>'

Formula Dependencies
====================

The `wordpress-formula` requires PHP, a MySQL client, and a webserver.

You may want to review the following formulas for help.

* `php-formula <https://github.com/saltstack-formulas/php-formula>`_
* `mysql-formula (mysql.client) <https://github.com/saltstack-formulas/mysql-formula#mysql-client>`_

You also need either:

* `nginx-formula <https://github.com/saltstack-formulas/nginx-formula>`_
* `apache-formula <https://github.com/saltstack-formulas/apache-formula>`_

Author
======

Nitin Madhok nmadhok@g.clemson.edu
Russell Ballestrini russell@ballestrini.net
Debian Fork by Starchy Grant starchy@gmail.com
