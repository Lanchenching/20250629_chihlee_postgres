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
        password="raspberry"
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

  