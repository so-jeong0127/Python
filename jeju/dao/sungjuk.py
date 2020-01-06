import json
import pymysql
def getConnection() :
    return pymysql.connect(host = '192.168.1.241', port = 3306, user = 'root',
    password = 'acorn1234Q!', use_unicode = True, db = "acornschool", charset = 'utf8', autocommit = True)

def getSungjuk() :
    conn = getConnection()
    cur = conn.cursor()
    cur.callproc("sungjuk_select")
    if(cur.rowcount) :
        result = cur.fetchall()
        print(result)
    else :
        result = 0;
    cur.close()
    conn.close()
    return result

def setSungjuk(sungData):
    conn = getConnection()
    cur = conn.cursor()
    args = (sungData['name'], sungData['kor'], sungData['mat'], sungData['eng'])
    cur.callproc("sungjuk_insert", args)
    result = cur.rowcount
    cur.close()
    conn.close()
    return json.dumps({'rows': result})

def delSungjuk(in_name):
    conn = getConnection()
    cur = conn.cursor()
    args = (in_name, 0)
    cur.callproc("sungjuk_delete", args)
    cur.execute('SELECT @_sungjuk_delete_1')
    cur.fetchone()
    result = cur.rowcount
    cur.close()
    conn.close()
    return json.dumps({'rows' : result})

def putSungjuk(sungData):
    conn = getConnection()
    cur = conn.cursor()
    # print("테스트 중 ")
    # print(sungData) # 서버쪽에서는 name을 받고 클라이언트에서는 id로 관리한다.
    args = (sungData["id5"], sungData["name1"], sungData["kor1"], sungData["mat1"], sungData["eng1"], 0)  # tuple
    cur.callproc("sungjuk_update", args)
    cur.execute('SELECT @_sungjuk_update_5')
    #result = cur.fetchone()
    cur.fetchone()
    result = cur.rowcount
    # print(result)
    cur.close()
    conn.close()
    return json.dumps({'rows': result})