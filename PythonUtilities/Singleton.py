

class Singleton(object):
    """
    Les classe héritante ne sont instanciées qu'une seul fois.
    """
    def __new__(cls, *args, **kwds):
        it = cls.__dict__.get("__it__")
        if it is not None:
            return it
        cls.__it__ = it = object.__new__(cls)
        it.__init__(*args, **kwds)
        return it

    def __init__(self, *args, **kwds):
        pass