====================================================
Web testing with Robot Framework and SeleniumLibrary
====================================================

`Robot Framework`_ is a generic open source test automation framework and
SeleniumLibrary_ is one of the many test libraries that can be used with
it. In addition to showing how they can be used together for web testing,
this demo introduces the basic Robot Framework test data syntax, how tests
are executed, and how logs and reports look like.

.. contents:: **Contents:**
   :depth: 1
   :local:

Preconditions
-------------

A precondition for running the tests is having `Robot Framework`_ and
SeleniumLibrary_ installed, and they in turn require
Python_. Robot Framework `installation instructions`__ cover both
Robot and Python installations, and SeleniumLibrary has its own
`installation instructions`__.

In practice it is easiest to install Robot Framework and
SeleniumLibrary along with its dependencies using `pip`_ package
manager. Once you have pip installed, all you need to do is running
these commands::

    pip install -r requirements.txt

__ https://github.com/robotframework/robotframework/blob/master/INSTALL.rst
__ https://github.com/robotframework/SeleniumLibrary#installation

Starting demo application
-------------------------

Running tests requires the `demo application`_ located under ``demoapp``
directory to be running.  It can be started either by double clicking
``demoapp/server.py`` file in a file manager or by executing it from the
command line::

    python demoapp/server.py

After the demo application is started, it is be available in URL
http://localhost:7272. You can test it manually, valid credentials are
``demo/mode``, and it needs to be running while executing the automated
tests.

If the application was started by double-clicking ``demoapp/server.py``
file, it can be shut down by closing the opened window. If it was
executed from the command line, using ``Ctrl-C`` is enough.

Starting Browserstack Local
---------------------------

Download the appropriate binary for your system by following directions from:
https://www.browserstack.com/local-testing/automate

    cd /path/to/BrowserstackLocal/Binary
    ./BrowserStackLocal --key *****

Running tests
-------------

The `test cases`_ are located in the ``tests`` directory. They can be
executed using the ``robot`` command::

    robot tests/app_tests
    robot tests/web_tests

.. note:: If you are using Robot Framework 2.9 or earlier, you need to
          use the ``pybot`` command instead.

You can also run an individual test case file and use various command line
options supported by Robot Framework::

    robot tests/web_tests/google_should_open.robot
    robot --test InvalidUserName --loglevel DEBUG login_tests

Run ``robot --help`` for more information about the command line usage and see
`Robot Framework User Guide`_ for more details about test execution in general.

Running tests in parallel
-------------------------

Concurrent testing is possible with Pabot. To install pabot, use:

    pip install -U robotframework-pabot

The `test cases`_ are located in the ``tests`` directory. They can be
executed in parallel using the ``pabot`` command::

    pabot tests/app_tests
    pabot tests/web_tests

Browserstack Integration
========================

This repo is integrated with Browserstack. To start testing on Browserstack,
input Browserstack username and access key in:

    ./tests/app_tests/recourse.robot
    ./tests/web_tests/resource.robot

Demo application
================

The demo application is a very simple login page shown below. With
user name ``demo`` and password ``mode`` you get into a welcome page, and
otherwise you end up to an error page. How to start and stop the
application yourself is explained in the `Starting demo application`_
section.

.. figure:: demoapp.png

Test cases
==========

Test case files as well as a resource file used by them are located in
the ``login_test`` directory. Click file names below to see the latest versions
online.

`google_should_open.robot`_
    A test suite with a single test for testing opening a browser on 
    Browserstack

`valid_login.robot`_
    A test suite with a single test for valid login.

    This test has a workflow that is created using keywords in
    the imported resource file.

`invalid_login.robot`_
    A test suite containing tests related to invalid login.

    These tests are data-driven by their nature. They use a single
    keyword, specified with the ``Test Template`` setting, that is called
    with different arguments to cover different scenarios.

    This suite also demonstrates using setups and teardowns in
    different levels.

`valid_login.robot`_
    A test suite with a single Gherkin style test.

`resource.robot`_
    A resource file with reusable keywords and variables.

    The system specific keywords created here form our own
    domain specific language. They utilize keywords provided
    by the imported SeleniumLibrary_.

See `Robot Framework User Guide`_ for more details about the test data syntax.

Generated results
=================

After `running tests`_ you will get report and log in HTML format. Example
files are also visible online in case you are not interested in running
the demo yourself:

- `report.html`_
- `log.html`_

Results will also be avaliable on the Browserstack dashboard


.. _Robot Framework: http://robotframework.org
.. _Browserstack: http://browserstack.com
.. _Browserstack Getting Started: https://www.browserstack.com/docs/automate/selenium/getting-started/python
.. _SeleniumLibrary: https://github.com/robotframework/SeleniumLibrary
.. _Python: http://python.org
.. _pip: http://pip-installer.org
.. _download: https://github.com/robotframework/WebDemo/archive/master.zip
.. _source code: https://github.com/robotframework/WebDemo.git
.. _valid_login.robot: https://github.com/robotframework/WebDemo/blob/master/login_tests/valid_login.robot
.. _invalid_login.robot: https://github.com/robotframework/WebDemo/blob/master/login_tests/invalid_login.robot
.. _gherkin_login.robot: https://github.com/robotframework/WebDemo/blob/master/login_tests/gherkin_login.robot
.. _resource.robot: https://github.com/robotframework/WebDemo/blob/master/login_tests/resource.robot
.. _report.html: http://robotframework.org/WebDemo/report.html
.. _log.html: http://robotframework.org/WebDemo/log.html
.. _Robot Framework User Guide: http://robotframework.org/robotframework/#user-guide
