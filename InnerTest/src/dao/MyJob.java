package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import dto.MemberDto;

public class MyJob implements Job {
	 private void increasePointsForAllMembers() {
		 Connection conn = Jdbc.connect();
			String sql = "UPDATE member SET point=point+1";
			PreparedStatement pstmt = null;
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					pstmt.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}   
			
	    }
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		MemberDao memberDao = new MemberDao();
		 ArrayList<MemberDto> memberDto = memberDao.selectAll();
		 int cnt = 0;
		 for(MemberDto dto :memberDto ) {
			 cnt++;
		 }
		 // 현재 시간 가져오기
	        Date currentTime = new Date();

	        // 출력 형식 지정
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	        // 현재 시간을 지정된 형식으로 출력
	        String formattedTime = sdf.format(currentTime);
		 System.out.println("Job이 실행됨 : "+formattedTime+" "+cnt+"명에게 포인트 부여(1점)");
		increasePointsForAllMembers();
	}
}





