$(function(){
    $.ajax({
        url: "/loadLastAuction.kh",
        success : function(data){
            for(let i=0;i<data.length;i++){
                const div = $("<div class='last-content'>");

                const lastInfo = $("<div class='last-info'>");
                const imgDiv = $("<div class='lastAuc-pic'>");


                const img = $("<img>");
                img.prop("src","/resources/upload/auction/"+data[i].auctionPic);
                $(imgDiv).append(img);
                $(div).append(imgDiv);
                $(div).append(lastInfo);

                // 링크
                const link = $("<a>");
                link.prop("href","/auctionView.kh?projectNo="+data[i].projectNo);
                $(link).append(div);

                // 이름
                const title = $("<h4>");
                title.text(data[i].projectName);
                $(lastInfo).append(title);
                
                // 카테고리
                const ctgr = $("<span class='badge'>");
                const index = data[i].auctionCategory;
                if(index==1){
                    ctgr.text("유기동물 구조");
                }else if(index==2){
                    ctgr.text("미혼모 지원");
                }else if(index==3){
                    ctgr.text("장애인 지원");
                }else if(index==4){
                    ctgr.text("소년가장 후원");
                }else{
                    ctgr.text("산불재난돕기");
                }
                
                // 물품명
                const item = $("<h5>");
                item.text(data[i].auctionItem);
                $(item).append(ctgr);
                $(lastInfo).append(item);

                // 잔여시간
                const lastDay = data[i].lastDay;
                const lastHour = data[i].lastHour;
                const lastMin  = data[i].lastMin;

                let time = '';
                if(lastDay>0){
                    time = lastDay+"일 ";
                }
                if(lastHour>0){
                    time = time+lastHour+"시간 ";
                }
                if(lastMin>0){
                    time = time+lastMin+"분 ";
                }
                time = time+"뒤 마감";

                const lastTime = $("<h4 style='text-align:right'>");
                lastTime.text(time);
                $(lastInfo).append(lastTime);

                $(".last-auction").append(link);
            }
        }
    })
    $.ajax({
        url: "/loadNewAuction.kh",
        success : function(data){
            
            // 이미지
            const img = $("<img>");
            img.prop("src","/resources/upload/auction/"+data.auctionPic);
            $(".newAuc-pic").append(img);

            // 링크
            $(".new-auction>a").prop("href","/auctionView.kh?projectNo="+data.projectNo);

            // 이름
            const title = $("<h2>");
            title.text(data.projectName);
            $(".newAuc-info").append(title);
            
            // 카테고리
            const ctgr = $("<span class='badge'>");
            const index = data.auctionCategory;
            if(index==1){
                ctgr.text("유기동물 구조");
            }else if(index==2){
                ctgr.text("미혼모 지원");
            }else if(index==3){
                ctgr.text("장애인 지원");
            }else if(index==4){
                ctgr.text("소년가장 후원");
            }else{
                ctgr.text("산불재난돕기");
            }
            
            // 물품명
            const item = $("<h4>");
            item.text(data.auctionItem);
            $(item).append(ctgr);
            $(".newAuc-info").append(item);

            // 입찰횟수
            const bidCount =$("<span>");
            bidCount.text("입찰 "+data.bidCount+"회");
            $(".newAuc-info").append(bidCount);

            // 현재가격
            const bestPrice = $("<h2 style='text-align:right'>");
            bestPrice.text("현재가격 "+data.bestPrice+"원");
            $(".newAuc-info").append(bestPrice);
        }
    })
})