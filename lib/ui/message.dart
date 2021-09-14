import 'package:amquick/all_export.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("Thông báo"),
            ),
            _buildListViewGroupTask(),
          ],
        ),
      ),
    );
  }

  Widget _buildListViewGroupTask() {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        shrinkWrap: false,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Material(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () async {
                          // await Get.toNamed("/task/group/add_group");
                        },
                        icon: Icon(Icons.edit),
                        tooltip: "Chỉnh sửa",
                      ), // icon-1
                      IconButton(
                        onPressed: () {
                          // taskController.taskGroup =
                          //     taskController.listTaskGroup[index];
                          // taskController.deleteGroup();
                        },
                        icon: Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.red,
                        ),
                        tooltip: "Xóa",
                      ), // icon-2
                    ],
                  ),
                  title: Text(
                    " taskController.listTaskGroup[index].name",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  subtitle: Text(
                    "ddd",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  onTap: () => {
                    // taskController.taskGroup =
                    //     taskController.listTaskGroup[index],
                    // Get.toNamed("/task/task_add"),
                  },
                ),
                Divider(
                  thickness: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
