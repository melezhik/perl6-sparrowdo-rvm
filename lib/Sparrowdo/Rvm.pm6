use v6;

unit module Sparrowdo::Rvm;

use Sparrowdo;

use Sparrowdo::Core::DSL::Bash;

use Sparrowdo::Core::DSL::Package;

our sub tasks (%args) {

    package-install 'gpg2';

    my $ruby-version = %args<ruby-version> || '2.1.0';

    bash "test -f /etc/profile.d/rvm.sh || curl -L get.rvm.io | bash -s stable";

    bash "source /etc/profile.d/rvm.sh && rvm reload && rvm install $ruby-version --default";

}

