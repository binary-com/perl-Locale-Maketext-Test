use Test::More;
use Test::NoWarnings;
use File::Spec;
use File::Basename;
use Locale::Maketext::Test;

plan tests => 6;

my $handler = Locale::Maketext::Test->new(
                                          directory => dirname(File::Spec->rel2abs($0)) . '/locales',
                                          languages => ['de'],
                                          debug     => 1
                                         );

my $result = $handler->testlocales();
diag explain $result;
is scalar(keys %{$result->{errors}}), 0, 'No errors found';
is $result->{status}, 1, 'Status is 1 as there are no errors';
