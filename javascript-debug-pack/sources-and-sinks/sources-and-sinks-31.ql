/**
 * @name Sources and Sinks 31
 * @kind problem
 * @problem.severity recommendation
 * @id js/sources-and-sinks-31
 */
import semmle.javascript.security.dataflow.HardcodedDataInterpretedAsCode::HardcodedDataInterpretedAsCode as CONFIG
from TaintTracking::Configuration c, DataFlow::Node n, string type
where c.isSource(n) and type = "Source" or c.isSink(n) and type = "Sink"
select n, c + type