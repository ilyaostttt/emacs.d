(let ((filename "~/src_ext/tlpi-dist/README"))
  (if (file-exists-p filename)
      (ede-cpp-root-project "tlpi-dist"
                            :name "tlpi-dist"
                            :file filename
                            :include-path '("/lib"))))

(setq gtest-include-path "~/src_ext/gtest-1.6.0/include")
(setq cpp-system-include "/usr/include/c++/4.6.1/")

(let ((filename "~/src/cpp/Makefile"))
  (if (file-exists-p filename)
      (ede-cpp-root-project "testing_test"
                            :name "testing_test"
                            :file filename
                            :system-include-path '(gtest-include-path))))

(let ((filename "~/src/algorithms/Makefile"))
  (if (file-exists-p filename)
      (ede-cpp-root-project "algorithms"
                            :name "algorithms"
                            :file filename
                            :system-include-path '(gtest-include-path ))))

(provide 'rc-ede)



