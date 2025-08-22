import pathlib
import re


def snake_case(content):
    return re.sub(r'(?<!^)(?=[A-Z])', '_', content).lower()


def parse_getter(line):
    first_blank = line.find(' ')
    second_blank = line.find(' ', first_blank + 1)
    left_bracket = line.find('(')
    right_bracket = line.find(')')
    param_type = line[first_blank + 1:second_blank]
    args = line[left_bracket + 1:right_bracket].strip()
    if len(args) > 0:
        return None
    method = line[second_blank + 1:left_bracket].replace('get', '')
    name = method[0].lower() + method[1:]
    return dict(type=param_type, name=name)


def parse_setter(line):
    first_blank = line.find(' ')
    second_blank = line.find(' ', first_blank + 1)
    left_bracket = line.find('(')
    right_bracket = line.find(')')
    args = line[left_bracket + 1:right_bracket].strip()
    if len(args) == 0:
        return None
    arg_info = list(map(lambda pair: pair.split(' '), args.split(',')))
    if len(arg_info) != 1:
        return None
    method = line[second_blank + 1:left_bracket].replace('set', '')
    name = method[0].lower() + method[1:]
    param_type = arg_info[0][0]
    return dict(type=param_type, name=name)


def main():
    getter = []
    setter = []
    path = '/Users/binjzhang/Library/Application Support/Steam/steamapps/common/ProjectZomboid/Project Zomboid.app/Contents/Java/zombie/inventory/InventortItem.java'
    lines = pathlib.Path(path).open(mode='r').readlines()
    for line in lines:
        line = line.strip()
        if line.startswith('public') and ('get' in line or 'set' in line):
            tokens = line.split(' ')
            if tokens[2].startswith('get'):
                getter.append(parse_getter(line))
            elif tokens[2].startswith('set'):
                setter.append(parse_setter(line))

    param_dict = dict()
    for g in getter:
        if g is None:
            continue
        name = g['name']
        g['method'] = 'get'
        param_dict.setdefault(name, []).append(g)
    for s in setter:
        if s is None:
            continue
        name = s['name']
        s['method'] = 'set'
        param_dict.setdefault(name, []).append(s)
    java_lua_code = []
    lua_java_code = []
    for k, v in sorted(param_dict.items()):
        class_type = v[0]['type']
        if not class_type[0].islower() and class_type != 'String':
            continue
        snake_name = snake_case(k)
        if len(v) == 2:
            java_lua_code.append(f'tab.{snake_name} = item:get{k[0].upper()}{k[1:]}()')
            lua_java_code.append(f'if tab.{snake_name} then\nitem:set{k[0].upper()}{k[1:]}(tab.{snake_name})\nend')
        else:
            print(v[0]['type']+' '+v[0]['method']+k)
    with open('./java2lua.lua', 'w') as f:
        f.write('\n'.join(java_lua_code))
    with open('./lua2java.lua', 'w') as f:
        f.write('\n'.join(lua_java_code))


if __name__ == '__main__':
    main()
