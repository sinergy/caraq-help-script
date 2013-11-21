#!bin/perl

use strict;
use warnings;

my $file = $ARGV[0];
my @file;

my $no = '"no"';
my $direction = '"direction"';
my $x = '"xOff"';
my $y = '"yOff"';
my $bottomed = '"send_back_angel"';
my $angle_string = '"angle"';

open (FILE, $file) or die "Could not open file '$file' : $!";
@file = <FILE>;
close(FILE);

# `$#file` if the final index of array @file
for (my $i = 1; $i < $#file; $i++) {
  my @columns = split("\t", $file[$i]);
  if ($i == 1) {
    print "{"; # the OPEN brace of JSON Object
#    print "\"actionID\":$columns[0],";
#    print "\"actionName\":\"$columns[1]\",";
    print "\"frames\":[";
  }

  print "{"; # OPEN brace of JSON for each frame
  print "\"duration\":$columns[4],";
  
  my @head = split('/', $columns[5]);
  print "\"head\":";
  print "{";  # OPEN bracket for head
  if ($#head == 0) {
    print "$no:\"$head[0]\"";
  }
  if ($#head == 1) {
    print "$no:\"$head[0]\",";
    # if meet Direction change
    if ($head[1] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($head[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($head[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  if ($#head == 2) {
    print "$no:\"$head[0]\",";
    # if meet Direction change
    if ($head[1] =~ /^D\+(\d)$/) {
      print "$direction:$1,";
    }
    # if meet X Offset
    if ($head[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1,";
    }
    # if meet Y Offset
    if ($head[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1,";
    }

    # if meet Direction change
    if ($head[2] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($head[2] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($head[2] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  print "},"; #CLOSE bracket for head

  my @body = split ('/', $columns[6]);
  print "\"torso\":";
  print "{";  # OPEN bracket for body
  if ($#body == 0) {
    print "$no:\"$body[0]\"";
  }
  if ($#body == 1) {
    print "$no:\"$body[0]\",";
    # if meet Direction change
    if ($body[1] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($body[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($body[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  if ($#body == 2) {
    print "$no:\"$body[0]\",";
    # if meet Direction change
    if ($body[1] =~ /^D\+(\d)$/) {
      print "$direction:$1,";
    }
    # if meet X Offset
    if ($body[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1,";
    }
    # if meet Y Offset
    if ($body[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1,";
    }

    # if meet Direction change
    if ($body[2] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($body[2] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($body[2] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  print "},"; #CLOSE bracket for body 

  my @l_arm = split ('/', $columns[7]);
  print "\"l_arm\":";
  print "{";  # OPEN bracket for L_arm
  if ($#l_arm == 0) {
    print "$no:\"$l_arm[0]\"";
  }
  if ($#l_arm == 1) {
    print "$no:\"$l_arm[0]\",";
    # if meet Direction change
    if ($l_arm[1] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($l_arm[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($l_arm[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  if ($#l_arm == 2) {
    print "$no:\"$l_arm[0]\",";
    # if meet Direction change
    if ($l_arm[1] =~ /^D\+(\d)$/) {
      print "$direction:$1,";
    }
    # if meet X Offset
    if ($l_arm[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1,";
    }
    # if meet Y Offset
    if ($l_arm[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1,";
    }

    # if meet Direction change
    if ($l_arm[2] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($l_arm[2] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($l_arm[2] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  print "},"; #CLOSE bracket for L_arm

  my @r_arm = split ('/', $columns[8]);
  print "\"r_arm\":";
  print "{";  # OPEN bracket for right arm
  if ($#r_arm == 0) {
    print "$no:\"$r_arm[0]\"";
  }
  if ($#r_arm == 1) {
    print "$no:\"$r_arm[0]\",";
    # if meet Direction change
    if ($r_arm[1] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($r_arm[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($r_arm[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  if ($#r_arm == 2) {
    print "$no:\"$r_arm[0]\",";
    # if meet Direction change
    if ($r_arm[1] =~ /^D\+(\d)$/) {
      print "$direction:$1,";
    }
    # if meet X Offset
    if ($r_arm[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1,";
    }
    # if meet Y Offset
    if ($r_arm[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1,";
    }

    # if meet Direction change
    if ($r_arm[2] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($r_arm[2] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($r_arm[2] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  print "},"; #CLOSE bracket for R_arm

  my @l_hand = split ('/', $columns[9]);
  print "\"l_hand\":";
  print "{";  # OPEN bracket for L_hand
  if ($#l_hand == 0) {
    print "$no:\"$l_hand[0]\"";
  }
  if ($#l_hand == 1) {
    print "$no:\"$l_hand[0]\",";
    # if meet Direction change
    if ($l_hand[1] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($l_hand[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($l_hand[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  if ($#l_hand == 2) {
    print "$no:\"$l_hand[0]\",";
    # if meet Direction change
    if ($l_hand[1] =~ /^D\+(\d)$/) {
      print "$direction:$1,";
    }
    # if meet X Offset
    if ($l_hand[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1,";
    }
    # if meet Y Offset
    if ($l_hand[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1,";
    }

    # if meet Direction change
    if ($l_hand[2] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($l_hand[2] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($l_hand[2] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  print "},"; #CLOSE bracket for L_arm

  my @r_hand = split ('/', $columns[10]);
  print "\"r_hand\":";
  print "{";  # OPEN bracket for L_arm
  if ($#r_hand == 0) {
    print "$no:\"$r_hand[0]\"";
  }
  if ($#r_hand == 1) {
    print "$no:\"$r_hand[0]\",";
    # if meet Direction change
    if ($r_hand[1] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($r_hand[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($r_hand[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  if ($#r_hand == 2) {
    print "$no:\"$r_hand[0]\",";
    # if meet Direction change
    if ($r_hand[1] =~ /^D\+(\d)$/) {
      print "$direction:$1,";
    }
    # if meet X Offset
    if ($r_hand[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1,";
    }
    # if meet Y Offset
    if ($r_hand[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1,";
    }

    # if meet Direction change
    if ($r_hand[2] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($r_hand[2] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($r_hand[2] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  print "},"; #CLOSE bracket for Right Hand

  my @l_leg = split ('/', $columns[11]);
  print "\"l_leg\":";
  print "{";  # OPEN bracket for L_leg
  if ($#l_leg == 0) {
    print "$no:\"$l_leg[0]\"";
  }
  if ($#l_leg == 1) {
    print "$no:\"$l_leg[0]\",";
    # if meet Direction change
    if ($l_leg[1] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($l_leg[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($l_leg[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  if ($#l_leg == 2) {
    print "$no:\"$l_leg[0]\",";
    # if meet Direction change
    if ($l_leg[1] =~ /^D\+(\d)$/) {
      print "$direction:$1,";
    }
    # if meet X Offset
    if ($l_leg[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1,";
    }
    # if meet Y Offset
    if ($l_leg[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1,";
    }

    # if meet Direction change
    if ($l_leg[2] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($l_leg[2] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($l_leg[2] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  print "},"; #CLOSE bracket for Left Leg

  my @r_leg = split ('/', $columns[12]);
  print "\"r_leg\":";
  print "{";  # OPEN bracket for Right Leg
  if ($#r_leg == 0) {
    print "$no:\"$r_leg[0]\"";
  }
  if ($#r_leg == 1) {
    print "$no:\"$r_leg[0]\",";
    # if meet Direction change
    if ($r_leg[1] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($r_leg[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($r_leg[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  if ($#r_leg == 2) {
    print "$no:\"$r_leg[0]\",";
    # if meet Direction change
    if ($r_leg[1] =~ /^D\+(\d)$/) {
      print "$direction:$1,";
    }
    # if meet X Offset
    if ($r_leg[1] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1,";
    }
    # if meet Y Offset
    if ($r_leg[1] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1,";
    }

    # if meet Direction change
    if ($r_leg[2] =~ /^D\+(\d)$/) {
      print "$direction:$1";
    }
    # if meet X Offset
    if ($r_leg[2] =~ /^X\+?(\-?\d*)$/) {
      print "$x:$1";
    }
    # if meet Y Offset
    if ($r_leg[2] =~ /^Y\+?(\-?\d*)$/) {
      print "$y:$1";
    }
  }
  print "},"; #CLOSE bracket for Left Leg

  if (defined(chomp($columns[13]))) {
    my @others = split (' ', $columns[13]);
    print "\"other\":[";

    for (my $j=0; $j<=$#others; $j++) {
      my @attr = split('/', $others[$j]);
      print "{"; # OPEN bracket for JSON object for Others
      
      if ($#attr == 0) {
        print "$no:\"$attr[0]\"";
      }
      if ($#attr == 1) {
        print "$no:\"$attr[0]\",";
        # if meet Direction change
        if ($attr[1] =~ /^D\+(\d)$/) {
          print "$direction:$1";
        }
        # if meet X Offset
        if ($attr[1] =~ /^X\+?(\-?\d*)$/) {
          print "$x:$1";
        }
        # if meet Y Offset
        if ($attr[1] =~ /^Y\+?(\-?\d*)$/) {
          print "$y:$1";
        }
        # if meet place layer to bottom
        if ($attr[1] =~ /^[A-H]+$/) {
          print "$bottomed:"; # print bottomed tag
          print "[";  # open bottom array
          
          my @angles = split('', $attr[1]);
          for my $angle (0 .. $#angles) {
            print '"';
            print "$angles[$angle]";
            print '"';
            if ($angle != $#angles) {
              print ",";
            }
          }
          
          print "]";
        }
      }
      if ($#attr == 2) {
        print "$no:\"$attr[0]\",";
        # if meet Direction change
        if ($attr[1] =~ /^D\+(\d)$/) {
          print "$direction:$1,";
        }
        # if meet X Offset
        if ($attr[1] =~ /^X\+?(\-?\d*)$/) {
          print "$x:$1,";
        }
        # if meet Y Offset
        if ($attr[1] =~ /^Y\+?(\-?\d*)$/) {
          print "$y:$1,";
        }
        # if meet place layer to bottom
        if ($attr[1] =~ /^[A-H]+$/) {
          print "$bottomed:"; # print bottomed tag
          print "[";  # open bottom array
          
          my @angles = split('', $attr[1]);
          for my $angle (0 .. $#angles) {
            print '"';
            print "$angles[$angle]";
            print '"';
            if ($angle != $#angles) {
              print ",";
            }
          }
          
          print "]";
        }

        # if meet Direction change
        if ($attr[2] =~ /^D\+(\d)$/) {
          print "$direction:$1";
        }
        # if meet X Offset
        if ($attr[2] =~ /^X\+?(\-?\d*)$/) {
          print "$x:$1";
        }
        # if meet Y Offset
        if ($attr[2] =~ /^Y\+?(\-?\d*)$/) {
          print "$y:$1";
        }
        # if meet place layer to bottom
        if ($attr[2] =~ /^[A-H]+$/) {
          print "$bottomed:"; # print bottomed tag
          print "[";  # open bottom array
          
          my @angles = split('', $attr[2]);
          for my $angle (0 .. $#angles) {
            print '"';
            print "$angles[$angle]";
            print '"';
            if ($angle != $#angles) {
              print ",";
            }
          }
          
          print "]";
        }
      }
      if ($#attr == 3) {
        print "$no:\"$attr[0]\",";

        for (my $a = 1; $a <= $#attr; $a++) {
          # if meet Direction change
          if ($attr[$a] =~ /^D\+(\d)$/) {
            print "$direction:$1";
          }
          # if meet X Offset
          if ($attr[$a] =~ /^X\+?(\-?\d*)$/) {
            print "$x:$1";
          }
          # if meet Y Offset
          if ($attr[$a] =~ /^Y\+?(\-?\d*)$/) {
            print "$y:$1";
          }
          # if meet place layer to bottom
          if ($attr[$a] =~ /^[A-H]+$/) {
            print "$bottomed:"; # print bottomed tag
            print "[";  # open bottom array
            
            my @angles = split('', $attr[$a]);
            for my $angle (0 .. $#angles) {
              print '"';
              print "$angles[$angle]";
              print '"';
              if ($angle != $#angles) {
                print ",";
              }
            }
            
            print "]";
          }
          if ($a != $#attr) {
            print ",";
          }
        }
      }

      if ($j == $#others) {
        print "}";
      } else {
        print "},";
      }

    }
    print "]";

  }

  print "}"; # CLOSE bracket of JSON for each frame object

  if ($i == $#file-1) {
    print "]"; # CLOSE bracket for array object in JSON
    print "}\n"; # CLOSE brace of JSON object
  } else {
    print ","
  }
}
