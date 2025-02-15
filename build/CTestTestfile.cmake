# CMake generated Testfile for 
# Source directory: /workspaces/PyAuth/cJSON
# Build directory: /workspaces/PyAuth/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(cJSON_test "/workspaces/PyAuth/build/cJSON_test")
set_tests_properties(cJSON_test PROPERTIES  _BACKTRACE_TRIPLES "/workspaces/PyAuth/cJSON/CMakeLists.txt;248;add_test;/workspaces/PyAuth/cJSON/CMakeLists.txt;0;")
subdirs("tests")
subdirs("fuzzing")
