Feature: Minimal

Scenario: minimal
  Given bin/hello
  When I run bin/hello
  Then I get Hello
