USE t17;

# OPS-11249:Update isPerishable Flag for HPC
update dp_recurring_details a set a.property_value = 's:5:"false";' where a.property_name='isPerishable' and a.SKU ='C2EF8F9E-D175-1C81-6996-301D2673C7CE';
