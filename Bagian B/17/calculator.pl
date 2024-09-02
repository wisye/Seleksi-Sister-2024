sub absolute {
	my ($number) = @_;
	return $number < 0 ? -$number : $number;
}

sub add {
	my ($a, $b) = @_;
	ADD_LOOP:
	if($b != 0){
		my $carry = $a & $b;
		$a = $a ^ $b;
		$b = $carry << 1;
		goto ADD_LOOP;
	}
	return $a;
}

sub subtract {
	my ($a, $b) = @_;
	return add(add($a, ~$b), 1);
}

sub multiply {
	my ($a, $b) = @_;
	my $result = 0;
	my $counter = absolute($b);
	my $negative = $b < 0;

	MULTIPLY_LOOP:
	if($counter > 0){
		$result = add($result, $a);
		$counter = subtract($counter, 1);
		goto MULTIPLY_LOOP;
	}
	return $negative ? negate($result) : $result;
}

sub divide {
	my ($dividend, $divisor) = @_;
	my $quotient = 0;
	my $sign = ($dividend < 0) ^ ($divisor < 0) ? -1 : 1;
	$dividend = absolute($dividend);
	$divisor = absolute($divisor);

	DIVIDE_LOOP:
	if($dividend >= $divisor){
		$dividend = subtract($dividend, $divisor);
		$quotient = add($quotient, 1);
		goto DIVIDE_LOOP;
	}
	return $sign < 0 ? negate($quotient) : $quotient;
}

sub power {
	my ($base, $exponent) = @_;
	return 1 if $exponent == 0;
	my $result = $base;
	my $counter = absolute($exponent);
	my $negative = $exponent < 0;

	POWER_LOOP:
	if($counter > 1){
		$result = multiply($result, $base);
		$counter = subtract($counter, 1);
		goto POWER_LOOP;
	}

	return $negative ? divide(1, $result) : $result;
}

# sub isq {
# 	my ($number) = @_;
# 	my $threehalfs = 1.5;
# 	my $x2 = $number * 0.5;
# 	my $y = $number;

# 	my $i = unpack("l", pack("f", $y)); 

# 	$i = subtract(0x5f3759df, ($i >> 1));

# 	$y = unpack("f", pack("l", $i));

# 	$y = multiply($y, (subtract($threehalfs, (multiply(multiply($x2, $y), $y)))));

# 	return $y;
# }

# my $isq = isq(0.2);
# print "$isq";

print "Input your operation: \n";
my $input = <STDIN>;
chomp $input;

my @char = split /(\D)/, $input;
@char = grep {$_ ne ''} @char;
my $result = shift @char;

CALCULATOR_LOOP:
if(@char){
	my $op = shift @char;
	my $next = shift @char;

	$result = int($result);
	$next = int($next);

	if($op eq '+'){
		$result = add($result, $next);
	}
	elsif($op eq '-'){
		$result = subtract($result, $next);
	}
	elsif($op eq '*'){
		$result = multiply($result, $next);
	}
	elsif($op eq '/'){
		$result = divide($result, $next);
	}
	elsif($op eq '^'){
		$result = power($result, $next);
	}

	goto CALCULATOR_LOOP if @char;
}

$result = unpack("l", pack("l", $result));
print "\nResult: $result\n";