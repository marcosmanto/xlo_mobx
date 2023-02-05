import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/option_toggle.dart';
import 'package:xlo_mobx/screens/filter/components/section_title.dart';
import 'package:xlo_mobx/stores/filter_store.dart';

class VendorTypeField extends StatelessWidget {
  const VendorTypeField({
    super.key,
    required this.store,
    this.enabled = true,
  });

  final FilterStore store;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: 'Tipo de anunciante',
          enabled: enabled,
        ),
        Observer(
          builder: (_) {
            return Wrap(
              runSpacing: 5,
              spacing: 12,
              children: [
                // * display vendor types toggle states binary
                //Text(store.vendorType.toRadixString(2)),
                OptionToggle(
                  title: 'Particular',
                  onTap: enabled
                      ? () {
                          if (store.isTypeParticular) {
                            if (store.isTypeProfessional) {
                              store.resetVendorType(vendorTypeParticular);
                            } else {
                              // * select binary operation turns off all other
                              // * toggles states an keeps only the selected state
                              store.selectVendorType(vendorTypeProfessional);
                            }
                          } else {
                            store.setVendorType(vendorTypeParticular);
                          }
                        }
                      : null,
                  activeCondition: store.isTypeParticular,
                  enabled: enabled,
                ),
                OptionToggle(
                  title: 'Profissional',
                  onTap: enabled
                      ? () {
                          if (store.isTypeProfessional) {
                            if (!store.isTypeParticular) {
                              store.setVendorType(vendorTypeParticular);
                            }
                            store.resetVendorType(vendorTypeProfessional);
                          } else {
                            store.setVendorType(vendorTypeProfessional);
                          }
                        }
                      : null,
                  activeCondition: store.isTypeProfessional,
                  enabled: enabled,
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
