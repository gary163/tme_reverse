dnl config.m4 for extension tme_reverse

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary.

dnl If your extension references something external, use 'with':

dnl PHP_ARG_WITH([tme_reverse],
dnl   [for tme_reverse support],
dnl   [AS_HELP_STRING([--with-tme_reverse],
dnl     [Include tme_reverse support])])

dnl Otherwise use 'enable':

PHP_ARG_ENABLE([tme_reverse],
  [whether to enable tme_reverse support],
  [AS_HELP_STRING([--enable-tme_reverse],
    [Enable tme_reverse support])],
  [no])

if test "$PHP_TME_REVERSE" != "no"; then
  dnl Write more examples of tests here...

  dnl Remove this code block if the library does not support pkg-config.
  dnl PKG_CHECK_MODULES([LIBFOO], [foo])
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBS, TME_REVERSE_SHARED_LIBADD)

  dnl If you need to check for a particular library version using PKG_CHECK_MODULES,
  dnl you can use comparison operators. For example:
  dnl PKG_CHECK_MODULES([LIBFOO], [foo >= 1.2.3])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo < 3.4])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo = 1.2.3])

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-tme_reverse -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/tme_reverse.h"  # you most likely want to change this
  dnl if test -r $PHP_TME_REVERSE/$SEARCH_FOR; then # path given as parameter
  dnl   TME_REVERSE_DIR=$PHP_TME_REVERSE
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for tme_reverse files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       TME_REVERSE_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$TME_REVERSE_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the tme_reverse distribution])
  dnl fi

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-tme_reverse -> add include path
  dnl PHP_ADD_INCLUDE($TME_REVERSE_DIR/include)

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-tme_reverse -> check for lib and symbol presence
  dnl LIBNAME=TME_REVERSE # you may want to change this
  dnl LIBSYMBOL=TME_REVERSE # you most likely want to change this

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   AC_DEFINE(HAVE_TME_REVERSE_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your tme_reverse library.])
  dnl ], [
  dnl   $LIBFOO_LIBS
  dnl ])

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are not using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $TME_REVERSE_DIR/$PHP_LIBDIR, TME_REVERSE_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_TME_REVERSE_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your tme_reverse library.])
  dnl ],[
  dnl   -L$TME_REVERSE_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(TME_REVERSE_SHARED_LIBADD)

  dnl In case of no dependencies
  AC_DEFINE(HAVE_TME_REVERSE, 1, [ Have tme_reverse support ])
  source_file="tme_reverse.c"
  PHP_NEW_EXTENSION(tme_reverse, tme_reverse.c, $ext_shared)
fi

