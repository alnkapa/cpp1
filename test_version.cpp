#include "version.h"
#include "lib.h"
#include "gtest/gtest.h"

// TEST has two parameters: the test case name and the test name.
// After using the macro, you should define your test logic between a
// pair of braces.  You can use a bunch of macros to indicate the
// success or failure of a test.  EXPECT_TRUE and EXPECT_EQ are
// examples of such macros.  For a complete list, see gtest.h.
TEST(version, Positive)
{
    EXPECT_EQ(PROJECT_VERSION, version());
}