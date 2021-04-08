#include "catch2/catch.hpp"

#include "myProject/foo.hpp"

TEST_CASE("bar", "[myProject, foo]")
{
    REQUIRE(myproject::bar() == 1);
    REQUIRE(1.0 == Approx(1.0));
}
