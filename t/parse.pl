use strict;
use warnings;
binmode STDOUT, ":encoding(UTF-8)";
binmode STDERR, ":encoding(UTF-8)";
open(my $fh, "<:encoding(UTF-8)", "t/locales/de.po");
my $count = 1;
while($count <= 20){
  <$fh>;
  $count++;
}
my $str = <$fh>;

close($fh);
chomp($str);


while ($str =~                  # Iterate over chunks.
       m/(
           [^\~\[\]]+  # non-~[] stuff (Capture everything else here)
         |
           ~.       # ~[, ~], ~~, ~other
         |
           \[          # [ presumably opening a group
         |
           \]          # ] presumably closing a group
         |
           ~           # terminal ~ ?
         |
           $
         )/xgs
      ) {
  warn qq{  "$1"\n};

  if ($1 eq '[' or $1 eq '') {
    print "in if";
  }
}
