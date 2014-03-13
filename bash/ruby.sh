# JRuby, Rubinius
export JRUBY_OPTS=-X+C
export RBXOPT=-X19

# patched ruby
export RUBY_GC_MALLOC_LIMIT=100000000

export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"

# requires "brew install curl-ca-bundle"
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt