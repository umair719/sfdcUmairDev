trigger ContactOwnerChangeTrigger on Contact (after update) {
	ProgramFlowExperiment pf = new ProgramFlowExperiment();
    pf.HandleContactUpdateTrigger(trigger.new, trigger.oldMap);
}