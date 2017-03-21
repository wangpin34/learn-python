# -*- coding: utf-8 -*-
import sys

reload(sys)                      # reload 才能调用 setdefaultencoding 方法
sys.setdefaultencoding('utf-8')  # 设置 'utf-8'  

# 这个是 str 的字符串
s = '关关雎鸠'

# 这个是 unicode 的字符串
u = u'关关雎鸠'

s + u  # 失败，UnicodeDecodeError: 'ascii' codec can't decode byte 0xe5 in position 0: ordinal not in range(128)

# 正确，所有的字符串都是 str, 不需要 decode
"中文：%s" % s   # 中文：关关雎鸠

# 失败，相当于运行："中文：%s".decode('ascii') % u
"中文：%s" % u  # UnicodeDecodeError: 'ascii' codec can't decode byte 0xe5 in position 0: ordinal not in range(128)

# 正确，所有字符串都是 unicode, 不需要 decode
u"中文：%s" % u   # 中文：关关雎鸠

# 失败，相当于运行：u"中文：%s" % s.decode('ascii')
u"中文：%s" % s  # UnicodeDecodeError: 'ascii' codec can't decode byte 0xe5 in position 0: ordinal not in range(128)
