#!/usr/local/bin/perl
# dragonDo.pl
#   Description
#
#   Written by Mike Cramer
#   Started on 2017-05-19

use 5.6.0 ;
use strict ;
use warnings ;

use Data::Dumper ;

use Convenience ;

use DragonFractal ;

# my $someDragonFractal = PaperFractal->new () ;
my $someDragonFractal = DragonFractal->new () ;

$someDragonFractal->iterationUpTo(5) ;

say "currentIteration = " . $someDragonFractal->currentIteration ;

say $someDragonFractal->currentIteration ;

say "flatFoldList = " . join ( "", $someDragonFractal->flatFoldList ) ;

say "length = " . $someDragonFractal->lastFoldListLength;

say "2^N = " . (2 ** $someDragonFractal->currentIteration);

# say Dumper($someDragonFractal);