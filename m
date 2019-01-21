Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
References: <1547031403-34535-1-git-send-email-loic.pallardy@st.com>
 <CAH2Cfb_4qFAEjiANLpRmQL5o9-JCPHCBULLz5-r=zbK9EwiT_A@mail.gmail.com>
 <a7040498e7dc4e64b0748052c3ff3403@SFHDAG7NODE2.st.com> <CAH2Cfb-jgvGWoQ+gim_17bEeg65Kh8=KDDtpe8LZCp=LAr_OLQ@mail.gmail.com>
 <2d1111783db04141a30fe6ee8f7cf54b@SFHDAG7NODE2.st.com> <CAH2Cfb-NL4_9SnqDJPneWCSKx08WKbX+cYtD=yU5skDhfM4kjg@mail.gmail.com>
 <36ccabd939024e52b48d2fb09afb6936@SFHDAG7NODE2.st.com>
In-Reply-To: <36ccabd939024e52b48d2fb09afb6936@SFHDAG7NODE2.st.com>
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Tue, 22 Jan 2019 00:14:15 +0800
Message-ID: <CAH2Cfb8KB175dB38HKtPqW05e6_5-OtE71EQhhUgBYP2csSFeQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] remoteproc: fix recovery procedure
Content-Type: text/plain; charset="UTF-8"
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "s-anna@ti.com" <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Jan 21, 2019 at 9:51 PM Loic PALLARDY <loic.pallardy@st.com> wrote:
>
>
>
> > -----Original Message-----
> > From: xiang xiao <xiaoxiang781216@gmail.com>
> > Sent: lundi 21 janvier 2019 13:45
> > To: Loic PALLARDY <loic.pallardy@st.com>
> > Cc: bjorn.andersson@linaro.org; ohad@wizery.com; linux-
> > remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Arnaud
> > POULIQUEN <arnaud.pouliquen@st.com>; benjamin.gaignard@linaro.org; s-
> > anna@ti.com
> > Subject: Re: [PATCH 1/1] remoteproc: fix recovery procedure
> >
> > On Fri, Jan 18, 2019 at 1:15 AM Loic PALLARDY <loic.pallardy@st.com> wrote:
> > >
> > > Hi Xiang,
> > >
> > > > -----Original Message-----
> > > > From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> > > > owner@vger.kernel.org> On Behalf Of xiang xiao
> > > > Sent: mardi 15 janvier 2019 07:46
> > > > To: Loic PALLARDY <loic.pallardy@st.com>
> > > > Cc: bjorn.andersson@linaro.org; ohad@wizery.com; linux-
> > > > remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Arnaud
> > > > POULIQUEN <arnaud.pouliquen@st.com>;
> > benjamin.gaignard@linaro.org; s-
> > > > anna@ti.com
> > > > Subject: Re: [PATCH 1/1] remoteproc: fix recovery procedure
> > > >
> > > > Here is my output after apply your patch, the duplication device still exist:
> > > > [   48.012300] remoteproc remoteproc0: crash detected in
> > > > f9210000.toppwr:tl421-rproc: type watchdog
> > > > [   48.023473] remoteproc remoteproc0: handling crash #1 in
> > > > f9210000.toppwr:tl421-rproc
> > > > [   48.037504] remoteproc remoteproc0: recovering
> > f9210000.toppwr:tl421-
> > > > rproc
> > > > [   48.048837] remoteproc remoteproc0: stopped remote processor
> > > > f9210000.toppwr:tl421-rproc
> > > > [   48.061969] virtio_rpmsg_bus virtio2: rpmsg host is online
> > > > [   48.061976] virtio_rpmsg_bus virtio2: creating channel rpmsg-ttyADSP
> > addr
> > > > 0x1
> > > First rpmsg-ttyADSP announcement
> > >
> > > > [   48.062956] virtio_rpmsg_bus virtio2: creating channel rpmsg-clk addr
> > 0x2
> > > > [   48.063489] virtio_rpmsg_bus virtio2: creating channel rpmsg-syslog
> > addr
> > > > 0x3
> > > > [   48.063815] virtio_rpmsg_bus virtio2: creating channel rpmsg-rtc addr
> > 0x4
> > > > [   48.064064] virtio_rpmsg_bus virtio2: creating channel rpmsg-ttyADSP
> > addr
> > > > 0x1
> > > Second rpmsg-ttyADSP announcement
> > >
> > > > [   48.064080] virtio_rpmsg_bus virtio2: channel
> > > > rpmsg-ttyADSP:ffffffff:1 already exist
> > > > [   48.064087] virtio_rpmsg_bus virtio2: rpmsg_create_channel failed
> > > > [   48.064102] virtio_rpmsg_bus virtio2: creating channel rpmsg-ttyADSP
> > addr
> > > > 0x1
> > > > [   48.064118] virtio_rpmsg_bus virtio2: channel
> > > > rpmsg-ttyADSP:ffffffff:1 already exist
> > > > [   48.064127] virtio_rpmsg_bus virtio2: rpmsg_create_channel failed
> > > > [   48.064139] virtio_rpmsg_bus virtio2: creating channel rpmsg-clk addr
> > 0x2
> > > > [   48.064153] virtio_rpmsg_bus virtio2: channel rpmsg-clk:ffffffff:2
> > > > already exist
> > > > [   48.064159] virtio_rpmsg_bus virtio2: rpmsg_create_channel failed
> > > > [   48.064174] virtio_rpmsg_bus virtio2: creating channel rpmsg-syslog
> > addr
> > > > 0x3
> > > > [   48.064192] virtio_rpmsg_bus virtio2: channel
> > > > rpmsg-syslog:ffffffff:3 already exist
> > > > [   48.064200] virtio_rpmsg_bus virtio2: rpmsg_create_channel failed
> > > > [   48.064213] virtio_rpmsg_bus virtio2: creating channel rpmsg-rtc addr
> > 0x4
> > > > [   48.064229] virtio_rpmsg_bus virtio2: channel rpmsg-rtc:ffffffff:4
> > > > already exist
> > > > [   48.064235] virtio_rpmsg_bus virtio2: rpmsg_create_channel failed
> > > > [   48.064286] virtio_rpmsg_bus virtio2: creating channel rpmsg-syslog
> > addr
> > > > 0x3
> > > > [   48.064302] virtio_rpmsg_bus virtio2: channel
> > > > rpmsg-syslog:ffffffff:3 already exist
> > > > [   48.064306] virtio_rpmsg_bus virtio2: rpmsg_create_channel failed
> > > > [   48.064318] virtio_rpmsg_bus virtio2: creating channel rpmsg-rtc addr
> > 0x4
> > > > [   48.064334] virtio_rpmsg_bus virtio2: channel rpmsg-rtc:ffffffff:4
> > > > already exist
> > > > [   48.064339] virtio_rpmsg_bus virtio2: rpmsg_create_channel failed
> > > > [   48.064351] virtio_rpmsg_bus virtio2: creating channel rpmsg-hostfs
> > addr
> > > > 0x5
> > > > [   48.064773] virtio_rpmsg_bus virtio2: creating channel rpmsg-hostfs
> > addr
> > > > 0x5
> > > > [   48.064789] virtio_rpmsg_bus virtio2: channel
> > > > rpmsg-hostfs:ffffffff:5 already exist
> > > > [   48.064797] virtio_rpmsg_bus virtio2: rpmsg_create_channel failed
> > > > [   48.064930] virtio_rpmsg_bus virtio2: creating channel  addr 0x5f7361
> > > > [   48.064945] virtio_rpmsg_bus virtio2: rpmsg_find_device failed
> > > > [   48.064957] virtio_rpmsg_bus virtio2: creating channel rpmsg-rtc addr
> > 0x4
> > > > [   48.064973] virtio_rpmsg_bus virtio2: channel rpmsg-rtc:ffffffff:4
> > > > already exist
> > > > [   48.064979] virtio_rpmsg_bus virtio2: rpmsg_create_channel failed
> > > > [   48.065015] virtio_rpmsg_bus virtio2: creating channel rpmsg-hostfs
> > addr
> > > > 0x5
> > > > [   48.065030] virtio_rpmsg_bus virtio2: channel
> > > > rpmsg-hostfs:ffffffff:5 already exist
> > > > [   48.065035] virtio_rpmsg_bus virtio2: rpmsg_create_channel failed
> > > > [   48.352150] remoteproc remoteproc0: registered virtio2 (type 7)
> > > > [   48.358813] remoteproc remoteproc0: remote processor
> > > > f9210000.toppwr:tl421-rproc is now up
> > > > do I still miss any additional patch?
> > >
> > > In your trace, I can see that your rpmsg device are announced twice and
> > error is on the second announcement which is normal as endpoint ID is
> > already used.
> > > virtio_rpmsg_bus virtio2: rpmsg_create_channel failed --> means you can't
> > get the requested idr.
> > >
> > > In code you pointing in [1] I can see that you are using optimized version of
> > rpmsg, having zero copy features and maybe others coming from rpmsg-lite.
> > > On my side I'm testing with official release from OpenAMP and I have no
> > modification on Linux rpmsg (on the top of kernel 5.0-rc0).
> >
> > I use OpenAMP too, but bring back zero copy features which was removed
> > by the recent code change.
> >
> > > Could you check content of the shared memory after recovery sequence?
> > Maybe previous messages are still present leading to double announcement.
> > > Could you please retry on a mainline kernel without rpmsg optimization ?
> > >
> > Yes, you are right, the duplicated issue get resolved by the following change:
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c
> > b/drivers/remoteproc/remoteproc_virtio.c
> > index 9d4f459..1e51ce2 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -300,7 +300,13 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev,
> > int id)
> >         struct rproc *rproc = rvdev->rproc;
> >         struct device *dev = &rproc->dev;
> >         struct virtio_device *vdev = &rvdev->vdev;
> > -       int ret;
> > +       int i, ret;
> > +
> > +       for (i = 0; i < RVDEV_NUM_VRINGS; i++) {
> > +               struct rproc_vring *rvring = &rvdev->vring[i];
> > +
> > +               memset(rvring->va, 0, vring_size(rvring->len, rvring->align));
> > +       }
> >
>
> That's not remoteproc responsibility to force to zero vrings. Vrings should be correctly reinitialized by virtio_rpmsg and virtio when virtio_rpmsg is probe.
> Regards,
> Loic
>
Yes, it's an ad-hoc location to see what happen after zero vring
region. The best place is:
__vring_new_virtqueue(drivers/virtio/virtio_ring.c) which initialize
many vring fields, but forget to zero out avail and used fields.

