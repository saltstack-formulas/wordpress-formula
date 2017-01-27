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


``wordpress.download``
-------------

Download WordPress


``wordpress.config``
-------------

Configure WordPress sites


``wordpress.install``
-------------

Install WordPress sites

Pillar customizations:
======================

.. code-block:: yaml

    wordpress:
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

Formula Dependencies
====================

* `apache-formula <https://github.com/saltstack-formulas/apache-formula>`_
* `php-formula <https://github.com/saltstack-formulas/php-formula>`_

or

* `nginx-formula <https://github.com/saltstack-formulas/nginx-formula>`_
* `php-formula <https://github.com/saltstack-formulas/php-formula>`_

Author
======

Nitin Madhok nmadhok@g.clemson.edu
Debian Fork by Starchy Grant starchy@gmail.com
