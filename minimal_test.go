package main

import (
	"github.com/DATA-DOG/godog"
)

func binhello() error {
	return godog.ErrPending
}

func iRunBinhello() error {
	return godog.ErrPending
}

func iGetHello() error {
	return godog.ErrPending
}

func FeatureContext(s *godog.Suite) {
	s.Step(`^bin\/hello$`, binhello)
	s.Step(`^I run bin\/hello$`, iRunBinhello)
	s.Step(`^I get Hello$`, iGetHello)
}
