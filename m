Return-Path: <pihsun@chromium.org>
MIME-Version: 1.0
References: <20190131093131.245531-1-pihsun@chromium.org> <20190131093131.245531-3-pihsun@chromium.org>
 <20190202001749.GT81583@google.com> <cc1407f1-c236-f0af-a6c1-366aeac259f4@gmail.com>
In-Reply-To: <cc1407f1-c236-f0af-a6c1-366aeac259f4@gmail.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Wed, 13 Feb 2019 11:16:07 +0800
Message-ID: <CANdKZ0dMOsj_8oa1z8Uhs_UGotVkBpcqVP=uBM7n2XbHUvBWwQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] remoteproc/mediatek: add SCP support for mt8183
Content-Type: text/plain; charset="UTF-8"
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Matthias Kaehlcke <mka@chromium.org>, Erin Lo <erin.lo@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, open list <linux-kernel@vger.kernel.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Feb 5, 2019 at 2:02 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 02/02/2019 01:17, Matthias Kaehlcke wrote:
> > Hi Pi-Hsun,
> >
> > a few comments inline.
> >
> > It's the first time I dabble into remoteproc, I don't claim to have a
> > complete understanding of the driver at this point ;-)
> >
> > On Thu, Jan 31, 2019 at 05:31:27PM +0800, Pi-Hsun Shih wrote:
> >> From: Erin Lo <erin.lo@mediatek.com>
> >>
> >> Provide a basic driver to control Cortex M4 co-processor
> >>
> >> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> >> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> >> ---
> >> Changes from v3:
> >>  - Fix some issue found by checkpatch.
> >>  - Make writes aligned in scp_ipi_send.
> >>
> >> Changes from v2:
> >>  - Squash patch 3 from v2 (separate the ipi interface) into this patch.
> >>  - Remove unused name argument from scp_ipi_register.
> >>  - Add scp_ipi_unregister for proper cleanup.
> >>  - Move IPI ids in sync with firmware.
> >>  - Add mb() in proper place, and correctly clear the run->signaled.
> >>
> >> Changes from v1:
> >>  - Extract functions and rename variables in mtk_scp.c.
> >> ---
> >>  drivers/remoteproc/Kconfig            |   9 +
> >>  drivers/remoteproc/Makefile           |   1 +
> >>  drivers/remoteproc/mtk_common.h       |  73 +++++
> >>  drivers/remoteproc/mtk_scp.c          | 441 ++++++++++++++++++++++++++
> >>  drivers/remoteproc/mtk_scp_ipi.c      | 157 +++++++++
> >>  include/linux/platform_data/mtk_scp.h | 135 ++++++++
> >>  6 files changed, 816 insertions(+)
> >>  create mode 100644 drivers/remoteproc/mtk_common.h
> >>  create mode 100644 drivers/remoteproc/mtk_scp.c
> >>  create mode 100644 drivers/remoteproc/mtk_scp_ipi.c
> >>  create mode 100644 include/linux/platform_data/mtk_scp.h
> >>
> >> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> >> index f0abd260804473..ee0bda23768938 100644
> >> --- a/drivers/remoteproc/Kconfig
> >> +++ b/drivers/remoteproc/Kconfig
> >> @@ -22,6 +22,15 @@ config IMX_REMOTEPROC
> >>
> >>        It's safe to say N here.
> >>
> >> +config MTK_SCP
> >> +        tristate "Mediatek SCP support"
> >> +        depends on ARCH_MEDIATEK
> >> +        help
> >> +          Say y here to support Mediatek's SCP (Cortex M4
> >> +          on MT8183) via the remote processor framework.
> >
> > It would be good to spell out SCP somewhere, e.g.
> >
> > "... support Mediatek's system control processor (SCP) via ..."
> >
> > the example is less important IMO, though it's prefectly fine if you
> > can still squeeze it in ;-)
> >
>
> In which way is this different from
> drivers/soc/mediatek/mtk-scpsys.c ?
>
> Regards,
> Matthias (the other one ;)

drivers/remoteprocs/mtk_scp.c is for SCP (System Companion Processor)
on MTK's platform, and drivers/soc/mediatek/mtk-scpsys.c is for SCPSYS
(System Control Processor System). Despite the similar name, they're
not relevant.
