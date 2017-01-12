#!/usr/bin/python

import unittest


def is_list(_entry):
    """
    Return true if entry is a list
    """
    return isinstance(_entry, list)


class FilterModule(object):
    """ Ansible custom filter plugin """

    def filters(self):
        return {
            'is_list': is_list
        }


class TestIsList(unittest.TestCase):
    """
    test case for this filter plugin. to execute
    run ``python is_list.py``
    """
    def test_if_is_list_is_true(self):
        self.assertEqual(is_list([1, 2, 3, 3]), True)

    def test_if_str_is_not_list(self):
        self.assertEquals(is_list('1'), False)

if __name__ == '__main__':
    unittest.main()
