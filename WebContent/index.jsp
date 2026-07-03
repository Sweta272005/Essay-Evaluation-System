<html>
<head>
    <title>Essay Evaluation System</title>

    <style>

        body{
            margin:0;
            padding:0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .container{
            background:white;
            padding:40px;
            width:60%;
            border-radius:20px;
            box-shadow:0px 8px 20px rgba(0,0,0,0.2);
            text-align:center;
        }

        h1{
            color:#333;
            margin-bottom:20px;
        }

        textarea{
            width:90%;
            height:180px;
            padding:15px;
            border-radius:10px;
            border:1px solid #ccc;
            font-size:16px;
            resize:none;
            outline:none;
        }

        textarea:focus{
            border:2px solid #4facfe;
        }

        button{
            padding:12px 25px;
            margin:15px 10px;
            border:none;
            border-radius:8px;
            background:#4facfe;
            color:white;
            font-size:16px;
            cursor:pointer;
            transition:0.3s;
        }

        button:hover{
            background:#007bff;
            transform:scale(1.05);
        }

        .view-btn{
            background:#28a745;
        }

        .view-btn:hover{
            background:#1e7e34;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>Essay Evaluation & Plagiarism Detection System</h1>

    <form action="submitEssay" method="post">

        <textarea name="essay"
        placeholder="Write your essay here..."></textarea>

        <br><br>

        <button type="submit">Submit Essay</button>

    </form>

    <a href="view.jsp">
        <button class="view-btn">View All Essays</button>
    </a>

</div>

</body>
</html>