Return-Path: <mathieu.poirier@linaro.org>
MIME-Version: 1.0
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
 <CANLsYkzeAyGhYqewGaHfd-myW5EzE83WUOwAbKwTP-34pbUR-w@mail.gmail.com> <AM0PR04MB448114DF702180D0CF0553A688130@AM0PR04MB4481.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB448114DF702180D0CF0553A688130@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 20 Feb 2020 14:25:09 -0700
Message-ID: <CANLsYkx_6R_rJ198k4bf2Y4q6WqfHj9bzFzdBFhgOEFrwjcLeQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] remoteproc: imx_rproc: support i.MX8/8M/7ULP
Content-Type: text/plain; charset="UTF-8"
To: Peng Fan <peng.fan@nxp.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 19 Feb 2020 at 18:36, Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi Mathieu,
>
> > Subject: Re: [PATCH 0/9] remoteproc: imx_rproc: support i.MX8/8M/7ULP
> >
> > Hi Peng,
> >
> > On Wed, 19 Feb 2020 at 00:33, <peng.fan@nxp.com> wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > This patchset aim to replace NXP vendor imx_rpmsg.c driver.
> >
> > You mean remoteproc/imx_rproc.c ?  Upstream rpmsg/imx_rpmsg.c doesn't
> > exist.
>
> imx_rpmsg.c only in NXP vendor tree. This pachset is to use imx_rproc.c for
> rpmsg/virtio functions for i.MX SoC.
>
> >
> > >
> > > This patchset is tested with Loic PALLARDY's patch
> > > "remoteproc: add support for co-processor loaded and booted before
> > kernel"
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatc
> > >
> > hwork.kernel.org%2Fpatch%2F11265869%2F&amp;data=02%7C01%7Cpeng.f
> > an%40n
> > >
> > xp.com%7Ce1cb19e535a14b63d0da08d7b568fd56%7C686ea1d3bc2b4c6fa9
> > 2cd99c5c
> > >
> > 301635%7C0%7C0%7C637177334839497832&amp;sdata=aKQ%2Bulco63ba
> > YT%2BDZDk0
> > > VLt1NpkNuhrY3ssxiRCOcrM%3D&amp;reserved=0,
> > > and inspried from st's remoteproc early boot support.
> > > Since Loic's patch is still under review, just expect your comments :)
> >
> > Did you base your work on top of Loic's because your MCU firmware is always
> > loaded by the bootloader?
>
> I only took Loic's early-boot patch as base and apply my patchset.
>
> The mcu firmware currently only loaded by bootloader or system controller firmware.
> NXP released mcu firmware not support being loaded by Linux remoteproc.

Thanks for bringing this use case to the front.  I suspected such a
scenario existed but didn't spend too much time thinking about it
since none had been brought to our attention.  I will review your
patchset and continue the conversation with Arnaud with it in mind.  I
also invite you to join that conversation.

Regards,
Mathieu

