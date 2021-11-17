import 'package:image_picker/image_picker.dart';
import 'package:segment/content/services/service.abstract.dart';

typedef CameraPayload = Function(XFile file);

class CameraService implements Service {
  @override
  void close() {}

  void open(ImageSource source,
      {double? maxHeight, double? maxWidth, CameraPayload? callback}) async {
    final XFile? result = await ImagePicker().pickImage(
      source: source,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      preferredCameraDevice: CameraDevice.front,
    );

    if (result == null) return;
    if (callback != null) callback(result);
  }
}