> > > On my side I tried the rpmsg_tty driver you pointed in [1] (I just add some
> > stubs for zero copy) and I succeed to recover on my platform with it, so no
> > issue on rpmsg client implementation side.
> > >
> > > Regards,
> > > Loic
> > >
> > > [1] https://github.com/thesofproject/linux/pull/177
> > >
> > >
> > > >
> > > > Thanks
> > > > Xiang
> > > >
> > > > On Tue, Jan 15, 2019 at 4:23 AM Loic PALLARDY <loic.pallardy@st.com>
> > > > wrote:
> > > > >
> > > > > Hi Xiang,
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: xiang xiao <xiaoxiang781216@gmail.com>
> > > > > > Sent: samedi 12 janvier 2019 19:29
> > > > > > To: Loic PALLARDY <loic.pallardy@st.com>
> > > > > > Cc: bjorn.andersson@linaro.org; ohad@wizery.com; linux-
> > > > > > remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Arnaud
> > > > > > POULIQUEN <arnaud.pouliquen@st.com>;
> > > > benjamin.gaignard@linaro.org; s-
> > > > > > anna@ti.com
> > > > > > Subject: Re: [PATCH 1/1] remoteproc: fix recovery procedure
> > > > > >
> > > > > > Hi Loic,
> > > > > > The change just hide the problem, I think. The big issue is:
> > > > > > 1.virtio devices aren't destroyed by rpproc_stop
> > > > > Virtio devices are destroyed by rproc_stop() as vdev is registered as
> > rproc
> > > > sub device.
> > > > > rproc_stop() is calling rproc_stop_subdevices() which is in charge of
> > > > removing virtio device and associated children.
> > > > > rproc_vdev_do_stop() --> rproc_remove_virtio_dev() -->
> > > > unregister_virtio_device()
> > > > >
> > > > > Please find below trace of a recovery on my ST SOC. My 2 rpmsg tty are
> > > > removed and re-inserted correctly
> > > > > root@stm32mp1:~# ls /dev/ttyRPMSG*
> > > > > /dev/ttyRPMSG0  /dev/ttyRPMSG1
> > > > > root@stm32mp1:~# [  154.832523] remoteproc remoteproc0: crash
> > > > detected in m4: type watchdog
> > > > > [  154.837725] remoteproc remoteproc0: handling crash #2 in m4
> > > > > [  154.843319] remoteproc remoteproc0: recovering m4
> > > > > [  154.849185] rpmsg_tty virtio0.rpmsg-tty-channel.-1.0: rpmsg tty
> > device 0
> > > > is removed
> > > > > [  154.857572] rpmsg_tty virtio0.rpmsg-tty-channel.-1.1: rpmsg tty
> > device 1
> > > > is removed
> > > > > [  155.382327] remoteproc remoteproc0: warning: remote FW
> > shutdown
> > > > without ack
> > > > > [  155.387857] remoteproc remoteproc0: stopped remote processor m4
> > > > > [  155.398988]  m4@0#vdev0buffer: assigned reserved memory node
> > > > vdev0buffer@10044000
> > > > > [  155.405910] virtio_rpmsg_bus virtio0: creating channel rpmsg-tty-
> > channel
> > > > addr 0x0
> > > > > [  155.413422] rpmsg_tty virtio0.rpmsg-tty-channel.-1.0: new channel:
> > > > 0x400 -> 0x0 : ttyRPMSG0
> > > > > [  155.421038] virtio_rpmsg_bus virtio0: creating channel rpmsg-tty-
> > channel
> > > > addr 0x1
> > > > > [  155.429088] rpmsg_tty virtio0.rpmsg-tty-channel.-1.1: new channel:
> > > > 0x401 -> 0x1 : ttyRPMSG1
> > > > > [  155.437338] virtio_rpmsg_bus virtio0: rpmsg host is online
> > > > > [  155.442401]  m4@0#vdev0buffer: registered virtio0 (type 7)
> > > > > [  155.461154] remoteproc remoteproc0: remote processor m4 is now
> > up
> > > > > ls /dev/ttyRPMSG*
> > > > > /dev/ttyRPMSG0  /dev/ttyRPMSG1
> > > > > root@stm32mp1:~#
> > > > >
> > > > > As vdev is including in a larger struct allocated by rproc, it is safe to set it
> > to 0
> > > > before initializing virtio device while rproc subdevice sequence is
> > respected.
> > > > >
> > > > > > 2.and then rpmsg child devices aren't destroyed too
> > > > > > Then, when the remote start and create rpmsg channel again, the
> > > > > > duplicated channel will appear in kernel.
> > > > > > To fix this problem, we need go through
> > rpproc_shutdown/rproc_boot to
> > > > > > destroy all devices(virtio and rpmsg) and create them again.
> > > > > Rproc_shutdown/rproc_boot is solving the issue too, except if
> > > > rproc_boot() was called several times and so rproc->power atomic not
> > equal
> > > > to 1.
> > > > > Using only rproc_stop() and rproc_start() allows to preserve rproc-
> > >power
> > > > and so to be silent from rproc user pov.
> > > > >
> > > > > Regards,
> > > > > Loic
> > > > > >
> > > > > > Thanks
> > > > > > Xiang
> > > > > >
> > > > > > On Wed, Jan 9, 2019 at 6:56 PM Loic Pallardy <loic.pallardy@st.com>
> > > > wrote:
> > > > > > >
> > > > > > > Commit 7e83cab824a87e83cab824a8 ("remoteproc: Modify
> > recovery
> > > > path
> > > > > > > to use rproc_{start,stop}()") replaces rproc_{shutdown,boot}() with
> > > > > > > rproc_{stop,start}(), which skips destroy the virtio device at stop
> > > > > > > but re-initializes it again at start.
> > > > > > >
> > > > > > > Issue is that struct virtio_dev is not correctly reinitialized like done
> > > > > > > at initial allocation thanks to kzalloc() and kobject is considered as
> > > > > > > already initialized by kernel. That is due to the fact struct virtio_dev
> > > > > > > is allocated and released at vdev resource handling level managed
> > and
> > > > > > > virtio device is registered and unregistered at rproc subdevices
> > level.
> > > > > > >
> > > > > > > This patch initializes struct virtio_dev to 0 before using it and
> > > > > > > registering it.
> > > > > > >
> > > > > > > Fixes: 7e83cab824a8 ("remoteproc: Modify recovery path to use
> > > > > > rproc_{start,stop}()")
> > > > > > >
> > > > > > > Reported-by: Xiang Xiao <xiaoxiang781216@gmail.com>
> > > > > > > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > > > > > > ---
> > > > > > >  drivers/remoteproc/remoteproc_virtio.c | 2 ++
> > > > > > >  1 file changed, 2 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/remoteproc/remoteproc_virtio.c
> > > > > > b/drivers/remoteproc/remoteproc_virtio.c
> > > > > > > index 183fc42a510a..88eade99395c 100644
> > > > > > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > > > > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > > > > > @@ -332,6 +332,8 @@ int rproc_add_virtio_dev(struct rproc_vdev
> > > > *rvdev,
> > > > > > int id)
> > > > > > >         struct virtio_device *vdev = &rvdev->vdev;
> > > > > > >         int ret;
> > > > > > >
> > > > > > > +       /* Reset vdev struct as you don't know how it has been
> > previously
> > > > > > used */
> > > > > > > +       memset(vdev, 0, sizeof(struct virtio_device));
> > > > > > >         vdev->id.device = id,
> > > > > > >         vdev->config = &rproc_virtio_config_ops,
> > > > > > >         vdev->dev.parent = dev;
> > > > > > > --
> > > > > > > 2.7.4
> > > > > > >
