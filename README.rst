====
yml2conf
====

|nimble-version| |nimble-install| |gh-actions|

This is a Nim project template.

.. contents:: Table of contents

Usage
=====

こんな感じにしたいなぁ。

.. code-block:: shell

   yml2conf generate

* src配下のymlを読み込んでout配下に吐き出す
* `--config` で1ファイル指定する
* yml2conf generate logrotate logrotate.yml みたいにサブコマンドでファイルタイプ
  を指定する
* yml内の `yml2conf.type` の値で生成の仕方を切り替える


.. code-block:: text

   src/
     **cwd**
     supervisor/
       app.yml
     logrotate/
       app.yml
     sshd_config/
       dev.yml
     cron/
       app.yml
     out/
       supervisor/
         app.conf
       logrotate/
         app
       sshd_config/
         dev.conf
       cron/
         app


あるいは

.. code-block:: text

   src/
     **cwd**
     supervisor/
       app.yml
     logrotate/
       app.yml
     sshd_config/
       dev.yml
     cron/
       app.yml
     out/
       prd/
         supervisor/
           app.conf
         logrotate/
           app
         sshd_config/
           dev.conf
         cron/
           app
       stg/
         supervisor/
           app.conf
         logrotate/
           app
         sshd_config/
           dev.conf
         cron/
           app
       dev/
         supervisor/
           app.conf
         logrotate/
           app
         sshd_config/
           dev.conf
         cron/
           app

Installation
============

.. code-block:: shell

   $ nimble install -Y CHANGEME

LICENSE
=======

MIT

.. |gh-actions| image:: https://github.com/jiro4989/CHANGEME/workflows/build/badge.svg
   :target: https://github.com/jiro4989/CHANGEME/actions
.. |nimble-version| image:: https://nimble.directory/ci/badges/CHANGEME/version.svg
   :target: https://nimble.directory/ci/badges/CHANGEME/nimdevel/output.html
.. |nimble-install| image:: https://nimble.directory/ci/badges/CHANGEME/nimdevel/status.svg
   :target: https://nimble.directory/ci/badges/CHANGEME/nimdevel/output.html
