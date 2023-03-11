import 'package:callout/di/di_container.dart';
import 'package:callout/feature/screen/main/login/email_login_viewmodel.dart';
import 'package:callout/utils/colors.dart';
import 'package:callout/utils/dev_log.dart';
import 'package:callout/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailLoginPage extends ConsumerStatefulWidget {
  const EmailLoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => EmailLoginState();
}

class EmailLoginState extends ConsumerState<EmailLoginPage> {

  var loginViewModel = it<EmailLoginViewModel>();

  @override
  void initState() {
    Log.i("EmailLoginPage initState");
    loginViewModel.viewState.stream.listen((event) {
      switch(event){
        case LoginViewState.START:
          break;
        case LoginViewState.LOGIN_COMPLETED:
          break;
        case LoginViewState.LOGIN_ERROR:
          break;
        case LoginViewState.LOGIN_FAILED:
          break;
      }
    });
    loginViewModel.loadState(LoginViewState.START);
    super.initState();
  }

  @override
  void dispose() {
    Log.i("EmailLoginPage dispose");
    loginViewModel.disposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '이메일 로그인',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ).marginOnly(bottom: 8),
            const Text(
              '로그인하고 더 다양한 서비스를\n즐겨보세요 :) ',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.blueyGrey,
                fontWeight: FontWeight.w300,
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: const InputDecorationTheme(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: AppColors.cloudyBlue,
                    fontWeight: FontWeight.w300,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.cloudyBlue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.cloudyBlue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black),
                  ),
                  filled: true,
                  fillColor: Colors.white
                ),
              ),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      onChanged: loginViewModel.onChangedId,
                      style: const TextStyle(fontSize: 14, color: AppColors.black),
                      decoration: const InputDecoration(
                        hintText: '이메일 주소를 입력해주세요.',
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          color: AppColors.cloudyBlue,
                          size: 20,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ).marginOnly(bottom: 8),
                    TextFormField(
                      onChanged: loginViewModel.onChangedPw,
                      obscureText: true,
                      style:
                      const TextStyle(fontSize: 14, color: AppColors.black),
                      decoration: const InputDecoration(
                        hintText: '비밀번호를 입력해주세요.',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppColors.cloudyBlue,
                          size: 20,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ).marginOnly(bottom: 16),
                  ],
                ),
              ),
            )

          ],
        ).paddingOnly(left: 20, right: 20, bottom: 20),
      ),
      bottomNavigationBar: SizedBox(
        width: getScreenWidth(context),
        height: 150.h,
        child: Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(getScreenWidth(context), 46.w),
                backgroundColor: AppColors.aquaMarine,
                primary: Colors.white,
              ),
             onPressed: () async {
                
             }, child: Text("로그인"),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children:[
                //비밀번호 재설정
                Container(
                  alignment:Alignment.center,
                  padding:const EdgeInsets.fromLTRB(0,0,15,0),
                  child:MaterialButton(
                    onPressed: (){

                    },
                    colorBrightness: Brightness.dark,
                    textColor: const Color(0xFF858E96),
                    elevation: 10.0,
                    highlightElevation: 1.0,
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xFF858e96), width: 1)
                          )
                      ),
                      child: const Text('계정 찾기',style: TextStyle(fontSize: 14, color: Color(0xFF858E96)),
                      ),
                    ),
                  ),
                ),

                Container(
                  alignment:Alignment.center,
                  padding:const EdgeInsets.fromLTRB(15,0,0,0),
                  child:MaterialButton(
                    onPressed: (){
                    },
                    colorBrightness: Brightness.dark,
                    textColor: const Color(0xFF858E96),
                    elevation: 10.0,
                    highlightElevation: 1.0,
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xFF858e96), width: 1)
                          )
                      ),
                      child: const Text('회원가입',style: TextStyle(fontSize: 14, color: Color(0xFF858E96)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ).marginOnly(left: 20,right: 20,bottom: 20),
    );
  }

}
