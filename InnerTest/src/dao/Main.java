package dao;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class Main {
	private static Scheduler sched;
	
	public static void main() {
		 try {
	            // 스케줄러 생성
	            SchedulerFactory sf = new StdSchedulerFactory();
	            sched = sf.getScheduler();

	            // JobDetail 생성
	            JobDetail job = JobBuilder.newJob(MyJob.class)
	                    .withIdentity("myjob", "group1")
	                    .build();

	            // Trigger 생성
	            Trigger trigger = TriggerBuilder.newTrigger()
	                    .withIdentity("myTrigger", "group1")
	                    .startNow()
	                    .withSchedule(SimpleScheduleBuilder.simpleSchedule()
	                            .withIntervalInSeconds(20) 
	                            .repeatForever()) // 무한 반복
	                    .build();

	            // 스케줄러에 JobDetail과 Trigger 등록
	            sched.scheduleJob(job, trigger);
	       		System.out.println("<<< 포인트 스케줄러가 시작되었습니다. >>>");
	            // 스케줄러 시작
	            sched.start();
	            // 1초 대기
	            Thread.sleep(1000);
	        } catch (SchedulerException | InterruptedException e) {
	            e.printStackTrace();
	        }
	}
	public static void main2() {
		try {
			sched.shutdown();
			System.out.println("<<< 포인트 스케줄러의 실행이 종료되었습니다. >>>");
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}

}
