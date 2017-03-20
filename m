Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 20 Mar 2017 15:22:08 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RESEND PATCH] remoteproc: qcom: fix QCOM_SMD dependencies
Message-ID: <20170320222208.GE20094@minitux>
References: <20170313163635.956380-1-arnd@arndb.de>
 <20170314100546.75581adc@endymion>
 <CAK8P3a0ZY1BBD8ChB7Qd0v4aEqiw+ifQ_nspOgJeve7wssbO9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0ZY1BBD8ChB7Qd0v4aEqiw+ifQ_nspOgJeve7wssbO9Q@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jean Delvare <jdelvare@suse.de>, Ohad Ben-Cohen <ohad@wizery.com>, Peter Griffin <peter.griffin@linaro.org>, Vinod Koul <vinod.koul@intel.com>, Loic Pallardy <loic.pallardy@st.com>, Pavel Machek <pavel@ucw.cz>, linux-remoteproc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 14 Mar 04:01 PDT 2017, Arnd Bergmann wrote:

> On Tue, Mar 14, 2017 at 10:05 AM, Jean Delvare <jdelvare@suse.de> wrote:
[..]
> > I don't think the COMPILE_TEST adds any value here. The whole set of
> > drivers is architecture specific anyway so you won't gain much build
> > test coverage. It may even prevent a legitimate combination of options
> > on the intended target, if the feature provided by QCOM_SMD and
> > RPMSG_QCOM_SMD is optional (if not, I would suggest to drop all the
> > stubs and simply depend on RPMSG_QCOM_SMD || QCOM_SMD, for the sake of
> > simplicity.)
> >
> > Don't get me wrong, I am a big fan of COMPILE_TEST, but only when we
> > can use it to get build testing coverage for free. If you have to change
> > the code itself in order to be able to get the extra build testing
> > coverage, I don't think it is a good idea. The kernel and the Kconfig
> > dependencies can be complex enough as is.
> 
> I think the problem is the ARCH_QCOM dependency here, which
> clearly gets in the way of COMPILE_TEST having any real effect.
> 
> I think generally speaking we either want to run the code and need both
> ARCH_QCOM and (RPMSG_QCOM_SMD || QCOM_SMD), or we do
> build-testing and need (COMPILE_TEST && RPMSG_QCOM_SMD=n
> && QCOM_SMD=n). We could add another Kconfig symbol that
> captures the dependency and then just add a simple dependency
> here.

The drivers doesn't depend on SMD for loading and booting the
remoteprocs, the dependency is just to get the appropriate
functions/stubs - although currently all firmware I've seen requires SMD
to be in place.

I'll push forward with purging QCOM_SMD and I'll have a proper review of
the dependencies as part of/following that process.

I believe it makes more sense to check for ARCH_QCOM || COMPILE_TEST and
just have the others to check if we have each dependency build-in or
module.


I forwarded your patch to Linus for v4.11, thanks.

Regards,
Bjorn
