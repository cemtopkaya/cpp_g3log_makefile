#include <iostream>
#include <g3log/g3log.hpp> 
#include <g3log/logworker.hpp>

using namespace std;

int main(){
	using namespace g3;
   	auto worker = LogWorker::createLogWorker();
	auto defaultHandler = worker->addDefaultLogger("etiketi", "./log.txt");  // logger başlatıldı
	g3::initializeLogging(worker.get());

	LOG(INFO) << "streaming API is as easy as ABC or " << 123;
	g3::internal::shutDownLogging();

	cout << "merhaba dunya" << endl;
	return 0;
}
