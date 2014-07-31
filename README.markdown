[![Build Status](https://secure.travis-ci.org/rolandwalker/syntactic-sugar.png?branch=master)](http://travis-ci.org/rolandwalker/syntactic-sugar)

# Overview

Effect-free forms such as if/then/else for Emacs Lisp.

 * [Quickstart](#quickstart)
 * [Explanation](#explanation)
 * [Notes](#notes)
 * [Compatibility and Requirements](#compatibility-and-requirements)

## Quickstart

```elisp
(require 'syntactic-sugar)
 
(if t
    (then (message "true"))
  (else (message "false")))
 
(unwind-protect
    (protected
      (error "Error"))
  (unwind
    (message "cleanup")))
```

## Explanation

This library offers absolutely no functionality!  The following
macros are provided as synonyms for `progn`:

	then
	else
	protected
	unwind

These macros can be used to clarify `if` or `unwind-protect` forms.

Note that as synonyms for `progn`, these forms have no useful
effects, and no additional syntax check is done, so nothing
prevents you from writing obfuscatory expressions such as

```elisp
(if t (else 1) (then 2))      ; same as (if t (progn 1) (progn 2))
```

or idiotic expressions such as

```elisp
(if t
    (protected 1)
  (unwind 2))
```

So, think of these macros as glorified comments.  And realize that
if you are tempted to use them, if in fact you have even read the
documentation to this point, you are hopelessly impure at heart.

To use syntactic-sugar, place the `syntactic-sugar.el` library somewhere
Emacs can find it, and add the following to your `~/.emacs` file:

```elisp
(require 'syntactic-sugar)
```

## Notes

When this library is loaded, the provided forms are registered as
keywords in font-lock.  This may be disabled via `customize`.

The included macros are intentionally not autoloaded, because they
are outside the package namespace.

## Compatibility and Requirements

	GNU Emacs version 24.4-devel     : yes, at the time of writing
	GNU Emacs version 24.3           : yes
	GNU Emacs version 23.3           : yes
	GNU Emacs version 22.2           : yes
	GNU Emacs version 21.x and lower : unknown

No external dependencies
