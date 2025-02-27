class PartnerBusiness {
  PartnerBusiness({
    required this.name,
    required this.uuid,
  });
  final String name;
  final String uuid;
}

final partnerBuisiness = <PartnerBusiness>[
  PartnerBusiness(name: 'Prodrive', uuid: 'PDR'),
  PartnerBusiness(name: 'Paddletek', uuid: 'PTK'),
  PartnerBusiness(name: 'Onix', uuid: 'ONX'),
];
