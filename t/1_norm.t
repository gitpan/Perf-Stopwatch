#!./perl

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 11;
BEGIN { use_ok('Perf::Stopwatch') };

END {is( $loaded, 1, "module loaded");}

use Perf::Stopwatch qw( :normal );

$loaded = 1;
is( $loaded, 1, "module loaded" );

$norm = new Perf::Stopwatch( type => "normal" );

ok( defined $norm, "");
ok( $norm->isa("Perf::Stopwatch"), "made Stopwatch object");
is( $norm->{type},   0, " is normal Stopwatch");
is( $norm->{laps}, 100, " has 100-lap default");
is( $norm->{final},  0, " has initial final=0");
is( $norm->{c_lap},  0, " has initial lap=0");

$norm->start();
sleep(1);
$norm->stop();
$elap = $norm->getTime();
ok( defined $elap, "");
cmp_ok( $elap, ">=", 1, " slept for a second");
