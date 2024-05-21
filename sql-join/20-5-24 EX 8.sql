use telecom;

SELECT et.id, location, fault_severity, event_type, severity_type, resource_type, log_feature, volume
	FROM event_type et
	left join log_feature lf on et.level_0=lf.level_0
	left join resource_type rt on rt.level_0=lf.level_0
	left join severity_type st on st.level_0=lf.level_0
	left join train t on t.level_0=lf.level_0;