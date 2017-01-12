#!/usr/bin/python

import unittest


def is_str(_entry):
    """
    Return true if entry is a list
    """
    return isinstance(_entry, list)


class FilterModule(object):
    """ Ansible custom filter plugin """

    def filters(self):
        return {
            'is_str': is_str
        }


class TestIsStr(unittest.TestCase):
    """
    test case for this filter plugin. to execute
    run ``python is_str.py``
    """
    def test_if_is_str_is_true(self):
        self.assertEqual(is_str([1, 2, 3, 3]), False)

    def test_if_str_is_not_list(self):
        self.assertEquals(is_str('1'), true)

if __name__ == '__main__':
    unittest.main()
