# JRuby, Rubinius
export JRUBY_OPTS=-X+C
export RBXOPT=-X19

# patched ruby
export RUBY_GC_MALLOC_LIMIT=100000000

# ruby 1.9 - 2.0 GC settings
export RUBY_GC_MALLOC_LIMIT=2147483648  # 2 gb
export RUBY_HEAP_MIN_SLOTS=$(( 408*1500 ))
export RUBY_FREE_MIN=32768

export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"

# requires "brew install curl-ca-bundle"
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt