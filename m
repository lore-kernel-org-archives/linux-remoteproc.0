Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [RFC 1/2] remoteproc: sysfs: authorize rproc shutdown when rproc
 is crashed
Date: Thu, 12 Mar 2020 08:12:32 +0000
Message-ID: <1161f034ddc64d6aa782f06c3c4996cd@SFHDAG7NODE2.st.com>
References: <1583924072-20648-1-git-send-email-loic.pallardy@st.com>
 <1583924072-20648-2-git-send-email-loic.pallardy@st.com>
 <20200311232707.GA1214176@minitux>
In-Reply-To: <20200311232707.GA1214176@minitux>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "Fabien DESSENNE  <fabien.dessenne@st.com>, s-anna@ti.com" <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

> -----Original Message-----
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> Sent: jeudi 12 mars 2020 00:27
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; mathieu.poirier@linaro.org; linux-
> remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Arnaud
> POULIQUEN <arnaud.pouliquen@st.com>; benjamin.gaignard@linaro.org;
> Fabien DESSENNE <fabien.dessenne@st.com>; s-anna@ti.com
> Subject: Re: [RFC 1/2] remoteproc: sysfs: authorize rproc shutdown when
> rproc is crashed
>=20
> On Wed 11 Mar 03:54 PDT 2020, Loic Pallardy wrote:
>=20
> > When remoteproc recovery is disabled and rproc crashed, user space
> > client has no way to reboot co-processor except by a complete platform
> > reboot.
> > Indeed rproc_shutdown() is called by sysfs state_store() only is rproc
> > state is RPROC_RUNNING.
> >
> > This patch offers the possibility to shutdown the co-processor if
> > it is in RPROC_CRASHED state and so to restart properly co-processor
> > from sysfs interface.
> >
>=20
> I did recently run into a similar problem when I fed my remoteproc
> faulty firmware, which lead to it recovering immediately upon boot. The
> amount of time spent in !CRASHED state was minimal, so I didn't have any
> way to stop the remoteproc.
>=20
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c  | 2 +-
> >  drivers/remoteproc/remoteproc_sysfs.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> > index 097f33e4f1f3..7ac87a75cd1b 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1812,7 +1812,7 @@ void rproc_shutdown(struct rproc *rproc)
> >  	if (!atomic_dec_and_test(&rproc->power))
> >  		goto out;
> >
> > -	ret =3D rproc_stop(rproc, false);
> > +	ret =3D rproc_stop(rproc, rproc->state =3D=3D RPROC_CRASHED);
>=20
> Afaict this is unrelated to the problem you're describing in the commit
> message.
Right, it is because now rproc_shudown could be could in a context where rp=
roc is in RPROC_CRASHED state and so false is no more the default value.
Could be split in another patch.

>=20
> >  	if (ret) {
> >  		atomic_inc(&rproc->power);
> >  		goto out;
> > diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> b/drivers/remoteproc/remoteproc_sysfs.c
> > index 7f8536b73295..1029458a4678 100644
> > --- a/drivers/remoteproc/remoteproc_sysfs.c
> > +++ b/drivers/remoteproc/remoteproc_sysfs.c
> > @@ -101,7 +101,7 @@ static ssize_t state_store(struct device *dev,
> >  		if (ret)
> >  			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
> >  	} else if (sysfs_streq(buf, "stop")) {
> > -		if (rproc->state !=3D RPROC_RUNNING)
> > +		if (rproc->state !=3D RPROC_RUNNING && rproc->state !=3D
> RPROC_CRASHED)
>=20
> Analogous to the problem reported by Alex here
> https://patchwork.kernel.org/patch/11413161/ the handling of stop seems
> racy.
>=20
> In particular, I believe you're failing to protect against a race
> with a just scheduled rproc_crash_handler_work() being executed after
> the mutex_unlock() in rproc_shutdown()...
>=20
> With Alex fix that should be less of a problem though...
Thanks for pointing me Alex's patch. But I don't think it is exactly the sa=
me issue as it concerns the recovery procedure itself.
In my case, the recovery is disabled. On a crash detection, rproc->state is=
 simply set to RPROC_CRASHED
and recovery is not  triggered.
Without client action, rproc will stay forever in RPROC_CRASHED test.
Today without this modification, it is not possible to shutdown rproc prope=
rly, putting coprocessor under reset,  disabling clocks...

Regards,
Loic

>=20
> Regards,
> Bjorn
>=20
> >  			return -EINVAL;
> >
> >  		rproc_shutdown(rproc);
> > --
> > 2.7.4
> >
