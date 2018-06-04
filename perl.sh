  #!/usr/bin/perl -w
   use strict;

   my $a = 'I talked to Alice this morning.';
   my $b = 'I talked to Bobby this morning.';
   print "'$a' matches /Bob/ \n"    if   $a =~ m/Bob/;
   print "'$b' matches /Bob/ \n"    if   $b =~ m/Bob/;
