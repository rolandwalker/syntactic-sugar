
(require 'syntactic-sugar)

;;; then

(ert-deftest then-01 nil
  (should
   (= 2
      (if t (then 2)))))


;;; else

(ert-deftest else-01 nil
  (should
   (= 2
      (if nil (then 1) (else 2)))))


;;; protected

(ert-deftest protected-01 nil
  (should
   (= 2
      (unwind-protect
          (protected
            1
            2)))))

;;; unwind

(ert-deftest unwind-01 nil
  (let ((value nil))
    (ignore-errors
      (unwind-protect
          (protected
            1
            (error "error")
            (should-not t)
            2)
        (unwind
          (setq value 3))))
    (should
     (= value 3))))

;;
;; Emacs
;;
;; Local Variables:
;; indent-tabs-mode: nil
;; mangle-whitespace: t
;; require-final-newline: t
;; coding: utf-8
;; byte-compile-warnings: (not cl-functions)
;; End:
;;

;;; syntactic-sugar-test.el ends here
