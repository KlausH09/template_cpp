#include "catch2/catch.hpp"

#include "myProject/foo.hpp"

TEST_CASE("bar", "[myProject, foo]")
{
    REQUIRE(myproject::bar() == 1);
}
