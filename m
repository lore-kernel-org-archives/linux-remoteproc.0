Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: Regression by commit 7e83cab824a86704cdbd7735c19d34e0ce423dc5
Date: Thu, 8 Nov 2018 08:16:56 +0000
Message-ID: <989d41d8edce4912a9172943adac4e1e@SFHDAG7NODE2.st.com>
References: <CAH2Cfb_yqjYSNf62rvwsOGCG-x+XVNBGwdKrBCfuCO0B2SSSUQ@mail.gmail.com>
 <20181108062214.GY12063@builder>
 <CAH2Cfb-MCKk78J8x8fBhZdVHYN-eNHh6kL2iSXqmEMwrw-txPw@mail.gmail.com>
 <20181108072608.GF12063@builder>
In-Reply-To: <20181108072608.GF12063@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>, xiang xiao <xiaoxiang781216@gmail.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "spjoshi@codeaurora.org" <spjoshi@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> owner@vger.kernel.org> On Behalf Of Bjorn Andersson
> Sent: jeudi 8 novembre 2018 08:26
> To: xiang xiao <xiaoxiang781216@gmail.com>
> Cc: linux-remoteproc@vger.kernel.org; spjoshi@codeaurora.org
> Subject: Re: Regression by commit
> 7e83cab824a86704cdbd7735c19d34e0ce423dc5
>=20
> On Wed 07 Nov 22:36 PST 2018, xiang xiao wrote:
>=20
> > On Thu, Nov 8, 2018 at 2:18 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Wed 07 Nov 06:25 PST 2018, xiang xiao wrote:
> > >
> > > > This commit replace rproc_{shutdown,boot}() with rproc_{stop,start}=
(),
> > > > which skip destroy the virtio device at stop but reinitialize it ag=
ain at
> > > > start:
> > > > [  603.446805] remoteproc remoteproc0: crash detected in
> > > > f9210000.toppwr:tl421-rproc: type mmufault
> > > > [  603.456883] remoteproc remoteproc0: handling crash #1 in
> > > > f9210000.toppwr:tl421-rproc
> > > > [  603.469593] remoteproc remoteproc0: recovering
> > > > f9210000.toppwr:tl421-rproc
> > > > [  603.483172] remoteproc remoteproc0: stopped remote processor
> > > > f9210000.toppwr:tl421-rproc
> > > > [  603.495999] kobject (ffffffc0b8c51098): tried to init an initial=
ized
> > > > object, something is seriously wrong.
> > > >
> > >
> > > I thought this issue was fixed.
> > >
> > Which patch fix this issue? I am using 4.19 kernel.
> >
>=20
> I'm unable to find such commit right now. And given your report I
> believe this still is a bug then.

I send fix [1] for a similar issue in July. After investigation, I found an=
 issue at rpmsg level in remove procedure.
In some case virtio device can't be destroyed as some child are still regis=
tered.
Could you please test my patch to see if it fix your issue?

Regards,
Loic

1: https://patchwork.kernel.org/patch/10544757/

>=20
> > > >   ^^^^^^^^^^^^^^^^^^^^^
> > > > [  603.506868] CPU: 5 PID: 198 Comm: kworker/5:1 Tainted: G        =
W
> > > >  4.9.27-04454-gd4c1829-dirty #255
> > > > [  603.517468] Hardware name: Banks (DT)
> > > > [  603.521581] Workqueue: events rproc_crash_handler_work
> > > > [  603.527342] Call trace:
> > > > [  603.530086] [<ffffff800808bd9c>] dump_backtrace+0x0/0x1cc
> > > > [  603.536115] [<ffffff800808bf7c>] show_stack+0x14/0x1c
> > > > [  603.541771] [<ffffff80083fef08>] dump_stack+0xa8/0xe0
> > > > [  603.547423] [<ffffff8008402b24>] kobject_init+0x8c/0x9c
> > > > [  603.553280] [<ffffff800853758c>] device_initialize+0x3c/0xe8
> > > > [  603.559609] [<ffffff80085397d4>] device_register+0x14/0x28
> > > > [  603.565750] [<ffffff80084b777c>] register_virtio_device+0xc4/0x1=
14
> > > > [  603.572669] [<ffffff8008878b20>] rproc_add_virtio_dev+0x7c/0x108
> > > > [  603.579390] [<ffffff8008875cbc>] rproc_vdev_do_probe+0x14/0x1c
> > > > [  603.585911] [<ffffff8008875a60>] rproc_start+0xac/0x1ac
> > > > [  603.591754] [<ffffff8008877a68>]
> rproc_trigger_recovery+0x2f8/0x324
> > > > [  603.598763] [<ffffff8008877b24>]
> rproc_crash_handler_work+0x90/0xb0
> > > > [  603.605778] [<ffffff80080cd570>] process_one_work+0x204/0x704
> > > > [  603.612202] [<ffffff80080cdac4>] worker_thread+0x54/0x4a8
> > > > [  603.618248] [<ffffff80080d4aec>] kthread+0xec/0x100
> > > > [  603.623703] [<ffffff8008083890>] ret_from_fork+0x10/0x40
> > > >
> > > > When the crash happen, is it better to destroy and recreate all vir=
tio
> > > > device and it's children(rpmsg device) again to match the remote si=
de
> state
> > > > like the original behavior?
> > > >
> > >
> > > Yes, it's likely that the protocols on top does share some state, so =
we
> > > do not have any choice but to report this up to the virtio device.
> > >
> > > Removing and re-probing the devices - rather than having some other
> form
> > > of notification of this event - makes the code simpler.
> > >
> > >
> > > But it seems we're trying to re-register the same device the second
> > > time, rather than initialize a new one.
> > >
> > If we use one new here, the old need to be destroyed to avoid the leak.
> > Basically, it's become the old approach again.
> >
>=20
> You're right, for vdevs we must tear them down and bring them up again.
>=20
> The reason for introducing the offending commit was for carveouts to
> be allocated past the stop() call, so that we can stop the core and
> provide a coredump for post mortem debugging.
>=20
> > We are building many rpmsg devices on top of rproc/virtio, each one
> > has the internal state sync with the remote side.
> > If remote side crash and reboot again, all state is stale and need to
> > reset to the default state.
> > Removing and re-probing is the clean and simple solution, I think too.
> >
>=20
> Regards,
> Bjorn
