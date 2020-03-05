Return-Path: <nikita.shubin@maquefel.me>
From: nikita.shubin@maquefel.me
In-Reply-To: <CANLsYkxj=1o8Y0V0WedbVirj9seZSArWeCvQvwk+N7wZa2_hPQ@mail.gmail.com>
References: <20200304142628.8471-1-NShubin@topcon.com> <CANLsYkzPROdphvmtpZ6YiajZ2dYLrojC-rGYkq4jK2yzTnAJ5A@mail.gmail.com>
	 <264561583429111@sas1-438a02fc058e.qloud-c.yandex.net> <CANLsYkxj=1o8Y0V0WedbVirj9seZSArWeCvQvwk+N7wZa2_hPQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_rproc: dummy kick method
MIME-Version: 1.0
Date: Thu, 05 Mar 2020 21:07:10 +0300
Message-Id: <266371583430956@iva3-67f911cb3a01.qloud-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Nikita Shubin <nshubin@topcon.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>



05.03.2020, 20:54, "Mathieu Poirier" <mathieu.poirier@linaro.org>:
> On Thu, 5 Mar 2020 at 10:29, <nikita.shubin@maquefel.me> wrote:
>>  05.03.2020, 19:17, "Mathieu Poirier" <mathieu.poirier@linaro.org>:
>>  > On Wed, 4 Mar 2020 at 07:25, Nikita Shubin <NShubin@topcon.com> wrote:
>>  >> add kick method that does nothing, to avoid errors in rproc_virtio_notify.
>>  >>
>>  >> Signed-off-by: Nikita Shubin <NShubin@topcon.com>
>>  >> ---
>>  >> drivers/remoteproc/imx_rproc.c | 6 ++++++
>>  >> 1 file changed, 6 insertions(+)
>>  >>
>>  >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>>  >> index 3e72b6f38d4b..796b6b86550a 100644
>>  >> --- a/drivers/remoteproc/imx_rproc.c
>>  >> +++ b/drivers/remoteproc/imx_rproc.c
>>  >> @@ -240,9 +240,15 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>>  >> return va;
>>  >> }
>>  >>
>>  >> +static void imx_rproc_kick(struct rproc *rproc, int vqid)
>>  >> +{
>>  >> +
>>  >> +}
>>  >> +
>>  >
>>  > If rproc::kick() is empty, how does the MCU know there is packets to
>>  > fetch in the virtio queues?
>>
>>  Well, of course it doesn't i understand this perfectly - just following documentation citing:
>>
>>  | Every remoteproc implementation should at least provide the ->start and ->stop
>>  | handlers. If rpmsg/virtio functionality is also desired, then the ->kick handler
>>  | should be provided as well.
>>
>>  But i as i mentioned in "remoteproc: Fix NULL pointer dereference in rproc_virtio_notify" kick method will be called if
>>  "resource_table exists in firmware and has "Virtio device entry" defined" anyway, the imx_rproc is not in control of what
>>  exactly it is booting, so such situation can occur.
>
> If I understand correctly, the MCU can boot images that have a virtio
> device in its resource table and still do useful work even if the
> virtio device/rpmsg bus can't be setup - is this correct?

Yes, this assumption is correct. 

Despite this situation is not i desire at all - such thing can happen.
I am currently using co-proc as a realtime part of UGV control, 
so it must immediately stop the engines, if not provided with navigational information.

The imx7d MCU have access to the most periphery that have the main processor.

Of course the kick method should do real work, but i decided to submit step by step if i am allowed to do so.

>
> Thanks,
> Mathieu
>
>>  >
>>  >> static const struct rproc_ops imx_rproc_ops = {
>>  >> .start = imx_rproc_start,
>>  >> .stop = imx_rproc_stop,
>>  >> + .kick = imx_rproc_kick,
>>  >> .da_to_va = imx_rproc_da_to_va,
>>  >> };
>>  >>
>>  >> --
>>  >> 2.24.1
