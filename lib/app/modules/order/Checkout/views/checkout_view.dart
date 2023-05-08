import 'package:fastrent/app/data/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/checkout_controller.dart';
import '../views/form_widget.dart';
import '../views/payment_method_widget.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Rcolors.onPrimary,
      appBar: AppBar(
        backgroundColor: Rcolors.primaryVariant,
        title: const Text('CheckoutView'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Rcolors.primaryVariant,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 15,
                ),
                child: Wrap(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'tap to see rental details',
                            style:
                                TextStyle(fontSize: 10, color: Rcolors.surface),
                          )),
                    ),
                    Card(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 15, left: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.car_rental,
                                          size: 17,
                                          color: Color(0xff338A94),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Sat,6 may - thu, 18 may',
                                          style: TextStyle(
                                              color: Rcolors.onSurface
                                                  .withOpacity(0.7),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Daihatsu xenia',
                                      style: TextStyle(
                                          color: Rcolors.onSurface
                                              .withOpacity(0.8),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                    Text(
                                      'By Fastrent bandung',
                                      style: TextStyle(
                                        color:
                                            Rcolors.onSurface.withOpacity(0.5),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Rental Duration : 13 days * Pickup at 15:30',
                                      style: TextStyle(
                                          color: Rcolors.onSurface
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    color: Rcolors.background,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(4.0),
                                        bottomRight: Radius.circular(4.0))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, bottom: 10, top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.error,
                                            size: 20,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Non- Refundable',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 139, 138, 138),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.error,
                                            size: 20,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Reschedule Not Available',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 139, 138, 138),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Rcolors.background,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 10.0, bottom: 10.0),
                      child: Wrap(
                        children: [
                          const Text(
                            "Contact Details (for E-ticket/Voucher)",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          Text(
                            "We will send all e-tickets/vouchers from this booking to this contact",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Rcolors.onSurface.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Card(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 15.0, bottom: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => Text(
                                        controller.fullName.value,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Obx(
                                          () => Text(controller.email.value,
                                              style: TextStyle(
                                                  color: Rcolors.onSurface
                                                      .withOpacity(0.5))),
                                        ),
                                        Text(
                                          ' • ',
                                          style: TextStyle(
                                              color: Rcolors.onSurface
                                                  .withOpacity(0.5)),
                                        ),
                                        Obx(
                                          () => Text(
                                              "+62 ${controller.phone.value}",
                                              style: TextStyle(
                                                  color: Rcolors.onSurface
                                                      .withOpacity(0.5))),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Rcolors.background.withOpacity(0.4),
                                  ),
                                  child: Obx(
                                    () => Column(
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 'me',
                                              groupValue: controller
                                                  .selectedGender.value,
                                              onChanged: (value) => controller
                                                  .updateSelectedGender(value!),
                                            ),
                                            const Text(
                                                "I'm Booking for myself"),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 'female',
                                              groupValue: controller
                                                  .selectedGender.value,
                                              onChanged: (value) {
                                                MyDialog().openFullScreenDialog(
                                                    value);
                                              },
                                            ),
                                            const Text(
                                                "I'm Booking for someone else"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Wrap(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 15.0),
                            child: Text(
                              "Metode Pembayaran",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0,
                                          right: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Wrap(
                                        children: [
                                          for (int i = 0;
                                              i <
                                                  controller
                                                      .paymentMethod.length;
                                              i++)
                                            Wrap(
                                              children: [
                                                PaymentMethod(
                                                  IconUrl: controller
                                                          .paymentMethod[i]
                                                      ['icon_url'],
                                                  Title: controller
                                                      .paymentMethod[i]['name'],
                                                  value: controller
                                                      .paymentMethod[i]['code'],
                                                  GroupValue: controller
                                                      .selectedPayment.value,
                                                  onChanged: (value) =>
                                                      controller
                                                          .updateSelectedPayment(
                                                              value!),
                                                ),
                                                if (i !=
                                                    controller.paymentMethod
                                                            .length -
                                                        1)
                                                  const Divider(),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 25, bottom: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Rcolors.primaryVariant,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextButton(
                          onPressed: () async {
                            controller.sentData();
                          },
                          child: const Text(
                            'Continue',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
