<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>HOME</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@700&display=swap" rel="stylesheet">
    <link
        href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
        rel="stylesheet">
    <style>
        .header-div {
            background-image: url(./header_backgroud-1.svg);
            width: 100%;
            height: 100vh;
            padding-left: 10%;
            padding-right: 10%;
            background-size: cover;
        }

        .head-logo img {
            padding-top: 10px;
            width: 170px;
        }

        .header-links {
            display: flex;
            justify-content: space-between;
        }

        .header-item {
            color: #FFFFFF;
            text-decoration: none;
            font-family: 'Plus Jakarta Sans', sans-serif;
            padding: 10px;
        }

        .link-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .header-icon-container {
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .header-icon-container img {
            margin-right: 10px;
            width: 24px;
        }

        .header-image-part {
            display: flex;
        }

        .gradient-text {
            background: linear-gradient(55deg, #FFF8E9 3.92%, #FFD47A 78.89%);
            -webkit-background-clip: text;
            font-weight: 700;
            background-clip: text;
            color: transparent;
            /* Set text color to transparent to show the gradient background */



            /* display: inline; Ensure the gradient applies only to the text content */
        }

        .header-image-part-1 {
            padding-left: 20px;
            width: 50%;
            font-family: 'Playfair Display', serif;
            font-size: 60px;
            font-style: italic;
        }

        .header-image-part-2 {
            width: 50%;

        }

        .header-image-part-2 .img1 {
            background-color: #D39B29;
            ;

            padding-left: 170px;
        }

        .header-image-part-2 .img2 {
            background-color: #D39B29;
            padding-left: 250px;
        }

        .circular-container {
            width: 200px;
            /* Adjust the width of the circular container */
            height: 200px;
            /* Adjust the height of the circular container */
            padding: 10px;
            /* Add padding to the circular container */
            background-color: #D39B29;
            /* Add background color if needed */
            border-radius: 50%;
            /* Make the container circular */
            position: relative;
            left: 185px;
        }

        .circular-container1 {
            width: 260px;
            /* Adjust the width of the circular container */
            height: 260px;
            /* Adjust the height of the circular container */
            padding: 10px;
            /* Add padding to the circular container */
            background-color: #D39B29;
            /* Add background color if needed */
            border-radius: 50%;
            /* Make the container circular */
            position: relative;
            left: 230px;
            /* Adjust the right position */
            bottom: 55px;
        }

        .circular-image {
            width: 100%;
            /* Make the image fill the circular container */
            height: 100%;
            /* Make the image fill the circular container */
            display: block;
            /* Remove extra space at the bottom */
            padding-top: 0px;
        }

        .header-image-part-1 p {
            margin-bottom: 0px;
        }

        .gradient-button {
            background: linear-gradient(89deg, #C10000 5.87%, #AB0000 102.88%);
            color: #fff;
            /* Set text color to white */
            padding: 10px 20px;
            /* Adjust padding as needed */
            border: none;
            /* Remove border */
            border-radius: 6.25rem;
            cursor: pointer;
            /* Add cursor style for better usability */
            font-family: Plus Jakarta Sans;
            font-size: 1.3125rem;
            font-style: normal;
            font-weight: 700;
            line-height: normal;
        }

        .gold-price-div {
            width: 100%;
            height: 3.625rem;
            background-color: #C10000;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .square-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            padding-left: 10%;
            padding-right: 10%;
        }

        /* .square {
            border-radius: 5%;
            width: 18%;
            /* Adjust the width as needed */
        /* padding-top: 18%; */
        /* Maintain aspect ratio to create a square */
        /* background-color: #ccc; */
        /* Add a background color for visualization */
        /* display: flex; */
        /* justify-content: center; */
        /* } */
        */ .square .title-cat {
            color: #FFF;
            font-family: Plus Jakarta Sans;
            font-size: 1rem;
            font-style: normal;
            font-weight: 400;
            line-height: normal;
            letter-spacing: 0.03375rem;
        }

        .rectangle-container {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
            padding-left: 12%;
            padding-right: 12%;
        }

        .rectangle {
            width: 24.5%;
            /* Adjust the width as needed */
            height: 120px;
            /* Set the height to half of the width */
            /* background-color: #ccc; Add a background color for visualization */
            position: relative;
            /* Position relative for absolute positioning of the content */
            top: 50%;
            /* Adjust the position as needed */
            transform: translateY(+66.6%);
            background: linear-gradient(101deg, #D39B29 4.72%, #9D6D09 97.4%);
            border-radius: 20px;
        }

        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 120px;
            color: #FFF;
            font-family: Plus Jakarta Sans;
            font-size: 1rem;
            font-style: normal;
            font-weight: 700;
            line-height: normal;
            letter-spacing: 0.03875rem;
        }

        .content img {
            width: 70px;
        }

        .head-cat {
            padding-right: 20px;
        }

        .product-container {
            padding-left: 12%;
            padding-right: 12%;
            margin-top: 10px;
            justify-content: space-around;

        }

        .product {
            width: 24%;
            height: 300px;
            background-color: #FFF;
            border-radius: 10px;
        }

        .product-model {
            color: #000;
            margin-top: 10px;
            font-family: Plus Jakarta Sans;
            font-size: 1.0625rem;
            font-style: normal;
            font-weight: 700;
            line-height: 1rem;
            /* 235.294% */
            letter-spacing: 0.06375rem;
            text-align: center;

        }

        .product-purity {
            color: #000;
            text-align: center;
            font-family: Plus Jakarta Sans;
            font-size: 0.9rem;
            font-style: normal;
            font-weight: 200;
            /* line-height: 1.6875rem; */
            /* 158.824% */
            letter-spacing: 0.06375rem;
            margin-bottom: 0px;
            line-height: 1rem;
        }

        .product-price {
            color: #000;

            font-family: Plus Jakarta Sans;
            font-size: 1.0625rem;
            font-style: normal;
            font-weight: 700;
            line-height: 1.0625rem;
            /* 200% */
            letter-spacing: 0.075rem;
            text-align: center;
            margin-top: 15px;
        }

        .gift-card-container {
            padding-left: 12%;
            padding-right: 12%;
        }

        .gift-card {
            width: 100%;
            margin-top: 30px;
            position: relative;
            bottom: 150px;
            border-radius: 15px;
            padding: 20px;

        }

        .gift-card-pack {
            padding-left: 10px;
            padding-right: 10px;
        }



        .square-container {

            padding-left: 10%;
            padding-right: 10%;
        }

        .square {
            border-radius: 5%;
            /* Adjust the width as needed */
            /* Maintain aspect ratio to create a square */
            background-color: #ccc;
            /* Add a background color for visualization */
            display: flex;
            justify-content: center;
        }

        .square .title-cat {
            color: #FFF;
            font-family: Plus Jakarta Sans;
            font-size: 1rem;
            font-style: normal;
            font-weight: 400;
            line-height: normal;
            letter-spacing: 0.03375rem;
        }

        .square div {
            color: #FFF;
            position: absolute;
            bottom: 10px;
            font-family: Plus Jakarta Sans;
            font-size: 1.3125rem;
            font-style: normal;
            font-weight: 400;
        }

        .owl-item {

            text-align: center;
            color: white;
        }

        /* Styles for navigation arrows */
        .owl-prev,
        .owl-next {
            font-size: 24px;
            color: white;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);

        }

        .owl-prev {
            left: 0;

        }

        .owl-next {
            right: 0;

        }

        .left-arr,
        .right-arr {
            font-size: 50px;
            color: white;
        }
    </style>
</head>

<body>
    <div class="header-div">
        <div class="header-links">
            <div class="head-logo">
                <img src="./logo.svg">
            </div>
            <div class="link-container">
                <a class="header-item">Shop</a>
                <a class="header-item">Digi Gold</a>
                <a class="header-item">Gold Schemes</a>
                <a class="header-item">E-Gift Card</a>
                <a class="header-item">Book My Gold</a>
                <a class="header-item">My Transactions</a>
            </div>
            <div class="header-icon-container">
                <img src="../../../resources/static/search(1) 1.svg">
                <img src="../../../resources/static/user 1.svg">
                <img src="../../../resources/static/shopping-cart(1) 1.svg">
            </div>
        </div>


    </div>

    <div class="gold-price-div">
        <p style="color: #FFF;
        font-family: Plus Jakarta Sans;
        font-size: 1.0625rem;
        font-style: normal;
        font-weight: 700;
        line-height: normal;">Gold 22KT 916 ₹ 5820/gm</p>
    </div>


    <div class="square-container">

        <div class="owl-carousel">
            <div class="item">

                <div class="square">
                    <img src="../../resources/static/Gents Ring.png">
                    <div>Gents Ring</div>
                </div>
            </div>
            <div class="item">
                <div class="square" >
                    <img src="../../../resources/static/Earings.png">
                    <div >Earings</div>
                </div>
            </div>
            <div class="item">
                <div class="square">
                    <img src="../../../resources/static/Bracelets.png">
                    <div>Bracelets</div>
                </div>
            </div>
            <div class="item">
                <div class="square">
                    <img src="../resources/static/Pendants.png">
                    <div>Pendants</div>
                </div>
            </div>
            <div class="item">
                <div class="square">
                   
                    <img src="../resources/static/chain.png" alt="Chain Image">
                    
                    <div>Chain</div>
                </div>
            </div>
            
        </div>

    </div>

    <div class="rectangle-container">
        <div class="rectangle">
            <div class="content">
                <div class="head-cat">Digi <br> Gold</div>
                <div><img src="../resources/static/gold-bars 1.svg"></div>
            </div>
        </div>
        <div class="rectangle">
            <div class="content">
                <div class="head-cat">Gold <br> Schemes</div>
                <img src="../resources/static/saving 1.svg">
            </div>
        </div>
        <div class="rectangle">
            <div class="content">
                <div class="head-cat">E-Gift <br> Card</div>
                <img src="../resources/static/gift-card 1.svg">
            </div>
        </div>
        <div class="rectangle">
            <div class="content">
                <div class="head-cat">Book <br>My Gold</div>
                <img src="../resources/static/coin 1.svg" alt="">
            </div>
        </div>
    </div>
    <div style=" width: 100%;background-color: #F6F3EE;padding-top: 150px; padding-bottom: 200px;">
        <p style="color: #D39B29;
        font-family: Plus Jakarta Sans;
        font-size: 1.0625rem;
        font-style: normal;
        font-weight: 400;
        line-height: 2.5rem; /* 235.294% */
        letter-spacing: 0.06375rem;
        text-transform: uppercase; -top: 150px; text-align: center;line-height: 0px;">Our Bestselling</p>
        <p style="color: #000;
        font-family: Playfair Display;
        font-size: 2.1875rem;
        font-style: normal;
        font-weight: 700;
        line-height: 2.5rem; /* 114.286% */;text-align: center;">Our Jewelry Selection</p>
        <div class="d-flex product-container">
            <div class="product">
                <img src="../resource/static/product-14-1 1.svg" width="100%">
                <p class="product-model">GR008</p>
                <p class="product-purity">Metal Purity: 22KT</p>
                <p class="product-purity">Gross Wt.: 3.460</p>
                <p class="product-price">Price: ₹ 18.900</p>

            </div>
            <div class="product">
                <img src="../resource/static/product-14-1 1.svg" width="100%">
                <p class="product-model">GR008</p>
                <p class="product-purity">Metal Purity: 22KT</p>
                <p class="product-purity">Gross Wt.: 3.460</p>
                <p class="product-price">Price: ₹ 18.900</p>

            </div>
            <div class="product">
                <img src="../resource/static/product-14-1 1.svg" width="100%">
                <p class="product-model">GR008</p>
                <p class="product-purity">Metal Purity: 22KT</p>
                <p class="product-purity">Gross Wt.: 3.460</p>
                <p class="product-price">Price: ₹ 18.900</p>

            </div>
            <div class="product">
                <img src="../resource/static/product-14-1 1.svg" width="100%">
                <p class="product-model">GR008</p>
                <p class="product-purity">Metal Purity: 22KT</p>
                <p class="product-purity">Gross Wt.: 3.460</p>
                <p class="product-price">Price: ₹ 18.900</p>

            </div>

        </div>


        <div class="d-flex product-container">
            <div class="product">
                <img src="../resource/static/product-14-1 1.svg" width="100%">
                <p class="product-model">GR008</p>
                <p class="product-purity">Metal Purity: 22KT</p>
                <p class="product-purity">Gross Wt.: 3.460</p>
                <p class="product-price">Price: ₹ 18.900</p>

            </div>
            <div class="product">
                <img src="../resource/static/product-14-1 1.svg" width="100%">
                <p class="product-model">GR008</p>
                <p class="product-purity">Metal Purity: 22KT</p>
                <p class="product-purity">Gross Wt.: 3.460</p>
                <p class="product-price">Price: ₹ 18.900</p>

            </div>
            <div class="product">
                <img src="../resource/static/product-14-1 1.svg" width="100%">
                <p class="product-model">GR008</p>
                <p class="product-purity">Metal Purity: 22KT</p>
                <p class="product-purity">Gross Wt.: 3.460</p>
                <p class="product-price">Price: ₹ 18.900</p>

            </div>
            <div class="product">
                <img src="../resource/static/product-14-1 1.svg" width="100%">
                <p class="product-model">GR008</p>
                <p class="product-purity">Metal Purity: 22KT</p>
                <p class="product-purity">Gross Wt.: 3.460</p>
                <p class="product-price">Price: ₹ 18.900</p>

            </div>

        </div>

    </div>
    <div class="gift-card-container">
        <div class="gift-card">
            <img src="../resource/static/gift-card-image.svg" width="100%">

        </div>
    </div>

    <div
        style="color: #FFF;
    font-family: Plus Jakarta Sans;
    font-size: 1.0625rem;
    font-style: normal;
    font-weight: 700;
    line-height: normal;background-color: #000;display: flex; height: 50px;justify-content: center;align-items: center;padding-left: 12%; padding-right: 12%;">
        <div style="width: 50%;">Copyright © 2023 Kusum Jewelery. All Rights Reserved.</div>
        <div style="width: 50%;text-align: right;">Privacy Policy | Terms Of Services</div>
    </div>


    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

    <script>
        $(document).ready(function () {
            $(".owl-carousel").owlCarousel({
                items: 4, // Set the number of items to display in one slide
                loop: true,
                margin: 10,
                nav: true,
                navText: ["<span class='left-arr'><</span>", "<span class='right-arr'>></span>"]
            });
        });
    </script>
</body>

</html>