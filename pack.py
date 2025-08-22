import pathlib
import shutil

final_file_path = pathlib.Path('item_convert.lua')


def main():
    with final_file_path.open('w') as w:
        for sub in pathlib.Path('lua').iterdir():
            with sub.open('r') as r:
                shutil.copyfileobj(r, w)
            w.write('\n')



if __name__ == '__main__':
    main()
