#!/usr/bin/perl -w

$cmd = "cat ";

my @stats = ();
my @starts = ();
my @ends = ();

@files = <reduce1*>;
foreach my $file (@files) {
  print $file . "\n";
  $file =~ m/reduce1-(\w+)/;
  print $1 . "\n";
  $cmd = $cmd . "stats-$1.txt ";
  push(@stats, "stats-$1.txt ");
}

$cmd = $cmd . "> summary.txt ";

print $cmd . "\n";
`$cmd`;

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

  $diff = $end - $start ;

  $tput = 1000000000 / $diff ; 

  $ratio = $tput / 164910.395693847;
  print $start . " & " . $end . " & " . $diff . " & " . $tput . " & " . $ratio . "\n"
