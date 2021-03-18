/**
 * @name Sources and Sinks
 * @description Prints sources and sinks of various DataFlow and TaintTracking Configurations
 * @kind problem
 * @problem.severity recommendation
 * @id js/zipslip-sources-and-sinks
 */


import javascript
import semmle.javascript.security.dataflow.ZipSlip::ZipSlip

from DataFlow::Node n, string type
where 
exists(
  Configuration c, string qid |
  qid = "js/zipslip: " and (
    c.isSource(n) and type = qid + c + "Source" or
    c.isSink(n) and type = qid + c + "Sink"
  )
)
select n, type