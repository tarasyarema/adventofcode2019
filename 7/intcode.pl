use Data::Dumper qw(Dumper);

open my $file, '<', "in"; 
my $line = <$file>; 
close $file;

my @data = map { int($_) } (split /,/, $line);
my $l = @data;

my @magic = map { int($_) } (split /,/, <STDIN>);
my $j = 0;
my $i = 0;

# print Dumper \@data;
while (1) {
    my $tmp = @data[$i];

    my $code = int ($tmp % 100);
    my $op1  = int (($tmp % 1000) / 100);
    my $op2  = int (($tmp % 10000) / 1000);
    my $op3  = int (($tmp % 100000) / 10000);

    last if ($code == 99);
    
    my $x = $op1 == 1 ? @data[$i + 1]: @data[@data[$i + 1]]; 
    my $y = $op2 == 1 ? @data[$i + 2]: @data[@data[$i + 2]];
    my $z = @data[$i + 3]; 

    if ($code == 1) {
        @data[$z] = $x + $y;
        $i += 4;
    } elsif ($code == 2) {
        @data[$z] = $x * $y;
        $i += 4;
    } elsif ($code == 3) {
        @data[@data[$i + 1]] = @magic[$j];
        $j += 1;
        $i += 2;
    } elsif ($code == 4) {
        print "@data[@data[$i + 1]]\n";
        $i += 2;
    } elsif ($code == 5) {
        $i = $x != 0 ? $y : $i + 3;
    } elsif ($code == 6) {
        $i = $x == 0 ? $y : $i + 3;
    } elsif ($code == 7) {
        @data[$z] = $x < $y ? 1 : 0;
        $i += 4;
    } elsif ($code == 8) {
        @data[$z] = $x == $y ? 1 : 0;
        $i += 4;
    }
}
