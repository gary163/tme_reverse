/* tme_reverse extension for PHP */

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include "php.h"
#include "ext/standard/info.h"
#include "php_tme_reverse.h"

/* For compatibility with older PHP versions */
#ifndef ZEND_PARSE_PARAMETERS_NONE
#define ZEND_PARSE_PARAMETERS_NONE() \
	ZEND_PARSE_PARAMETERS_START(0, 0) \
	ZEND_PARSE_PARAMETERS_END()
#endif

/* {{{ void tme_reverse_test1()
 */
PHP_FUNCTION(str_reverse)
{
	char   *in;
	size_t len_in;
	if(zend_parse_parameters(ZEND_NUM_ARGS(),"s", &in, &len_in) == FAILURE){
		RETURN_FALSE;
	}

	//把字符串转成数组
	char bytes[len_in+1];
	strcpy(bytes, in);

	//执行翻转
	reverse(0, len_in-1, bytes);
	bytes[len_in] = '\0';

	//在堆上分配内存
	unsigned char *out = (unsigned char *) malloc(len_in +1);
	strcpy(out, bytes);

	//返回
	RETVAL_STRING(out);

	//释放内存
	if(out != NULL){
		free(out);
		out = NULL;
	}

	return;
}
/* }}} */

void reverse(int left, int right, char bytes[])
{
	if(left >= right){
		return;
	}

	char tmp = bytes[left];
	bytes[left] = bytes[right];
	bytes[right] = tmp;

	reverse(++left, --right, bytes);
}



/* {{{ PHP_RINIT_FUNCTION
 */
PHP_RINIT_FUNCTION(tme_reverse)
{
#if defined(ZTS) && defined(COMPILE_DL_TME_REVERSE)
	ZEND_TSRMLS_CACHE_UPDATE();
#endif

	return SUCCESS;
}
/* }}} */

/* {{{ PHP_MINFO_FUNCTION
 */
PHP_MINFO_FUNCTION(tme_reverse)
{
	php_info_print_table_start();
	php_info_print_table_header(2, "tme_reverse support", "enabled");
	php_info_print_table_end();
}
/* }}} */

/* {{{ arginfo
 */
ZEND_BEGIN_ARG_INFO(arginfo_tme_reverse_test1, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO(arginfo_tme_reverse_test2, 0)
	ZEND_ARG_INFO(0, str)
ZEND_END_ARG_INFO()
/* }}} */

/* {{{ tme_reverse_functions[]
 */
static const zend_function_entry tme_reverse_functions[] = {
	PHP_FE(str_reverse,		NULL)
	PHP_FE_END
};
/* }}} */

/* {{{ tme_reverse_module_entry
 */
zend_module_entry tme_reverse_module_entry = {
	STANDARD_MODULE_HEADER,
	"tme_reverse",					/* Extension name */
	tme_reverse_functions,			/* zend_function_entry */
	NULL,							/* PHP_MINIT - Module initialization */
	NULL,							/* PHP_MSHUTDOWN - Module shutdown */
	PHP_RINIT(tme_reverse),			/* PHP_RINIT - Request initialization */
	NULL,							/* PHP_RSHUTDOWN - Request shutdown */
	PHP_MINFO(tme_reverse),			/* PHP_MINFO - Module info */
	PHP_TME_REVERSE_VERSION,		/* Version */
	STANDARD_MODULE_PROPERTIES
};
/* }}} */

#ifdef COMPILE_DL_TME_REVERSE
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif
ZEND_GET_MODULE(tme_reverse)
#endif
