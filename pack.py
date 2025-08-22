import pathlib
import shutil

final_file_path = pathlib.Path('item_convert.lua')


def main():
    with final_file_path.open('w') as w:
        with pathlib.Path('lua').joinpath('main.lua').open('r') as r:
            shutil.copyfileobj(r, w)
        w.write('\n')
        for sub in pathlib.Path('lua').joinpath('sub').iterdir():
            with sub.open('r') as r:
                shutil.copyfileobj(r, w)
            w.write('\n')

if __name__ == '__main__':
    main()
