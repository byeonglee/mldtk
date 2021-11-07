// package org.myorg;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapred.MapReduceBase;
import org.apache.hadoop.mapred.Mapper;
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reducer;
import org.apache.hadoop.mapred.Reporter;
import org.apache.hadoop.mapred.TextInputFormat;
import org.apache.hadoop.mapred.TextOutputFormat;
import org.apache.hadoop.mapred.lib.IdentityReducer;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;


public class WebLog extends Configured implements Tool {

  public static class Map extends MapReduceBase 
    implements Mapper<LongWritable, Text, Text, Text> {

    private final static IntWritable one = new IntWritable(1);
    private Text client = new Text();
    private Text host   = new Text();

    public void map(LongWritable key, Text value, 
                    OutputCollector<Text, Text> output, 
                    Reporter reporter) throws IOException {
      String line = value.toString();
      String[] addresses = line.split("\t");
      host.set(addresses[0]);
      client.set(addresses[1]);

      System.err.println("*RJS* host is " + addresses[0]);
      System.err.println("*RJS* client is " + addresses[1]);

      output.collect(host, client);
    }
  }

  public static class Reduce extends MapReduceBase 
    implements Reducer<Text, Text, Text, Text> {
    private Hashtable<String, Integer> table = new Hashtable<String, Integer>();
    public void reduce(Text key, Iterator<Text> values,
                       OutputCollector<Text, Text> output, 
                       Reporter reporter) throws IOException {

      System.err.println("*RJS* key is " + key);

      while (values.hasNext()) {
        Text val = (Text)values.next();

        System.err.println("*RJS* val is " + val.toString());

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
      output.collect(key, new Text(sb.toString()));
    }
  }

  public int run(String [] args) throws Exception {
    JobConf conf = new JobConf(getConf(), WebLog.class);
    conf.setJobName("weblog");

    conf.setOutputKeyClass(Text.class);
    conf.setOutputValueClass(Text.class);

    FileInputFormat.setInputPaths(conf, new Path(args[0]));
    FileOutputFormat.setOutputPath(conf, new Path(args[1]));

    conf.setMapperClass(Map.class);
    // conf.setCombinerClass(Reduce.class);
    conf.setReducerClass(Reduce.class);

    conf.setInputFormat(TextInputFormat.class);
    conf.setOutputFormat(TextOutputFormat.class);


    try {
        JobClient.runJob(conf);
    } catch (Exception e) {
        System.err.println("Exception caught in run method");
        e.printStackTrace();
    }
    return 0;
  }

  public static void main(String[] args) throws Exception {
    int ret = ToolRunner.run(new Configuration(), new WebLog(), args);
    System.exit(ret);
  }
}
