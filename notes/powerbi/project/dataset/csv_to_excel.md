
# Sample Sales & Demand Data (`sales_demand.csv`)
```csv
Product ID,Location ID,Date,On-Hand Quantity,Available Quantity,In-Transit Quantity,Safety Stock Level,Reorder Point,Inventory Value,Inventory Status
PROD001,WH001,2025-06-10,500,450,100,100,150,25000,Available
PROD002,WH001,2025-06-10,300,280,50,60,80,45000,Available
PROD003,WH001,2025-06-10,150,140,20,30,40,15000,Available
PROD001,RTL01,2025-06-10,80,75,10,15,20,4000,Available
PROD004,WH002,2025-06-10,200,190,0,40,50,20000,Available
```
---

## How to Split CSV Data into Separate Columns in Excel
1. **Copy the entire block of text** for one of the datasets (e.g., "Sales & Demand Data").
2. **Open a blank Excel workbook.**
3. **Click on cell A1** where you want the data to start.
1. **Paste your CSV data** into Excel. All values for each row will appear in a single column (e.g., column A).
2. **Select the column** containing your pasted data (e.g., column A).
3. Go to the **"Data"** tab in the Excel ribbon.
4. In the **"Data Tools"** group, click **"Text to Columns."**
5. The **"Convert Text to Columns Wizard"** will open.

    - **Step 1 of 3:**  
      - Choose **"Delimited"** (for data separated by commas, tabs, etc.).
      - Click **"Next >"**.

    - **Step 2 of 3:**  
      - Under **"Delimiters,"** check **"Comma."** Uncheck other options unless needed.
      - Preview your data in columns at the bottom.
      - Click **"Next >"**.

    - **Step 3 of 3 (Optional):**  
      - Set the data format for each column if needed (default is "General").
      - Choose the **"Destination"** cell if you want to change where the data appears.
      - Click **"Finish."**

  Your data should now be correctly parsed into separate columns.