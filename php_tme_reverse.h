/* tme_reverse extension for PHP */

#ifndef PHP_TME_REVERSE_H
# define PHP_TME_REVERSE_H

extern zend_module_entry tme_reverse_module_entry;
# define phpext_tme_reverse_ptr &tme_reverse_module_entry

# define PHP_TME_REVERSE_VERSION "0.1.0"

# if defined(ZTS) && defined(COMPILE_DL_TME_REVERSE)
ZEND_TSRMLS_CACHE_EXTERN()
# endif

#endif	/* PHP_TME_REVERSE_H */
