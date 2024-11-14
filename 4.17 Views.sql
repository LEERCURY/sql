-- view를 사용하는 이유 : 가끔 자주 사용하게 될 쿼리가 생기기 때문


select 
title,
case when revenue-budget < 0 then 'flop' else 'not flop' 
end as rev_bud,
count(*)
from movies
where title is not null and revenue is not null and 
budget is not null
group by rev_bud;



-- 이 쿼리를 계속 사용하기 위해, 복붙하기 보다는,
-- view를 사용해서, 쿼리를 패키징할 수 있음.

create view v_flop_or_not2 as   -- view 생성
select 
title,
case when revenue-budget < 0 then 'flop' else 'not flop' 
end as rev_bud,
count(*) as total_movies
from movies
where title is not null and revenue is not null and 
budget is not null
group by rev_bud;




--view로 저장한 "쿼리"가 실행
select * from v_flop_or_not2;
select total_movies from v_flop_or_not2;

-- view 삭제
drop view v_flop_or_not;


-- view 목록 조회 
SELECT sql FROM sqlite_master WHERE type='view';
