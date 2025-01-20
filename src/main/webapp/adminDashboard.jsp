<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            background-color: #f9f9f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #343a40;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            width: 100%;
        }

        /* Cool Green Gradient Background for .contents */
        .contents {
            margin-top: 70px;
            width: 90%;
            max-width: 1000px;
            background: linear-gradient(145deg, #008000, #66ff66); /* Green gradient from #008000 to a lighter vibrant green (#66ff66) */
            border-radius: 6px;
            box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.2), -4px -4px 10px rgba(255, 255, 255, 0.7);
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 70px;
        }

        .contents h1 {
            text-align: center;
            color: black;
            margin-top: 10px;
            margin-bottom: 30px;
            font-weight: bold;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
        }

        .table-container {
            display: grid;
            grid-template-rows: auto;
            gap: 15px;
            width: 100%;
        }

        .record-row {
            display: grid;
            grid-template-columns: 70% 30%;
            background-color: #ffffff;
            padding: 10px 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .record-row:hover {
            transform: translateY(-4px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .record-row .record-type {
            font-size: 16px;
            color: #212529;
            font-weight: 500;
        }

        .record-row .record-count {
            font-size: 18px;
            font-weight: bold;
            color: #008000; /* Green for numbers */
            text-align: right;
        }
        
        a{
           text-decoration : none;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp"%>
    
    <div class="contents">
        <h1>Admin Dashboard</h1>
        <div class="table-container">
            <div class="record-row">
                <a href=""><div class="record-type">Number of Farmer records</div></a>
                <div class="record-count">1</div>
            </div>
            <div class="record-row">
                <a href="CustomerRecords.jsp""><div class="record-type">Number of  Customer records</div></a>
                <div class="record-count">20</div>
            </div>
            <div class="record-row">
                <a href="Productcat.jsp"><div class="record-type">Number of Product Category records</div></a>
                <div class="record-count">5</div>
            </div>
            <div class="record-row">
                <a href=""><div class="record-type">Number of Produce records</div></a>
                <div class="record-count">179</div>
            </div>
            <div class="record-row">
                <a href=""><div class="record-type">Number of Purchase Order records</div></a>
                <div class="record-count">18</div>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.jsp"%>  
</body>
</html>
