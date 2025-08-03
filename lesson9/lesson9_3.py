#請幫我自訂一個function
#連線至postgres DB
#建立連線環境參數的模板
import psycopg2
def create_connection():
  
    # 連線參數
    conn = psycopg2.connect(
        host="host.docker.internal",  # 使用 Docker 的內部網路地址
        database="postgres",
        user="postgres",
        password="raspberry",
        port="5432"  # PostgreSQL 的預設端口
     )
    return conn

def main():
    conn= create_connection()
    if conn:
        print("成功連線到資料庫")
        conn.close()
    else:
        print("無法連線到資料庫")
if __name__ == "__main__":
    main()

# 這個程式會連線到 PostgreSQL 資料庫並確認連線是否成功
# 確保在執行前已安裝 psycopg2 庫
# 可以使用 pip install psycopg2-binary 安裝 psycopg2 庫
# 注意：在 Docker 環境中，host.docker.internal 用於連接到主機的 PostgreSQL 服務
# 如果在非 Docker 環境中，需要將 host 參數改為實際的主機地址或 IP


##========================================##

import psycopg2

#請幫我建立一個function
#傳入connection參數
#建立一個cursor
#執行SQL查詢
#並回傳查詢結果

def execute_query(connection, query):
    cursor = connection.cursor()
    cursor.execute(query)
    result = cursor.fetchall()
    cursor.close()
    return result

def create_connection():
    conn = psycopg2.connect(
        host="host.docker.internal",
        database="postgres",
        user="postgres",
        password="raspberry",
        port="5432"
    )
    return conn


def main():
    conn = create_connection()
    if conn:
        print("成功連接到資料庫！")
        query = """
        SELECT count(*) AS "筆數"
        FROM "台鐵車站資訊";
        """
        result = execute_query(conn, query)
        print("台鐵車站資訊：", result)
        conn.close()
    else:
        print("無法連接到資料庫，請檢查設定。")
        return

if __name__ == "__main__":
    main()