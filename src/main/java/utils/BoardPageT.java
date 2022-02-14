package utils;

public class BoardPageT {
    public static String pagingStr(int totalCount, int pageSize, int blockPage,
            int pageNum, String reqUrl, String flag) {
        String pagingStr = "";
        // 단계 3 : 전체 페이지 수 계산
        int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));

        // 단계 4 : '이전 페이지 블록 바로가기' 출력
        int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
        pagingStr += "<ul class='pagination justify-content-center'>";
        if (pageTemp != 1) {
        	
        	pagingStr += "<li class='page-item'><a class='page-link' href='" + reqUrl + "?flag="+ flag +"&pageNum=1'><i class='bi bi-skip-backward-fill'></i></a></li>";
            //pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";  
            
            //pagingStr += "&nbsp;";
            
            pagingStr += "<li class='page-item'><a class='page-link' href='"+ reqUrl + "?flag="+ flag +"&pageNum="+ (pageTemp - 1) +"'><i class='bi bi-skip-start-fill'></i></a></li>";            
            //pagingStr += "<a href='"+ reqUrl +"?pageNum="+ (pageTemp - 1) +"'>[이전 블록]</a>";
        }
        else if (pageTemp == 1) {
        	
        	pagingStr += "<li class='page-item disabled'><a class='page-link' href='" + reqUrl + "?flag="+ flag +"&pageNum=1'><i class='bi bi-skip-backward-fill'></i></a></li>";
        	//pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";  
        	
        	//pagingStr += "&nbsp;";
        	
        	pagingStr += "<li class='page-item disabled'><a class='page-link' href='"+ reqUrl + "?flag="+ flag +"&pageNum="+ (pageTemp - 1) +"'><i class='bi bi-skip-start-fill'></i></a></li>";            
        	//pagingStr += "<a href='"+ reqUrl +"?pageNum="+ (pageTemp - 1) +"'>[이전 블록]</a>";
        }

        // 단계 5 : 각 페이지 번호 출력
        int blockCount = 1;
        while (blockCount <= blockPage && pageTemp <= totalPages) {
        	
            if (pageTemp == pageNum) {
                // 현재 페이지는 링크를 걸지 않음
                //pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
                pagingStr += "<li class='page-item active'><a class='page-link' href='#'>" + pageTemp + "</a></li>";
            } else {
               // pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
                pagingStr += "<li class='page-item'><a class='page-link' href='" + reqUrl + "?flag="+ flag +"&pageNum=" + pageTemp + "'>" + pageTemp + "</a></li>";
            }
            pageTemp++;
            blockCount++;
        }

        // 단계 6 : '다음 페이지 블록 바로가기' 출력
        if (pageTemp <= totalPages) {
        	
        	pagingStr += "<li class='page-item'><a class='page-link' href='" + reqUrl + "?flag="+ flag +"&pageNum=" + pageTemp + "'><i class='bi bi-skip-end-fill'></i></a></li>";        	
            //pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>[다음 블록]</a>";
            
            //pagingStr += "&nbsp;";
            
            pagingStr += "<li class='page-item'><a class='page-link' href='" + reqUrl + "?flag="+ flag +"&pageNum=" + totalPages + "'><i class='bi bi-skip-forward-fill'></i></a></li>";            
            //pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages + "'>[마지막 페이지]</a>";
        }
        else if (pageTemp >= totalPages) {
        	
        	pagingStr += "<li class='page-item disabled'><a class='page-link' href='" + reqUrl + "?flag="+ flag +"&pageNum=" + pageTemp + "'><i class='bi bi-skip-end-fill'></i></a></li>";        	
        	//pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>[다음 블록]</a>";
        	
        	//pagingStr += "&nbsp;";
        	
        	pagingStr += "<li class='page-item disabled'><a class='page-link' href='" + reqUrl + "?flag="+ flag +"&pageNum=" + totalPages + "'><i class='bi bi-skip-forward-fill'></i></a></li>";            
        	//pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages + "'>[마지막 페이지]</a>";
        }
        
        
        pagingStr += "</ul>";

        return pagingStr;
    }
}
