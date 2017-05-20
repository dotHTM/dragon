# dragonBrain.pm
#   Dragon Fractal Model
#
#   Started by Mike Cramer
#   Started on 2017-05-19

package DragonBrain ;

# use 5.18.0;
use strict ;

use Data::Dumper ;
use Convenience ;

sub new {
    my $inv = shift ;
    my $class = ref ( $inv ) || $inv ;

    my $self = {} ;
    bless ( $self, $class ) ;

    $self->{ foldLists } = [] ;
    $self->{ debugMode } = '' ;
    return $self ;
}    ## new

sub debugMessage($) {
    my $self = shift ;
    my ( $message ) = @_ ;
    say "[[debug]] " . $message if $self->{ debugMode } ;
}    ## debugMessage

sub currentIteration() {
    my $self        = shift ;
    my $arrayLength = @{ $self->{ foldLists } } ;
    return $arrayLength ;
}    ## currentIteration

sub flatFoldList ($) {
    my $self                  = shift ;
    my ( $thruthruIteration ) = @_ ;
    my @result                = () ;
    

    if ( $thruthruIteration <= $self->currentIteration ) {
        for ( my $index = 0 ; $index < $thruthruIteration ; $index++ ) {
            
            my @flattenedFoldList = @{ $self->{ foldLists } [ $index ] } ;
            $self->debugMessage(
                "iteration = " . $index . "\n" .
                 "flattenedFoldList = " . join (", ", @flattenedFoldList)  );
                                
            push @result, @flattenedFoldList ;
        }
    }


    return @result ;
}    ## flatFoldList

sub nextIteration() {
    my $self     = shift ;
    my @newFolds = ( 1 ) ;
    

    foreach my $subFoldItem (reverse $self->flatFoldList($self->currentIteration()) ) {
        if   ( $subFoldItem == 1 ) { push @newFolds, 0 ; }
        else                { push @newFolds, 1 ; }
    }
        
    push @{ $self->{ foldLists } }, \@newFolds ;
}    ## nextIteration

sub iterationUpTo ($) {
    my $self = shift ;
    my ( $someIteration ) = @_ ;
    while ( $self->currentIteration < $someIteration ) {
        $self->nextIteration ;
    }
}    ## iterationUpTo

1 ;
