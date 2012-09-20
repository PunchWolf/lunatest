--
--- @author Janne Sinivirta
--

-- ##############
-- #  Matchers  #
-- ##############

--- Matcher to check == equality
function equal_to(object)
    return {
        expected = object,
        matches = function(value) return object == value end,
        describe = "equal to " .. object
    }
end

--- Purely syntactic sugar. You can for example say assert_that(2, is(equal_to(2)))
function is(matcher)
    return {
        expected = matcher.expected,
        matches = function(value) return matcher.matches(value) end,
        describe = matcher.describe
    }
end

--- Matcher to negate the result of enclosed Matcher
function is_not(matcher)
    return {
        expected = matcher.expected,
        matches = function(value) return not matcher.matches(value) end,
        describe = "not " .. matcher.describe
    }
end

function is_nil()
    return {
        expected = nil,
        matches = function(value) return value == nil end,
        describe = "nil"
    }
end
