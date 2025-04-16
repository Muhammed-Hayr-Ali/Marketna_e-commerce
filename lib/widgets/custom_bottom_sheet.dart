import 'package:application/utils/import.dart';

custombottomSheet<T>({required List<Widget> children, String? title}) {
  return Get.bottomSheet(
    elevation: 0,
    Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            child:
                title != null
                    ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              CustomText(
                                title,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              Spacer(),
                              CustomCicularButton(
                                color: Colors.grey.shade200,
                                onTap: Get.back,
                                child: Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.grey.shade200),
                      ],
                    )
                    : null,
          ),

          ...children,
        ],
      ),
    ),
    barrierColor: Colors.black26,
  );
}
