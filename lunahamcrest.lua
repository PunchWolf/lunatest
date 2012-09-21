--
--- @author Janne Sinivirta
--

-- required core global functions
local type = type
local string = string

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

--- Matcher for nil. Should be named nil but that is of course a reserved word
function is_nil()
    return {
        expected = nil,
        matches = function(value) return value == nil end,
        describe = "nil"
    }
end

--- Matcher to check == equality
function of_type(expected_type)
    return {
        expected = expected_type,
        matches = function(value)
            return type(value) == expected_type, type(value)
        end,
        describe = "type " .. expected_type
    }
end

--- Matcher to check if string contains a given substring
function contains_string(substring)
    return {
        expected = substring,
        matches = function(value) return type(value) == "string" and type(substring) == "string" and string.find(value, substring) ~= nil end,
        describe = "contains " .. substring
    }
end

--- Matcher to check if string starts with a given substring
function starts_with(substring)
    return {
        expected = substring,
        matches = function(value) return type(value) == "string" and type(substring) == "string" and string.find(value, substring) == 1 end,
        describe = "starts with " .. substring
    }
end
