Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20170314100546.75581adc@endymion>
References: <20170313163635.956380-1-arnd@arndb.de> <20170314100546.75581adc@endymion>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Mar 2017 12:01:47 +0100
Message-ID: <CAK8P3a0ZY1BBD8ChB7Qd0v4aEqiw+ifQ_nspOgJeve7wssbO9Q@mail.gmail.com>
Subject: Re: [RESEND PATCH] remoteproc: qcom: fix QCOM_SMD dependencies
Content-Type: text/plain; charset=UTF-8
To: Jean Delvare <jdelvare@suse.de>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, Vinod Koul <vinod.koul@intel.com>, Loic Pallardy <loic.pallardy@st.com>, Pavel Machek <pavel@ucw.cz>, linux-remoteproc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Mar 14, 2017 at 10:05 AM, Jean Delvare <jdelvare@suse.de> wrote:
> Hi Arnd,
>
> On Mon, 13 Mar 2017 17:36:25 +0100, Arnd Bergmann wrote:
>> qcom_smd_register_edge() is provided by either QCOM_SMD or RPMSG_QCOM_SMD,
>> and if both of them are disabled, it does nothing.
>
> Actually the code itself looks wrong to me. There are two sets of stubs
> for qcom_smd_register_edge() and qcom_smd_unregister_edge() when the
> feature is disabled, one from include/linux/rpmsg/qcom_smd.h and one
> from include/linux/soc/qcom/smd.h. They have different definitions, and
> different conditions. The former is declared if neither backend is
> selected, while the latter is declared if QCOM_SMD isn't selected
> (regardless of the value of RPMSG_QCOM_SMD.)

This driver always includes the former header (linux/rpmsg/qcom_smd.h),
which has both checks. The second header should be removed as soon
as we have moved over the users to the new one.

> So as it stands, QCOM_SMD=n && RPMSG_QCOM_SMD=m leads to 2
> implementations of these functions, inline stubs from
> include/linux/soc/qcom/smd.h and actual implementations from
> drivers/rpmsg/qcom_smd.c.

QCOM_SMD=n && RPMSG_QCOM_SMD=m should result in no code
including include/linux/soc/qcom/smd.h, and I don't get any other
failures here.

 I know nothing about these drivers but this
> looks needlessly complex and error-prone to me. The stubs should be
> declared only once and only when no actual implementations are
> available. That is, assuming they are really supposed to be the same
> and it's not an unfortunate name collision.

Agreed, but I think fixing that can be a separate effort. I don't
know what Bjorn's time frame is for removing the soc/qcom/smd
driver, but I'd guess we can already merge the headers into
one as a first step.

>> @@ -104,7 +104,7 @@ config QCOM_Q6V5_PIL
>>  config QCOM_WCNSS_PIL
>>       tristate "Qualcomm WCNSS Peripheral Image Loader"
>>       depends on OF && ARCH_QCOM
>> -     depends on QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n)
>> +     depends on RPMSG_QCOM_SMD || QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n && RPMSG_QCOM_SMD=n)
>>       depends on QCOM_SMEM
>>       depends on REMOTEPROC
>>       select QCOM_MDT_LOADER
>
> I don't think the COMPILE_TEST adds any value here. The whole set of
> drivers is architecture specific anyway so you won't gain much build
> test coverage. It may even prevent a legitimate combination of options
> on the intended target, if the feature provided by QCOM_SMD and
> RPMSG_QCOM_SMD is optional (if not, I would suggest to drop all the
> stubs and simply depend on RPMSG_QCOM_SMD || QCOM_SMD, for the sake of
> simplicity.)
>
> Don't get me wrong, I am a big fan of COMPILE_TEST, but only when we
> can use it to get build testing coverage for free. If you have to change
> the code itself in order to be able to get the extra build testing
> coverage, I don't think it is a good idea. The kernel and the Kconfig
> dependencies can be complex enough as is.

I think the problem is the ARCH_QCOM dependency here, which
clearly gets in the way of COMPILE_TEST having any real effect.

I think generally speaking we either want to run the code and need both
ARCH_QCOM and (RPMSG_QCOM_SMD || QCOM_SMD), or we do
build-testing and need (COMPILE_TEST && RPMSG_QCOM_SMD=n
&& QCOM_SMD=n). We could add another Kconfig symbol that
captures the dependency and then just add a simple dependency
here.

      Arnd
