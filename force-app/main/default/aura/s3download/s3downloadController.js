({
    doInit: function(cmp) {
        // Set the attribute value.
        // You could also fire an event here instead.
        cmp.set("v.setMeOnInit", "controller init magic!");
        var action = cmp.get("c.getOpportunity");
        action.setParams({
            id: cmp.get("v.recordId")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.opportunity", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    handleClick: function(component, event) {
        var s3bucket = component.get("v.s3bucket");
        var s3key = component.get("v.s3key");
        var myurl = "https://yourname-demo-dev-ed--c.na57.visual.force.com / apex / s3download ? bucket = " + s3bucket + " & key = " + s3key;
        console.log(myurl);
        window.open(myurl, "_blank"); //,"toolbar=yes,top=500,left=500,width=400,height=400");
    }
})