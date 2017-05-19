#!/usr/local/bin/perl
# dragonDo.pl
#   Description
#
#   Written by Mike Cramer
#   Started on 2017-05-19

use 5.6.0;
use strict ;
use warnings ;

use Convenience ; 

use DragonBrain ;

my $someDragonBrain = DragonBrain->new() ;

say $someDragonBrain->currentIteration ;



