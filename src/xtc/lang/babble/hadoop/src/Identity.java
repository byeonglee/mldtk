//package xtc.lang.babble.hadoop;

import java.io.IOException;
import java.util.Hashtable;

import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Cluster;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

public class Identity extends Configured implements Tool {
  public static class MyMap extends Mapper<LongWritable, Text, LongWritable, Text> {
    @Override
    public void map(LongWritable key, Text value, Context context)
        throws IOException, InterruptedException {     
      context.write(key, value);
    }
  }

  public static class MyReduce extends Reducer<LongWritable, Text, LongWritable, LongWritable> {
    @Override
    public void reduce(LongWritable key, Iterable<Text> values, Context context)
        throws IOException, InterruptedException {    
      context.write(key, key); 
    }
  }

  public int run(String[] args) throws Exception {
    int numReduceTasks = 16;	
    int numMapTasks = 16;
    Job job = Job.getInstance(new Cluster(getConf()));
    job.setJarByClass(Identity.class);
    job.setJobName("identity");
    job.setMapperClass(MyMap.class);
    job.setReducerClass(MyReduce.class);

    job.setMapOutputKeyClass(LongWritable.class);
    job.setMapOutputValueClass(Text.class);

    job.setOutputKeyClass(LongWritable.class);
    job.setOutputValueClass(LongWritable.class);

    job.setInputFormatClass(TextInputFormat.class);
    job.setOutputFormatClass(TextOutputFormat.class);
    job.setNumReduceTasks(numReduceTasks);
    FileInputFormat.setInputPaths(job, new Path(args[0]));    
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    boolean success = job.waitForCompletion(true);
    return success ? 0 : 1;
  }

  public static void main(String[] args) throws Exception {
    int ret = ToolRunner.run(new Identity(), args);
    System.exit(ret);
  }
}
