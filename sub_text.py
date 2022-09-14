#!/usr/bin/python

import re
import sys
from pathlib import Path


def read_file(file):
    try:
        with open(file) as f:
            data = f.read()
            return data
    except UnicodeDecodeError:
        pass

    with open(file, encoding='utf8') as f:
        return f.read()


def write_file(file, data):
    with open(file, 'w', encoding='utf8') as f:
        f.write(data)


def sub_txt(file, w1, w2):
    print(file)
    data = read_file(file)
    new_data = re.sub(w1, w2, data)
    write_file(file, new_data)


def main():
    p, w1, w2 = sys.argv[1:]
    path = Path(p)
    if Path(p).is_dir():
        for f in path.iterdir():
            sub_txt(f, w1, w2)
    else:
        for f in path.parent.glob(path.name):
            sub_txt(f, w1, w2)


if __name__ == '__main__':
    main()
