Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 23 Feb 2017 15:05:55 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: mainline build: 9 warnings 1 failures
 (mainline/v4.10-7345-g5bcbe22)
Message-ID: <20170223230555.GI23255@minitux>
References: <58af4aa2.8a12620a.c3a2b.698b@mx.google.com>
 <CAK8P3a0TB4SdixX+Gk__uZRqSwpO-v-JwKOR747uhCi=EjtqVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0TB4SdixX+Gk__uZRqSwpO-v-JwKOR747uhCi=EjtqVA@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Olof's autobuilder <build@lixom.net>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, Olof Johansson <olof@lixom.net>, kernel-build-reports@lists.linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 23 Feb 13:01 PST 2017, Arnd Bergmann wrote:

> On Thu, Feb 23, 2017 at 9:48 PM, Olof's autobuilder <build@lixom.net> wrote:
> 
> > Errors:
> >
> >         arm.allmodconfig:
> > /work/build/batch/drivers/soc/ti/wkup_m3_ipc.c:373:36: error: 'struct rproc' has no member named 'firmware_loading_complete'
> 
> This apparently just broke after Linus pulled the remoteproc git tree. I had not
> seen this failure in linux-next yet. Maybe a dependency that wasn't
> handled right,
> or a broken last-minute patch?
> 

The commit 2099c77d4af7 ("remoteproc: Drop firmware_loading_complete")
depends on 36cc9fd9ce0f ("soc: ti: wkup_m3_ipc: Drop wait from
wkup_m3_rproc_boot_thread"), but I apparently missed this.

The first patch was part of my pull for v4.11 and the latter was picked
up by Tony and is merged by Olof into one of your trees. I should
probably have taken both through my tree...

Sorry about this.

Regards,
Bjorn
