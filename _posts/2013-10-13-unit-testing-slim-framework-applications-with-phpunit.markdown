---
layout:     post
title:      "Unit Testing Slim PHP Framework applications with PHPUnit"
subtitle:   "Integration testing Slim without a webserver"
date:       2013-10-13 11:45
tags:       [php, slim, phpunit]
author:     "Craig Davis"
header-img: "img/headers/driftwood.jpg"
---

[Slim][slim] is a great PHP framework with a small footprint and everything you need to build fast applications. I've found it particularly well suited to delivering data to [BackboneJS][bb] applications.

However, I haven't found a great deal of information about integration and unit testing with Slim, and have developed an approach that allows complete end-to-end testing of an application. You can use this testing a REST framework, or a complete website. In particular, I think it's a great way to handle regression testing. I'm presenting a [sample application][app] that I hope will help others on their path to using this great framework.

## Example

Here's [a test][version_test] for a very simple endpoint that returns the version from the application config. We're asserting that Slim responded with a `200` and that the version matches what we expect.

{% highlight php startinline %}
class VersionTest extends Slim_Framework_TestCase {
    public function testVersion() {
        $this->get('/version');
        $this->assertEquals(200, $this->response->status());
        $this->assertEquals($this->app->config('version'), $this->response->body());
    }
}
{% endhighlight %}

## Concepts

The core idea of this approach is that we isolate our application routes into their own file. This allows us to include this route file into both a production context via an index.php file, and also include it within a unit testing bootstrap harness in our testing context. The unit testing context with use the internal `Slim\Environment::mock()` method to setup an environment for our application.

Here's what the app looks like:

* app/
  * app.php
* public/
  * index.php
  * .htaccess
* tests/
  * bootstrap.php
  * integration/
    * VersionTest.php
    * UsersTest.php
* phpunit.xml

The `public/index.php` file serves as the application entry point. This file initializes a SlimPHP `$app` with production configuration, includes the routes file from `app/app.php` and then runs the app with `$app->run();`. This allows us to keep our application separate from the index, and gives us an opportunity to include our `app/app.php` file in a different context.

When phpunit runs, it looks for the phpunit.xml file in our root. This file specifies a testing bootstrap file. PHPUnit includes `testing/bootstrap.php`. This file creates an `$app`, just like in `index/index.php`, but it uses testing configuration. The bootstrap keeps a reference to `$app` for the testing framework, and then provides several helper methods for `GET`, `POST`, `PUT`, `PATCH`, `HEAD`, and `DELETE`.

With these methods, you can run end to end tests on SlimPHP routes without a webserver. The tests run entirely within a mock environment, and will be fast and efficient.

## Unit Testing vs. Integration Testing

Unit tests should test an individual part of code. The system under test should be as small as possible. You would unit test an individual method. Integration testing exercises an entire system. Most of this example is about integration testing. We are running tests that work Slim from initial instantiation to the final delivery of data. With integration tests, we're treating the entire application as a unit, setting up a particular initial environment and then executing the `run()` command and finally inspecting the results to ensure that they match our expectations.

## Mocking with SlimPHP
See the [ZenTest][zen_test] for an example of mocking with SlimPHP dependency injection. In this test we mock a Curl wrapper class from [Shuber][shuber]. This allows us to substitute responses and exercise the parts of our application that we feel need testing. It also allows us to run these unit tests on systems that don't have the curl extension installed. We're totally isolated from that dependency while this running test.

The [FileStoreTest][file_test] uses a mock for the authentication class. Notice that the file store route doesn't use that class directly, but instead it is used by the application authenticator method. We're using the app dependency injection container to swap out the real object for a mock version. This approach allows us to control authentication results from within our test harness.

You can read more about dependency injection in the [SlimDocs on DI][di], and more about mock objects in the [PHPUnit docs][php_mock].

[bootstrap]: https://github.com/there4/slim-unit-testing-example/blob/master/tests/bootstrap.php
[app]: https://github.com/there4/slim-unit-testing-example
[slim]: http://www.slimframework.com/
[issues]: https://github.com/there4/slim-unit-testing-example/issues
[phpunit]: http://phpunit.de/manual/current/en/index.html
[yml]: https://github.com/there4/slim-unit-testing-example/blob/master/.travis.yml
[tci]: http://travis-ci.org
[php_mock]: http://phpunit.de/manual/3.0/en/mock-objects.html
[shuber]: https://github.com/shuber/curl
[si]: http://docs.slimframework.com/#Response
[di]: http://docs.slimframework.com/#Dependency-Injection
[file_test]: https://github.com/there4/slim-unit-testing-example/blob/master/tests/integration/FileStoreTest.php
[zen_test]: https://github.com/there4/slim-unit-testing-example/blob/master/tests/integration/ZenTest.php
[version_test]: https://github.com/there4/slim-unit-testing-example/blob/master/tests/integration/VersionTest.php
[lh]: http://localhost:8080
[bb]: http://backbonejs.org
[njh]: https://github.com/njh
[njh_test]: https://github.com/njh/njh.me/blob/master/test/IntegrationTest.php
