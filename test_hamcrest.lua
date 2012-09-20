--
-- Author: Janne Sinivirta
-- Date: 9/19/12
--
require('lunatest')
require('lunahamcrest')

function test_equal_to()
    assert_that(4, equal_to(4))
    assert_that("ok", equal_to("ok"))
end

function test_not()
    assert_that(4, is_not(equal_to(5)))
    assert_that(5, is_not(is_nil()))
end

function test_syntactic_sugars()
    assert_that(4, is(equal_to(4)))
    assert_that(nil, is_nil())
end


lunatest.run()
