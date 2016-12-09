#!/bin/bash
# JRuby, Rubinius
export JRUBY_OPTS=-X+C
export RBXOPT=-X19

export BUNDLE_JOBS=6

# ruby 1.9 - 2.0 GC settings
export RUBY_GC_MALLOC_LIMIT=2147483648  # 2 gb
# export RUBY_HEAP_MIN_SLOTS=$(( 408*1500 ))
# export RUBY_FREE_MIN=32768

# requires "brew install curl-ca-bundle"

export PATH=$PATH:./bin

# instruct minitest/spec not to mix in assertions to object
export MT_NO_EXPECTATIONS=yes

uninstall_gems() {
  list=$(gem list --no-versions)
  for gem in $list; do
    gem uninstall "$gem" -aIx
  done
  gem list
  gem install bundler
}
