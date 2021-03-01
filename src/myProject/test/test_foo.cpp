#define CATCH_CONFIG_RUNNER
#include "catch2/catch_all.hpp"

#include "myProject/foo.hpp"

TEST_CASE("bar", "[myProject, foo]")
{
    REQUIRE(myproject::bar() == 47);
}
