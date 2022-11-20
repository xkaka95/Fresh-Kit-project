<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    
   
    <title>freshkit</title>
</head>

<body>

   
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
    <style>
        #footer {
            clear: both;
        }

        #container {
            width: 1250px;
            height: 100%;
            margin: 0 auto;
            font-family: "맑은고딕";
        }


        .order_fix {
            margin-bottom: 70px;
            margin-left: 150px;
            width: 900px;
        }


        #content {
            padding: 52px 0 20px;
        }

        .top_sec {
            
            padding-bottom: 0;
            border-bottom: 0;
            border-bottom-width: 0px;
            border-bottom-style: initial;
            border-bottom-color: initial;

        }

        .top_sec h2 {
            font-family: "맑은고딕";
            color: #101010;
            font-size: 40px;
            line-height: 56px;
            font-weight: 700;
        }

       
       
        

        
        .order_fix{
            
            margin-bottom: 70px;
            margin-left:130px ;
            width: 900px;
            
        }
       .order_desc_top{
        margin-top: 70px;
        margin-bottom: 70px;
        margin-left:130px ;
        text-align:center ;
       
       }
       .order_desc_top h3{
        margin-top:30px;
        
       
       }
       .order_desc_mid>h3{
       
        margin-left:130px ;
        text-align:center ;
        font-size: 20px;
        color:rgb(82, 82, 82);
       }
       .order_desc_bot{
        
        margin-left:130px ;
        text-align:center ;
        margin-top: 50px;
        font-size: 20px;
       
       }
       .order_desc_bot button{
        margin: 10px;
       }

       i{
       font-size: 50px;
      color: green;
       }
       


        
    </style>
    
 
    <body>
    <jsp:include page="header.jsp" />
        <section id="container">
            <div id="content" class="payorder_wrap">

                <div class="order_fix">
                    <!--inner단-->



                    <div id="content" class="top_sec">
                        <h2>주문 완료</h2>

                    </div>
                    <div class="order_desc_top">
                        <i class="xi-check-circle-o"></i>
                        <h3>고객님의 주문이 정상적으로 완료되었습니다.</h3>
                    </div>
                    <!-- <div class="order_desc_mid">
                        <h3>고객님의 주문번호는 <span>3216548794</span> 입니다.</h3>
                        <h3>주문내역 및 배송에 관한 안내는 주문조회를 통하여 확인 가능합니다.</h3>
                    </div> -->
                    <div class="order_desc_bot">
                        <a href="orderList.jsp"><button type="button" class="btn btn-outline-dark btn-lg">주문내역보러가기</button></a>
                        <a href="main.jsp"><button type="button" class="btn btn-success btn-lg">메인 페이지로 가기 </button></a>
                    </div>



                    
                </div>

                

                <!--1단-->
                
            </div>

        </section>
        <jsp:include page="footer.jsp" />
    </body>



    </html>