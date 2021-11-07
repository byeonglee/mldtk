#include "CQLOperators.h"

/*
 * - Partitioned row-based window operator:
 *  - state variable keeps map from partitioning key attributes
 *    to rest of tuples
 *  - for each input insert, add to front of appropriate sub-window, create
 *    output insert for the new tuple
 *  - the sub-windows can be fixed-size circular buffers, oldest is deleted
 *    and sent as output delete
 *  - remove insert/delete pairs that cancel each other out
 * @param inBuf
 * @param port
 * @param inVar
 * @return buffer
 */
BabbleReturn*
slidingRowBasedOp(BabbleBuffer inBuf, BabbleUInt32 port, void*){
  //   /* MH:
  //      e.g., if FullSchema == tuple<int32,int32,string8,float32>, and key is 0, then KeyAttrType is int32
  //      type of state variable = map<KeyAttrType, queue<FullSchema>>
  //      assert(empty input deletes);
  //      for each (tuple in input inserts) {
  //        key = retrieve the key attribute
  //        if key in var:
  //          partition = var[key]
  //        else
  //          partition = empty list
  //        if partition.size >= WINDOW_SIZE:
  //          outputDeletes.add(partition.pop()) //pop from other end deletes oldest
  //        curr.append(timestamp, tuple)
  //        outputInserts.add(tuple)
  //        var[key] = partition
  //      }
  //      remove canceled pairs from output inserts/deletes (maybe, keep them sorted to speed this up?)
  //    */
  return NULL;
}


