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

public class WebLog extends Configured implements Tool {
  public static class Map extends Mapper<LongWritable, Text, Text, Text> {
    private Text client = new Text();
    private Text host = new Text();

    @Override
    public void map(LongWritable key, Text value, Context context)
        throws IOException, InterruptedException {
      String line = value.toString();
      String[] addresses = line.split("\t");
      host.set(addresses[0]);
      client.set(addresses[1]);
      context.write(host, client);
    }
  }

  public static class Reduce extends Reducer<Text, Text, Text, Text> {
    private Hashtable<String, Integer> table = new Hashtable<String, Integer>();

    @Override
    public void reduce(Text key, Iterable<Text> values, Context context)
        throws IOException, InterruptedException {
      for (Text val : values) {
        if (!table.containsKey(val.toString())) {
          table.put(val.toString(), 1);
        } else {
          table.put(val.toString(), table.get(val.toString()) + 1);
        }
      }
      StringBuilder sb = new StringBuilder();
      int i = 0;
      for (String client : table.keySet()) {
        if (i > 0) {
          sb.append(", ");
        }
        sb.append(client);
        sb.append(":");
        sb.append(table.get(client));
        i++;
      }
      table.clear();
      context.write(key, new Text(sb.toString()));
    }
  }

  public int run(String[] args) throws Exception {
    int numReduceTasks = 16;	
    int numMapTasks = 16;
    Job job = Job.getInstance(new Cluster(getConf()));
    job.setJarByClass(WebLog.class);
    job.setJobName("weblog");

    //job.setOutputKeyClass(Text.class);
    //job.setOutputValueClass(Text.class);

    job.setMapperClass(Map.class);
    // job.setCombinerClass(Reduce.class);
    job.setReducerClass(Reduce.class);
    job.setInputFormatClass(TextInputFormat.class);
    job.setOutputFormatClass(TextOutputFormat.class);
    job.setNumReduceTasks(numReduceTasks);
    FileInputFormat.setInputPaths(job, new Path(args[0]));
    FileInputFormat.setMinInputSplitSize(job, numMapTasks); /* Does this change the num mappers? */
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    boolean success = job.waitForCompletion(true);
    return success ? 0 : 1;
  }

  public static void main(String[] args) throws Exception {
    int ret = ToolRunner.run(new WebLog(), args);
    System.exit(ret);
  }
}