>
>  If not please send another revision of your work
> > without early boot support.  When we have a clear view on how to proceed
> > with the early boot support you can send another set to enable that.
>
> I'll wait your new patch for early boot in remoteproc-core. Then I'll rebase
> and send a new version. Since I introduce big changes to imx_rproc.c, so
> I'll see whether any comments there.
>
> Thanks,
> Peng.
>
> >
> > Thanks,
> > Mathieu
> >
> > >
> > > Patch [1,2]/9: dt-bindings convert to json and new SoC support Patch
> > > 3/9: skip firmware load when recovery. To i.MX8, firmware is not
> > >            handled by Linux.
> > >
> > > Patch [4-9]/9: i.MX specific part to support rpmsg/virtio with mbox.
> > >       because NXP release image not have resoure table, so add resource
> > >       table in dts
> > >
> > > My test dts diff for i.MX8QXP MEK, but I have tested this patchset for
> > > i.MX8QXP MEK, i.MX8MM EVK, i.MX7ULP EVK:
> > >
> > > +
> > > +       imx8x-cm4 {
> > > +               compatible = "fsl,imx8qxp-cm4";
> > > +               rsrc-table = <
> > > +                       0x1 0x2 0x0 0x0 0x18 0x5c
> > > +                       3
> > > +                       /*fw_rsc_vdev*/
> > > +                       7 0 1 0 0 0x200
> > > +                       /*fw_rsc_vdev_vring*/
> > > +                       0x90000000 4096 256 1 0
> > > +                       0x90008000 4096 256 2 0
> > > +                       3
> > > +                       /*fw_rsc_vdev*/
> > > +                       7 1 1 0 0 0x200
> > > +                       /*fw_rsc_vdev_vring*/
> > > +                       0x90010000 4096 256 1 0
> > > +                       0x90018000 4096 256 2 0
> > > +               >;
> > > +               early-booted;
> > > +               mbox-names = "tx", "rx", "rxdb";
> > > +               mboxes = <&lsio_mu5 0 1
> > > +                         &lsio_mu5 1 1
> > > +                         &lsio_mu5 3 1>;
> > > +               mub-partition = <3>;
> > > +               memory-region = <&vdev0vring0>, <&vdev0vring1>,
> > <&vdev0buffer>,
> > > +                               <&vdev1vring0>, <&vdev1vring1>,
> > <&vdev0buffer>;
> > > +       };
> > > +
> > > +       reserved-memory {
> > > +               #address-cells = <2>;
> > > +               #size-cells = <2>;
> > > +               ranges;
> > > +
> > > +               vdev0vring0: vdev0vring0@90000000 {
> > > +                       compatible = "shared-dma-pool";
> > > +                       reg = <0 0x90000000 0 0x8000>;
> > > +                       no-map;
> > > +               };
> > > +
> > > +               vdev0vring1: vdev0vring1@90008000 {
> > > +                       compatible = "shared-dma-pool";
> > > +                       reg = <0 0x90008000 0 0x8000>;
> > > +                       no-map;
> > > +               };
> > > +
> > > +               vdev1vring0: vdev1vring0@90010000 {
> > > +                       compatible = "shared-dma-pool";
> > > +                       reg = <0 0x90010000 0 0x8000>;
> > > +                       no-map;
> > > +               };
> > > +
> > > +               vdev1vring1: vdev1vring1@90018000 {
> > > +                       compatible = "shared-dma-pool";
> > > +                       reg = <0 0x90018000 0 0x8000>;
> > > +                       no-map;
> > > +               };
> > > +
> > > +               vdev0buffer: vdev0buffer {
> > > +                       compatible = "shared-dma-pool";
> > > +                       reg = <0 0x90400000 0 0x100000>;
> > > +                       no-map;
> > > +               };
> > > +       };
> > > +
> > >
> > > Peng Fan (9):
> > >   dt-bindings: remoteproc: Convert imx-rproc to json-schema
> > >   dt-bindings: remoteproc: imx-rproc: support i.MX[8,8M,7ULP]
> > >   remoteproc: add support to skip firmware load when recovery
> > >   remoteproc: imx_rproc: surport early booted remote processor
> > >   remoteproc: imx_rproc: parse early-booted property
> > >   remoteproc: imx_proc: enable virtio/mailbox
> > >   remoteproc: imx_rproc: add i.MX8QM/QXP
> > >   remoteproc: imx_rproc: support i.MX7ULP
> > >   remoteproc: imx_rproc: add i.MX8MM support
> > >
> > >  .../devicetree/bindings/remoteproc/imx-rproc.txt   |  33 --
> > >  .../devicetree/bindings/remoteproc/imx-rproc.yaml  |  95 +++++
> > >  drivers/remoteproc/imx_rproc.c                     | 455
> > +++++++++++++++++++--
> > >  drivers/remoteproc/remoteproc_core.c               |  19 +-
> > >  include/linux/remoteproc.h                         |   1 +
> > >  5 files changed, 531 insertions(+), 72 deletions(-)  delete mode
> > > 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> > >  create mode 100644
> > > Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
> > >
> > > --
> > > 2.16.4
> > >
