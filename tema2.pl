use strict;
use warnings;
use diagnostics;

my $file = "test_perl.txt";

open my $fh , '<' ,$file 
	or die "\nUnable to open $file : $_";

my @array = <$fh>;
close $fh or die "Couldn't Close File $fh : $_";

my @reversed_array = reverse @array;

my $new_file = "test_perl_2.txt";

open my $fh2 , '>>' ,$new_file 
	or die "\nUnable to create $file : $_";

for my $line (@reversed_array){
	my @y = grep {$_} split /(\d+)/, $line;
	#aici am concatenat data calendaristica si am salvato
	#intr-o variabila ca sa nu mio intoarca cand dau revers la array
	my $date = join("", @y[6..($#y-1)]);
	@y = splice @y,0,6; 
	push @y , $date; 
	my @costum_y = reverse @y;
	my $string = join("",@costum_y);
	print $fh2 "$string\n";
}

close $fh2 or die "Couldn't Close File $fh2 : $_";
