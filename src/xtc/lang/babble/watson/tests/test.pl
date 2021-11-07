#!/usr/bin/env perl 
use strict;
use warnings;
use Getopt::Std;

my $root = "~/work/java";
my $hostName = `hostname`;
chomp($hostName);
my $appName = "TestApp";
my $user = `whoami`;
chomp($user);

my $java = "java";
my $cp = "cp";
my $mv = "mv";
my $cd = "cd";
my $cqlParser = "xtc.lang.babble.CQL";
my $sraParser = "xtc.lang.babble.SRA";
my $brookletParser = "xtc.lang.babble.watson.Watson";


my $templatePath = ${root} . "/src/xtc/lang/babble/watson";
my $outputPath = ${root} . "/src/xtc/lang/babble/watson/tests/cases";
my $testPath = ${root} . "/src/xtc/lang/babble/watson/tests";
my $funcEnvPath = ${root} . "/src/xtc/lang/babble/watson/tests/FunctionEnv";

my $hostFlag = "-host " . ${hostName};
my $templateFlag = "-templatePath " . ${templatePath};
my $outputFlag = "-outputPath " . ${outputPath};
my $appFlag = "-appName " . ${appName};
my $userFlag = "-user " . ${user};

my @failedTests = ();

my @tests = <cases/*.cql>; 
foreach my $test (@tests) {
    print "$test";

    #if (0 != exec("${java} ${cqlParser} -output ${test}.sra -toSRA ${test}")) {   
    #    push(@failedTests, $test);
    #}
    if (-d  "${outputPath}/${appName}") {
      system('rm','-r', "${outputPath}/${appName}");
    }
    if (-d  "${funcEnvPath}") {
      system('rm','-r', "${funcEnvPath}");
    }

    `${java} ${cqlParser} -output ${test}.sra -toSRA ${test}`;
    `${java} ${sraParser} -output ${test}.bk -translate ${test}.sra`;
    `${java} ${brookletParser} ${hostFlag} ${userFlag} -toSystemS ${templateFlag} ${outputFlag} ${appFlag} ${test}.bk`;   
    `${mv} ${testPath}/FunctionEnv/*  ${outputPath}/${appName}/src/`;
    # `make -f ${outputPath}/${appName}/src/Makefile`;
}

my $numFailures = scalar @failedTests;
if ($numFailures == 0) {
    print "\n\nSUCCESS!\n\n";
} else {
    foreach my $failure (@failedTests) {
        print "FAILED: " . $failure . "\n";
    }
}
