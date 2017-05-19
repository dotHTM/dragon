# dragonBrain.pm
#   Dragon Fractal Model
#
#   Started by Mike Cramer
#   Started on 2017-05-19

package DragonBrain ;

# use 5.18.0;
use strict ;


sub new {
    my $inv = shift ;
    my $class = ref ( $inv ) || $inv ;

    my $self = {} ;
    bless ( $self, $class ) ;

    $self->{foldLists} = [] ;
    return $self ;
}

sub currentIteration(){
    my $self = shift;
    my $arrayLength = @{$self->{foldLists}};
    return $arrayLength;
}

sub nextIteration(){
    my @newFolds = (1);
     
}

1 ;
