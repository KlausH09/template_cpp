# usage

# build in relaese mode:
# make
#
# run tests
# make test 
#
# run tests with linter, memcheck and codecov
# make test linting=ON memcheck=ON codecov=ON

tests = ON
linting = OFF
memcheck = OFF
codecov = OFF

test_flags += -DBuild_Tests=$(tests)
test_flags += -DLinting=$(linting)
test_flags += -DMemCheck=$(memcheck)
test_flags += -DCodeCov=$(codecov)

ifeq ($(OS), Windows_NT)
  RM = rmdir /s /q
  ifeq ($(tests), ON)
    test_targets += RUN_TESTS
  endif
else
  RM = rm -rf
  ifeq ($(tests), ON)
    test_targets += test
  endif
  ifeq ($(memcheck), ON)
    test_targets += memcheck
  endif
  ifeq ($(codecov), ON)
    test_targets += coverage
  endif
endif


build_release:
	cmake -B ./build -S . -DCMAKE_BUILD_TYPE=Release
	cmake --build ./build --parallel --config Release

build_tests:
	cmake -B ./build -S . -DCMAKE_BUILD_TYPE=Debug $(test_flags)
	cmake --build ./build --parallel --config Debug

test: build_tests
	cmake --build build --target $(test_targets) --config Debug

clean:
	$(RM) build
