import 'package:fish_redux/fish_redux.dart';
import 'package:reduxtoflutter/todo_list_page/report_component/component.dart';

import 'effect.dart';
import 'list_adapter/adapter.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ToDoListPage extends Page<PageState, dynamic> {
  ToDoListPage()
      : super(
          reducer: buildReducer(),
          initState: initState,
          effect: buildEffect(),
          view: buildView,
          dependencies: Dependencies<PageState>(
              adapter: ToDoListAdapter(),
              slots: <String, Dependent<PageState>>{
                'report': ReportConnector() + ReportComponent()
              }),
          middleware: <Middleware<PageState>>[
            logMiddleware(tag: 'ToDoListPage'),
          ],
        );
}
