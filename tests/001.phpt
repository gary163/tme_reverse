--TEST--
Check if tme_reverse is loaded
--SKIPIF--
<?php
if (!extension_loaded('tme_reverse')) {
	echo 'skip';
}
?>
--FILE--
<?php
echo 'The extension "tme_reverse" is available';
?>
--EXPECT--
The extension "tme_reverse" is available
