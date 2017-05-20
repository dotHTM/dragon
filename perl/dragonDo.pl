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

use DragonBrain ;

my $someDragonBrain = DragonBrain->new () ;

$someDragonBrain->{ debugMode } = 1 ;

$someDragonBrain->nextIteration ;
$someDragonBrain->nextIteration ;
$someDragonBrain->nextIteration ;

say "currentIteration = " . $someDragonBrain->currentIteration ;

say $someDragonBrain->currentIteration ;

say "foldLists = " . Dumper ( $someDragonBrain->{ foldLists } ) ;

say "flatFoldList = " . join ( ", ", $someDragonBrain->flatFoldList ( 3 ) ) ;
