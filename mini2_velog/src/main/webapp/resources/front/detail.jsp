<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Velog Story</title>

    <!-- 구글폰트 - Montserrat -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Pretendard 폰트 -->
    <link rel="stylesheet" as="style" crossorigin
          href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>

    <!-- 스타일시트 추가 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/BoardDetail.css" />

    <!-- feather icon -->
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
    
<!--     원래 detail.jsp -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/BoardDetail.js?ver=5">
	</script>
	<script type="text/javascript">
	loginId = '${sessionScope.loginId}';
	post_num = "${vo.post_num }";
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/boardedit.js?ver=9">
	</script>
</head>
<body>
<div class="site__container">
    <!-- header영역 -->
    <header class="site__header">
        <div class="nav">
            <h1 class="logo">Velog<span>story</span></h1>
            <ul class="nav-menu">
                <li class="nav-menu__item">
                    <a href="#">home</a>
                </li>
                <li class="nav-menu__item">
                    <a href="#">about</a>
                </li>
                <li class="nav-menu__item">
                    <a href="${pageContext.request.contextPath }/board/list.do">blog</a>
                </li>
                <li class="nav-menu__item contact">
                    <a href="#">contact</a>
                </li>
            </ul>
        </div>
    </header>
    <!-- post 영역 -->
    
    <main class="post">
    <form action="${pageContext.request.contextPath }/board/like.do">
        <div class="container">
            <!-- 헤더영역 -->
            <div class="content">
                <header class="post-header">
<!--                     <span class="post-header__category">diary</span> -->
                    <h2 class="post-header__title">${vo.title }</h2>
                    <ul class="post-header__info">
                        <li class="post-header__date">
                            <i data-feather="calendar"></i>
                            ${vo.w_date }
                        </li>
                        <li class="post-header__author">
                            <i data-feather="user"></i>
                            <a href="${pageContext.request.contextPath }/board/list.do">
                            ${vo.writer }</a>
                        </li>
                    </ul>
                </header>
<!--                 <figure class="featured-image"> -->
<!--                     <img src="./src/featured_image.jpg" alt="blog featured-image"> -->
<!--                 </figure> -->
                <article class="post-content">
                    ${vo.content }
<!--                     해시태그 -->
<!--                     <div class="hashtag"> -->
<!--                         <i data-feather="hash"></i> -->
<!--                         <ul> -->
<!--                             <li class="hashtag__item">#일기</li> -->
<!--                             <li class="hashtag__item">#일상</li> -->
<!--                             <li class="hashtag__item">#이야기</li> -->
<!--                         </ul> -->
<!--                     </div> -->

                    <!-- 글쓴이 -->
                    <div class="author">
                        <div class="author__top">
                            <div class="author__info">
                                <figure class="author__avatar">
                                    <img src="./src/user_01.png" alt="">
                                </figure>
                                <ul>
                                    <li class="author__job">Author</li>
                                    <li class="author__name">${vo.writer }</li>
                                </ul>
                            </div>
<!--                             <ul class="author__sns"> -->
<!--                                 <li class="youtube"><i data-feather="youtube"></i></li> -->
<!--                                 <li class="facebook"><i data-feather="facebook"></i></li> -->
<!--                                 <li class="instagram"><i data-feather="instagram"></i></li> -->
<!--                                 <li class="twitter"><i data-feather="twitter"></i></li> -->
<!--                                 <li class="mail"><i data-feather="mail"></i></li> -->
<!--                             </ul> -->
                        </div>
                        <p class="author__introduce">
                            언덕 시인의 멀듯이, 무엇인지 그러나 오면 하나 버리었습니다. 토끼, 패, 그러나 하나에 소학교 계집애들의 지나고 다 듯합니다. 남은 위에 위에도 청춘이 흙으로
                            멀듯이, 마리아 있습니다. 위에 불러 강아지, 멀리 별을 어머니, 남은 많은 위에도 버리었습니다.
                        </p>
                    </div>

                    <!-- 댓글 -->
                    <div class="comment">
                        <h2 class="comment__title">
                            <i data-feather="message-circle"></i>
                            Comment
                        </h2>
<!--                         댓글하나 -->
                        <div class="comment__item">
<!--                         댓글작성자 -->
                            <div class="user">
                                <div class="user__top">
                                    <figure class="user__avatar">
                                        <img src="./src/comment_user_01.png" alt="">
                                    </figure>
                                    <ul>
                                        <li class="user__job"></li>
                                        <li class="user__name">Guest#1</li>
                                    </ul>
                                </div>
