module.exports = function(results, context) {
  let lints = results || [];

  let summary = lints.reduce(
    (seq, current) => {
      const path = current.filePath.startsWith(context.cwd + "/") ? current.filePath.slice(context.cwd.length + 1) : current.filePath;
      current.messages.forEach((msg) => {
        const logMessage = {
          filePath: path,
          ruleId: msg.ruleId,
          ruleUrl: context.rulesMeta[msg.ruleId].docs.url,
          message: msg.message,
          line: msg.line,
          column: msg.column,
        };

        if (msg.severity === 1) {
          logMessage.type = "Warning";
          seq.warnings.push(logMessage);
        }

        if (msg.severity === 2) {
          logMessage.type = "Error";
          seq.errors.push(logMessage);
        }
      });

      return seq;
    },
    {
      errors: [],
      warnings: [],
    },
  );

  if (summary.errors.length > 0 || summary.warnings.length > 0) {
    let lines = summary.errors
      .concat(summary.warnings)
      .map((msg) => {
        return (
          "\033[35m" + msg.filePath +
          "\033[0m" + ":" +
          "\033[32m" + msg.line +
          "\033[0m" + ":" +
          "\033[32m" + msg.column +
          "\033[0m" + ":" +
          (msg.type === "Error" ? "\033[31m" : "\033[33m") + msg.type +
          "\033[0m" + " " +
          msg.ruleId + (msg.ruleUrl ? " (" + msg.ruleUrl + ")" : "")
        );
      })
      .join("\n");

    return lines;
  }
}
