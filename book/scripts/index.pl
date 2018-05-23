#!/opt/local/bin/perl
use re qw(eval);
use Regexp::Common;

open GREP, "find . -name '*.tex' -exec grep -HE 'index\{.+\}' {} \\;|";
my %indexes = ();
my $BALBRACE='(?{local$d=0})(?:\{(?{$d++})|\}(?{$d--})(?(?{$d<0})(?!))|(?>[^\{\}]*))+(?(?{$d!=0})(?!))';
my $bp = $RE{balanced}{-parens=>'{}'};


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
    #    while ($indexref=~ s/index\{([^\}]*)\}//) {
    while ($indexref=~ s/index($bp)//) {
	$indexes{$1}{$section}++;
    }
}

foreach my $index (sort {uc($a) cmp uc($b)} (keys %indexes)) {
    printf "\\index%-60s:", $index;
    print join(" ", keys %{$indexes{$index}}), "\n";
}
