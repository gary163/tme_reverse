--TEST--
tme_reverse_test1() Basic test
--SKIPIF--
<?php
if (!extension_loaded('tme_reverse')) {
	echo 'skip';
}
?>
--FILE--
<?php
$ret = tme_reverse_test1();

var_dump($ret);
?>
--EXPECT--
The extension tme_reverse is loaded and working!
NULL
