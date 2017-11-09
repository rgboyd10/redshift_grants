import psycopg2
import sys

def lambda_handler(event, context)

    conn = psycopg2.connect(dbname = '', host = '', port = '', user = '', password = '')
    cur = conn.cursor()
    cur.execute(""" insert sql script here """)
    results = cur.fetchall()
    str1 = ''.join(str(d) for d in results)
    cur.execute(str1)
    conn.commit()
    cur.close()
    conn.close()
    sys.exit()
