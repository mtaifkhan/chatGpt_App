import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback? onTap;
  const SearchTextFieldWidget(
      {super.key, required this.textEditingController, this.onTap});

  @override
  Widget build(BuildContext context) {
    return _searchTextField();
  }

  Widget _searchTextField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, right: 4, left: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0.0, 0.50)),
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Container(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 60.0,
                            ),
                            child: Scrollbar(
                                child: TextField(
                              controller: textEditingController,
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                              maxLines: null,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "OpenAI waiting for Your query..."),
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: textEditingController.text == null
                    ? Colors.green.withOpacity(0.4)
                    : Colors.blue,
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
