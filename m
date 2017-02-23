Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <58af4aa2.8a12620a.c3a2b.698b@mx.google.com>
References: <58af4aa2.8a12620a.c3a2b.698b@mx.google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Feb 2017 22:01:11 +0100
Message-ID: <CAK8P3a0TB4SdixX+Gk__uZRqSwpO-v-JwKOR747uhCi=EjtqVA@mail.gmail.com>
Subject: Re: mainline build: 9 warnings 1 failures (mainline/v4.10-7345-g5bcbe22)
Content-Type: text/plain; charset=UTF-8
To: Olof's autobuilder <build@lixom.net>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
Cc: Olof Johansson <olof@lixom.net>, kernel-build-reports@lists.linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Feb 23, 2017 at 9:48 PM, Olof's autobuilder <build@lixom.net> wrote:

> Errors:
>
>         arm.allmodconfig:
> /work/build/batch/drivers/soc/ti/wkup_m3_ipc.c:373:36: error: 'struct rproc' has no member named 'firmware_loading_complete'

This apparently just broke after Linus pulled the remoteproc git tree. I had not
seen this failure in linux-next yet. Maybe a dependency that wasn't
handled right,
or a broken last-minute patch?

    Arnd
