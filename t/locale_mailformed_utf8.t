use Test::More;
use Test::NoWarnings;
use File::Spec;
use File::Basename;
use Locale::Maketext::Test;

################################################################################
# NOTES
# There is a bug in Locale::Maketext on perl v5.16 or lower version
# When run this test with perl v5.16 or lower
# With the following lines:
# use Locale::Maketext::ManyPluralForms {
#'EN'      => ['Gettext' => '/home/git/binary-com/translations-websockets-api/src/en.po'],
#  '_decode' => 1, ....
#};
# There will be an error:
# Malformed UTF-8 character (unexpected end of string) in string ne .....
# This test is to test this error is fixed.
################################################################################

plan tests => 2;

my $handler = Locale::Maketext::Test->new(
                                          directory => dirname(File::Spec->rel2abs($0)) . '/locales',
                                          languages => ['de'],
                                          debug     => 1
                                         );

my $result = $handler->testlocales();
diag explain $result;
is scalar(keys %{$result->{errors}}), 0, 'No errors found';
is $result->{status}, 1, 'Status is 1 as there are no errors';