<!--                                 댓글 내용 -->
                                <div class="user__comment">
                                    언덕 시인의 멀듯이, 무엇인지 그러나 오면 하나 버리었습니다. 토끼, 패, 그러나 하나에 소학교 계집애들의 지나고 다 듯합니다. 남은 위에 위에도
                                    청춘이 흙으로 멀듯이, 마리아 있습니다. 위에 불러 강아지, 멀리 별을 어머니, 남은 많은 위에도 버리었습니다.
                                </div>
                            </div>
                        </div>
<!--                    대댓글 -->
<!--                         <div class="comment__item"> -->
<!--                             <i data-feather="corner-down-right"></i> -->
<!--                             <div class="user"> -->
<!--                                 <div class="user__top"> -->
<!--                                     <figure class="user__avatar"> -->
<!--                                         <img src="./src/comment_user_02.png" alt=""> -->
<!--                                     </figure> -->
<!--                                     <ul> -->
<!--                                         <li class="user__job">author</li> -->
<!--                                         <li class="user__name">BlogStory</li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                                 <div class="user__comment"> -->
<!--                                     많은 나의 된 이름과, 계십니다. 아직 써 하나의 계십니다. -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="comment__item"> -->
<!--                             <i data-feather="corner-down-right"></i> -->
<!--                             <div class="user"> -->
<!--                                 <div class="user__top"> -->
<!--                                     <figure class="user__avatar"> -->
<!--                                         <img src="./src/comment_user_03.png" alt=""> -->
<!--                                     </figure> -->
<!--                                     <ul> -->
<!--                                         <li class="user__job"></li> -->
<!--                                         <li class="user__name">Guest#1</li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                                 <div class="user__comment"> -->
<!--                                     남은 동경과 어머니, 속의 둘 별빛이 강아지, 아스라히 하나에 듯합니다. 다하지 보고, 멀듯이, 까닭입니다. 하늘에는 까닭이요 -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                    </div>

                    <!-- 추천글 -->
<!--                     <div class="recommended"> -->
<!--                         <h2 class="recommended__title"> -->
<!--                             <i data-feather="file-text"></i> -->
<!--                             Recommended -->
<!--                         </h2> -->
<!--                         <div class="post__container"> -->
<!--                             <div class="post"> -->
<!--                                 <figure class="post__image"> -->
<!--                                     <img src="./src/image_01.jpg" alt=""> -->
<!--                                 </figure> -->
<!--                                 <div class="post__category"> -->
<!--                                     diary -->
<!--                                 </div> -->
<!--                                 <h2 class="post__title"> -->
<!--                                     많은 하나에 별이 나는 오면 별 흙으로 남은 까닭입니다. -->
<!--                                 </h2> -->
<!--                             </div> -->
<!--                             <div class="post"> -->
<!--                                 <figure class="post__image"> -->
<!--                                     <img src="./src/image_02.jpg" alt=""> -->
<!--                                 </figure> -->
<!--                                 <div class="post__category"> -->
<!--                                     diary -->
<!--                                 </div> -->
<!--                                 <h2 class="post__title"> -->
<!--                                     별들을 까닭이요, 어머님, 이국 까닭입니다. -->
<!--                                 </h2> -->
<!--                             </div> -->
<!--                             <div class="post"> -->
<!--                                 <figure class="post__image"> -->
<!--                                     <img src="./src/image_03.jpg" alt=""> -->
<!--                                 </figure> -->
<!--                                 <div class="post__category"> -->
<!--                                     diary -->
<!--                                 </div> -->
<!--                                 <h2 class="post__title"> -->
<!--                                     언덕 시인의 멀듯이, 무엇인지 그러나 오면 하나 버리었습니다. -->
<!--                                 </h2> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                </article>
            </div>
            <aside class="floating left">
                <div class="buttons">
                    <button class="button">
                        <i data-feather="message-circle"></i>
<!--                         댓글 -->
                        댓글숫자태그
                    </button>
                    <button class="button">
                        <i data-feather="heart"></i>
<!--                         좋아요 -->
                        ${vo.likes }
                    </button>
<!--                     <button class="button"> -->
<!-- <!--                     공유 버튼 --> -->
<!--                         <i data-feather="share-2"></i> -->
<!--                     </button> -->
                </div>
            </aside>
            <button class="floating right">
                <i data-feather="arrow-up"></i>
            </button>
        </div>
     </form>
    </main>

    <footer class="footer">
        <p class="site__information">
            ⓒ2022 BlogStory - All right Reserved.
        </p>
    </footer>
</div>
<!-- feather icon -->
<script>
    feather.replace()
</script>
</body>
</html>