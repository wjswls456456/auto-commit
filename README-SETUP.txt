자동 커밋 설정 방법
==================

GitHub Actions 사용 (권장) ⭐
-----------------------------
1. 이 저장소를 GitHub에 푸시
2. .github/workflows/daily-commit.yml 파일이 자동으로 인식됨
3. 매일 오후 3시(한국시간)에 자동 실행
4. 수동 실행: GitHub 저장소 -> Actions 탭 -> "Daily Auto Commit" -> "Run workflow"

주의사항:
- GitHub Actions는 public 저장소에서 무료
- Private 저장소는 월 사용 시간 제한 있음
- 실행 시간 변경: .github/workflows/daily-commit.yml 파일의 cron 값 수정
  예: '0 0 * * *' = 매일 오전 9시(한국시간)


로컬 Windows 스케줄러 사용 (대안)
----------------------------------
1. Node.js 설치 확인: node --version
2. setup-scheduler.bat 우클릭 -> "관리자 권한으로 실행"
3. 매일 오후 11시에 실행
4. 수동 테스트: node auto-commit.js
5. 제거: schtasks /Delete /TN "DailyAutoCommit" /F
