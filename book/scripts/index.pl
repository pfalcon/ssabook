#!/opt/local/bin/perl
use re qw(eval);

open GREP, "find . -name '*.tex' -exec grep -HE 'index\{.+\}' {} \\;|";
my %indexes = ();
my $BALBRACE='(?{local$d=0})(?:\{(?{$d++})|\}(?{$d--})(?(?{$d<0})(?!))|(?>[^\{\}]*))+(?(?{$d!=0})(?!))';


while (my $indexref=<GREP>) {
    next if ($indexref =~ /\/Springer\//);
    if ($indexref =~ s/^\.\/back\///) {
      next ;
    }
    if ($indexref =~ s/^\.\/headers\///) {
      next;
    }    
    if ($indexref =~ s/^\.\/(part\d)\/([^\/]+)\/.+://) {
	($part,$section)=($1,$2);
    } else { die "pb parsing grep ".$indexref; }
    while ($indexref=~ s/index\{([^\}]*)\}//) {
	$indexes{$1}{$section}++;
    }
}

foreach my $index (sort {uc($a) cmp uc($b)} (keys %indexes)) {
    printf "%-30s:", $index;
    print join(" ", keys %{$indexes{$index}}), "\n";
}
