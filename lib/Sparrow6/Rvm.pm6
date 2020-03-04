use v6;

unit module Sparrow6::Rvm;

use Sparrow6::DSL;

our sub tasks (%args) {

    package-install 'gnupg2';

    my $ruby-version = %args<version> || '2.1.0';

    bash "curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -", %(
      description => "import key (pkuczynski.asc)"
    );

    bash "curl -ksSL https://rvm.io/mpapis.asc | gpg2 --import -", %(
      description => "import key (mpapis.asc)"
    );

    bash "test -f /etc/profile.d/rvm.sh || curl -sL get.rvm.io | bash -s stable", %(
      description => "install rvm"
    );

    bash "source ~/.rvm/scripts/rvm && rvm reload && rvm install $ruby-version --default", %(
      description => "install ruby version $ruby-version"
    );

}

