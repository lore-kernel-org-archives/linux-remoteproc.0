Return-Path: <mathieu.poirier@linaro.org>
MIME-Version: 1.0
References: <1583924072-20648-1-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1583924072-20648-1-git-send-email-loic.pallardy@st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 11 Mar 2020 08:56:08 -0600
Message-ID: <CANLsYkyOPM4euJh-vr7-2z-CxMw=vFrWSXKGswt4ZMutcyEEaw@mail.gmail.com>
Subject: Re: [RFC 0/2] Allow client to recover crashed processor
Content-Type: text/plain; charset="UTF-8"
To: Loic Pallardy <loic.pallardy@st.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Fabien DESSENNE <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 11 Mar 2020 at 04:54, Loic Pallardy <loic.pallardy@st.com> wrote:
>
> The following 2 patches propose some changes to allow user space
> client to shutdown and restart a crashed co-processor.
> This is required when auto recovery is disabled at framework level or
> when auto recovery procedure failed.
>
> Sent as RFC as may be part of Mathieu's proposal for early boot/late
> attach support

Perfect timing - thanks for sending those out.

Mathieu

>
> Loic Pallardy (2):
>   remoteproc: sysfs: authorize rproc shutdown when rproc is crashed
>   remoteproc: core: keep rproc in crash state in case of recovery
>     failure
>
>  drivers/remoteproc/remoteproc_core.c  | 8 +++++++-
>  drivers/remoteproc/remoteproc_sysfs.c | 2 +-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> --
> 2.7.4
>
