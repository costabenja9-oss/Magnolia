/**
 * Form processor that creates new contact in contacts workspace.
 * @constructor
 */
var Processor = function () {
    var PropertyUtil = Java.type("info.magnolia.jcr.util.PropertyUtil");
    this.process = function (content, parameters) {
        var purpose = PropertyUtil.getString(content, "purpose");
        var inputs = PropertyUtil.getString(content, "inputs");
        if (purpose != null) {
            this._saveLead(purpose, parameters, inputs)
        } else {
            print('WARN Lead not stored as \"purpose\" of the lead is null')
        }
    }
    this._buildNodeName = function(purpose, leadName) {
        return purpose + "-" + leadName.replace(/ /g,"")
    }
    this._saveLead = function(purpose, values, inputs) {
        try {
            var leadName = values.name
            var lead = ctx.getJCRSession("bfy-leads").getRootNode().addNode(this._buildNodeName(purpose, leadName), "bfy:lead");
            var inputNames = inputs.split(",")
            lead.setProperty("purpose", purpose);
            for (var i=0; i< inputNames.length; i++) {
                var inputName = inputNames[i]
                lead.setProperty(inputName, values[inputName] || "");
            }
            
            lead.getSession().save();

        } catch(e) {
            print('ERROR when processing lead from "' + purpose + '"', e)
            return false
        }
    }
}

new Processor()