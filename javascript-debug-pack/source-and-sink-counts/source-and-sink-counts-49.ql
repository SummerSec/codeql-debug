/**
 * @name Source and Sink Counts 49
 * @kind metric
 * @metricType sum
 * @problem.severity recommendation
 * @id js/source-and-sink-counts-49
 */
import javascript
import semmle.javascript.security.dataflow.RequestForgery::RequestForgery as CONFIG
from TaintTracking::Configuration c, string type, int amount
where amount = count(DataFlow::Node n | c.isSource(n)) and type = "Source"
   or amount = count(DataFlow::Node n | c.isSink(n)) and type = "Sink"
select c + type, amount
