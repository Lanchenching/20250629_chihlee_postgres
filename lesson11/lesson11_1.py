# 當輸出df變數時,st.write()會自動執行
"""
# My first app
Here's our first attempt at using data to create a table:
"""

"""
import streamlit as st
import pandas as pd
df = pd.DataFrame({
  'first column': [1, 2, 3, 4],
  'second column': [10, 20, 30, 40]
})

df


## streamlit為快速顯示資料給人看
"""

import streamlit as st
import pandas as pd
st.title("台鐵車站資訊")
st. header("2023年每日各站進出站人數")

if st.button("Send balloons!"):
    st.balloons()




import streamlit as st
import pandas as pd

st.sidebar.title("台鐵車站資訊")
st.sidebar.header("2023年各站進出人數")
st.subheader("進出站人數顯示區")
station = st.sidebar.selectbox(
    "請選擇車站",
    ("台北", "台中", "高雄"),
)

st.write("您選擇的車站:", station)




