#encoding:utf-8
#! /usr/bin/env python 2


#建立标签计量数
def create_tag_Dict(tag_path):
    file = open(tag_path,'r')
    name = file.name.split("/")[-1].split(".")[0]
    item = [("name",name ),("number",0)]
    itemDict = dict(item)
    file.close()
    return itemDict


#把txt文本格式的评论变成字符串
def comment(comment_path):
    file = open(comment_path, 'r')
    l = []
    for line in file:
        l.append(line)
        txt = ''.join(l)
        print txt
    import re
    m1 = re.compile('[-\n$]')
    file.close()


#检索a在评论中出现的次数
def search_a(a,len):
    with open(tag_path) as file:
        comment = file.readlines()
        result = re.findall(a,comment)
    return len(result)


#处理标签，获取该标签的最终计量数
def handle_comment(comment_path):
    file = open(comment_path)
    tag_Dict = create_tag_Dict(tag_path)
    for line in file.readlines():
        a = line.strip()
        tag_Dict['number'] = tag_Dict['number'] + search_a(a,len)
    file.close()
    return tag_Dict



comment('/home/zss/PycharmProjects/homework/res/太空旅客.txt')





























