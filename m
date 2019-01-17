Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 17 Jan 2019 10:00:07 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/1] remoteproc: fix recovery procedure
Message-ID: <20190117180007.GX9278@minitux>
References: <1547031403-34535-1-git-send-email-loic.pallardy@st.com>
 <CAH2Cfb_4qFAEjiANLpRmQL5o9-JCPHCBULLz5-r=zbK9EwiT_A@mail.gmail.com>
 <a7040498e7dc4e64b0748052c3ff3403@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7040498e7dc4e64b0748052c3ff3403@SFHDAG7NODE2.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: xiang xiao <xiaoxiang781216@gmail.com>, "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "s-anna@ti.com" <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 14 Jan 12:23 PST 2019, Loic PALLARDY wrote:

> Hi Xiang,
> 
> > -----Original Message-----
> > From: xiang xiao <xiaoxiang781216@gmail.com>
> > Sent: samedi 12 janvier 2019 19:29
> > To: Loic PALLARDY <loic.pallardy@st.com>
> > Cc: bjorn.andersson@linaro.org; ohad@wizery.com; linux-
> > remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Arnaud
> > POULIQUEN <arnaud.pouliquen@st.com>; benjamin.gaignard@linaro.org; s-
> > anna@ti.com
> > Subject: Re: [PATCH 1/1] remoteproc: fix recovery procedure
> > 

Thanks Loic for picking this up again.

> > Hi Loic,
> > The change just hide the problem, I think. The big issue is:
> > 1.virtio devices aren't destroyed by rpproc_stop
> Virtio devices are destroyed by rproc_stop() as vdev is registered as rproc sub device.
> rproc_stop() is calling rproc_stop_subdevices() which is in charge of removing virtio device and associated children.
> rproc_vdev_do_stop() --> rproc_remove_virtio_dev() --> unregister_virtio_device()
> 

Xiang is right, unregister_virtio_device() ends up decrementing the
refcount of device and might free it, but it's not guaranteed.

So I think we need to decouple the rproc_vdev and virtio_device, to
allow the latter to potentially outlive the prior.

> Please find below trace of a recovery on my ST SOC. My 2 rpmsg tty are removed and re-inserted correctly
> root@stm32mp1:~# ls /dev/ttyRPMSG*
> /dev/ttyRPMSG0  /dev/ttyRPMSG1
> root@stm32mp1:~# [  154.832523] remoteproc remoteproc0: crash detected in m4: type watchdog
> [  154.837725] remoteproc remoteproc0: handling crash #2 in m4
> [  154.843319] remoteproc remoteproc0: recovering m4
> [  154.849185] rpmsg_tty virtio0.rpmsg-tty-channel.-1.0: rpmsg tty device 0 is removed
> [  154.857572] rpmsg_tty virtio0.rpmsg-tty-channel.-1.1: rpmsg tty device 1 is removed
> [  155.382327] remoteproc remoteproc0: warning: remote FW shutdown without ack
> [  155.387857] remoteproc remoteproc0: stopped remote processor m4
> [  155.398988]  m4@0#vdev0buffer: assigned reserved memory node vdev0buffer@10044000
> [  155.405910] virtio_rpmsg_bus virtio0: creating channel rpmsg-tty-channel addr 0x0
> [  155.413422] rpmsg_tty virtio0.rpmsg-tty-channel.-1.0: new channel: 0x400 -> 0x0 : ttyRPMSG0
> [  155.421038] virtio_rpmsg_bus virtio0: creating channel rpmsg-tty-channel addr 0x1
> [  155.429088] rpmsg_tty virtio0.rpmsg-tty-channel.-1.1: new channel: 0x401 -> 0x1 : ttyRPMSG1
> [  155.437338] virtio_rpmsg_bus virtio0: rpmsg host is online
> [  155.442401]  m4@0#vdev0buffer: registered virtio0 (type 7)
> [  155.461154] remoteproc remoteproc0: remote processor m4 is now up
> ls /dev/ttyRPMSG*
> /dev/ttyRPMSG0  /dev/ttyRPMSG1
> root@stm32mp1:~#
> 
> As vdev is including in a larger struct allocated by rproc, it is safe
> to set it to 0 before initializing virtio device while rproc subdevice
> sequence is respected.
> 

It's likely that this works in most use cases, but if for some reason
there's additional references held those will operate on the object past
your clearing of it.

Regards,
Bjorn

> > 2.and then rpmsg child devices aren't destroyed too
> > Then, when the remote start and create rpmsg channel again, the
> > duplicated channel will appear in kernel.
> > To fix this problem, we need go through rpproc_shutdown/rproc_boot to
> > destroy all devices(virtio and rpmsg) and create them again.
> Rproc_shutdown/rproc_boot is solving the issue too, except if rproc_boot() was called several times and so rproc->power atomic not equal to 1.
> Using only rproc_stop() and rproc_start() allows to preserve rproc->power and so to be silent from rproc user pov.
> 
> Regards,
> Loic
> > 
> > Thanks
> > Xiang
> > 
> > On Wed, Jan 9, 2019 at 6:56 PM Loic Pallardy <loic.pallardy@st.com> wrote:
> > >
> > > Commit 7e83cab824a87e83cab824a8 ("remoteproc: Modify recovery path
> > > to use rproc_{start,stop}()") replaces rproc_{shutdown,boot}() with
> > > rproc_{stop,start}(), which skips destroy the virtio device at stop
> > > but re-initializes it again at start.
> > >
> > > Issue is that struct virtio_dev is not correctly reinitialized like done
> > > at initial allocation thanks to kzalloc() and kobject is considered as
> > > already initialized by kernel. That is due to the fact struct virtio_dev
> > > is allocated and released at vdev resource handling level managed and
> > > virtio device is registered and unregistered at rproc subdevices level.
> > >
> > > This patch initializes struct virtio_dev to 0 before using it and
> > > registering it.
> > >
> > > Fixes: 7e83cab824a8 ("remoteproc: Modify recovery path to use
> > rproc_{start,stop}()")
> > >
> > > Reported-by: Xiang Xiao <xiaoxiang781216@gmail.com>
> > > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > > ---
> > >  drivers/remoteproc/remoteproc_virtio.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c
> > b/drivers/remoteproc/remoteproc_virtio.c
> > > index 183fc42a510a..88eade99395c 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -332,6 +332,8 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev,
> > int id)
> > >         struct virtio_device *vdev = &rvdev->vdev;
> > >         int ret;
> > >
> > > +       /* Reset vdev struct as you don't know how it has been previously
> > used */
> > > +       memset(vdev, 0, sizeof(struct virtio_device));
> > >         vdev->id.device = id,
> > >         vdev->config = &rproc_virtio_config_ops,
> > >         vdev->dev.parent = dev;
> > > --
> > > 2.7.4
> > >
