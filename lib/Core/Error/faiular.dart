class Failures
{
String msg;

Failures(this.msg);
@override
  String toString() {

    return msg;
  }
}
class ServerError extends Failures{
  ServerError(super.msg);
}
class LocalError extends Failures
{
  LocalError(super.msg);

}