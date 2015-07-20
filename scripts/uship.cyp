// This is the Domain Model for uShip Service
// by Qiang Han @ 02/12/2014
// ver 0.1

//uShip Domain Model

//execut the following after uMan, also execute each match statement separately. 

begin

Match (c:_Company)
WHERE c.name='SAP Inc. Canada' 
CREATE 	( cost01:_Department:uShip{ name: 'BI COO Cost Center', id: '01091630411'}),
		( cost02:_Department:uShip { name: 'BI Lumira Cost Center', id: '01091630415'}),
		(c)-[:accounted_by]->(cost01),
		(c)-[:accounted_by]->(cost02);

commit
exit

begin
	
Match (d:_Company)
Where d.name='Telus Inc. Canada'
CREATE	( cost03:_Department:uShip{ name: 'IT Ops', id: '0786'}),
		( cost04:_Department:uShip{ name: 'Customer Support', id: '0897'}),
		(d)-[:accounted_by]->(cost03),
		(d)-[:accounted_by]->(cost04);

commit
exit

begin 
Match (m:_Company)
Where m.name='Machool Technologies Ltd.'
CREATE	( cost05:_Department:uShip{ name: 'CEO Office', id: '001'}),
		(m)-[:accounted_by]->(cost05);
commit
exit


//a ship request example

begin

MATCH (a:_Person), (b:_Person),(dep:_Department)
WHERE a.email='eson.paguia@telus.com' and b.email='kamyar.asadibeiky@Machool.com' and dep.id='0897'
CREATE 
(s01:_Shipment:uShip{id:'001',status:'transit',tracking_pin:'7684673812', return_tracking_pin:'38373983938', po:'', link:[]}),
(p01:_Parcel:uShip {height:23, widgth: 40, dim_unit:'cm', weight:2.4, weight_unit:'pound'}),
(pay01:_Payment:uShip{contract_id:'001', method_of_payment:'credit card', create_time:'2014-1-09T13:00-03:00'}),
(c01:_Cost:uShip{cost:1.5, currency:'CAD'}),
(tc:_ThingCategory:uShip{category:['Document', 'Computer', 'Office Supplies']}),
(n01:_Notification:uShip{id:'001',detail:'Your shipment %tracking_no has been delivered.'}),
(a01: _Address {postcode:'V6b1a9', country:'CA', province:'BC', line1: '990 nelson st.',city:'Vancouver', line2:'', unit:'200'} ),
(s01)-[:sent_by]->(a),
(s01)-[:ship_at]->(t:_Time{timestamp:'2015-01-30T15:00-03:00'}),
(a)-[:accounted_by]->(cost03),
(s01)-[:received_by]->(b),
(s01)-[:ship_to]->(a02:_Address{postcode:'V6b1a9', country:'CA', province:'BC', line1: '910 mainland st.',city:'Vancouver', line2:'', unit:'200'} ),
(s01)-[:contains {thing:'Document'}]->(tc),
(s01)-[:measures]->(p01),
(s01)-[:paid_by]->(pay01),
(s01)-[:cost_at]->(c01),
(s01)-[:tracked_by]->(history:_TrackingHistory:uShip{history:['array of tracking history json']}),
(history)-[:notify]->(n01),
(history)-[:notify_to]->(a),
(history)-[:notify_at]->(t02:_Time{timestamp:'2014-12-01T12:00-04:00'});


//a shipping request example
MATCH (x01:_Person), (x02:_Person),(dep:_Department),(tc:_ThingCategory)
WHERE x01.email='satish.cooper@sap.com' and x02.email='pooyar.Goodguy@Machool.com' and dep.id='01091630415' 
CREATE 
(s02:_Shipment:uShip{id:'002',status:'requested',tracking_pin:'7684673812', return_tracking_pin:'38373983938', po:'', link:[]}),
(p02:_Parcel:uShip {height:23, widgth: 40, dim_unit:'cm', weight:3.4, weight_unit:'pound'}),
(c02:_Cost:uShip{cost:15, currency:'CAD'}),
 (pay02:_Payment:uShip{contract_id:'002', method_of_payment:'credit card', create_time:'2014-1-09T13:00-03:00'}),
 (c03:_Cost:uShip{cost:7.5, currency:'CAD'}),
 (n02:_Notification:uShip{id:'002',detail:'Your shipment %tracking_no has been delivered.'}),
(a03: _Address {postcode:'V6b1a9', country:'CA', province:'BC', line1: '910 mainland st.',city:'Vancouver', line2:'', unit:'200'} ),
(s02)-[:sent_by]->(x01),
(s02)-[:ship_at]->(:_Time{timestamp:'2015-01-30T15:00-03:00'}),
(a)-[:accounted_by]->(dep),
(s02)-[:received_by]->(x02),
(s02)-[:ship_to]->(a04:_Address{postcode:'V6b1a9', country:'CA', province:'BC', line1: '1030 mainland st.',city:'Vancouver', line2:'', unit:'200'} ),
(s02)-[:contains {thing:'Document'}]->(tc),
(s02)-[:measures]->(p02),
(s02)-[:paid_by]->(pay02),
(s02)-[:cost_at]->(c03),
(s02)-[:tracked_by]->(history:_TrackingHistory:uShip{history:['array of tracking history json']}),
(history)-[:notify]->(n02),
(history)-[:notify_to]->(x01),
(history)-[:notify_at]->(:_Time{timestamp:'2014-12-01T12:00-04:00'});

commit
exit

