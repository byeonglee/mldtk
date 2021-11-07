#!/usr/bin/perl -w

#$cmd = "cat ";

my @stats = ();
my @starts = ();
my @ends = ();

@stats = <stats-sink-*>;
#@stats = <stats-27188*>;
#@files = <hits_*>;
#foreach my $file (@files) {
#  print $file . "\n";
#  $file =~ m/hits_\d+-(\w+)/;
#  print $1 . "\n";
#  $cmd = $cmd . "stats-$1.txt ";
#  push(@stats, "stats-$1.txt ");
#}

#$cmd = $cmd . "> summary.txt ";

#print $cmd . "\n";
#`$cmd`;

foreach $stat (@stats) {
  print $stat . "\n";
  $FILE = $stat;
  open(FILE) or die("Could not open stat file.");
  foreach $line (<FILE>) {
    chomp($line) ;
    #print $line ;
    if ($line =~ /Last tuple:\s(\d+\.\d+)\sseconds.*/) {
      print $1 ."\n";
      push(@ends, $1);
    }
                  #First tuple: 1289065033.928462 seconds
    if ($line =~ /First tuple:\s(\d+\.\d+)\sseconds/) {
      print $1 ."\n";
      push(@starts, $1);
    }
  }
}
  @starts = sort(@starts);
  @ends = sort(@ends);

  print "starts " . "$starts[0]" . "\n";
  print "ends " . $ends[-1] .  "\n";

  $start = $starts[0];
  $end = $ends[-1];

  $size = scalar @stats ;

  $diff = $end - $start ;

  $tuples = 100000000 ;

  $padding = $tuples % $size ;

  $tput = ($tuples + $padding) / $diff ; 

  # $one_tput = 185173.934817469;
  #$one_tput = 130145.59437647 ;
  #$one_tput = 50279.3024;
  #$one_tput = 129176.999136957 ;
  $one_tput = 171872.159925188;

  $ratio = $tput / $one_tput ;

  print "** padding is " . $padding . "\n"; 

  print $start . " & " . $end . " & " . $diff . " & " . $tput . " & " . $ratio . "\n"
