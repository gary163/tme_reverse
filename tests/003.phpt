--TEST--
tme_reverse_test2() Basic test
--SKIPIF--
<?php
if (!extension_loaded('tme_reverse')) {
	echo 'skip';
}
?>
--FILE--
<?php
var_dump(tme_reverse_test2());
var_dump(tme_reverse_test2('PHP'));
?>
--EXPECT--
string(11) "Hello World"
string(9) "Hello PHP"
