Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [RFC 1/2] remoteproc: sysfs: authorize rproc shutdown when rproc
 is crashed
Date: Thu, 12 Mar 2020 08:00:01 +0000
Message-ID: <991a1e4bce844103a7e93960750944c1@SFHDAG7NODE2.st.com>
References: <1583924072-20648-1-git-send-email-loic.pallardy@st.com>
 <1583924072-20648-2-git-send-email-loic.pallardy@st.com>
 <20200311214504.GA32471@xps15>
In-Reply-To: <20200311214504.GA32471@xps15>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "Fabien DESSENNE  <fabien.dessenne@st.com>, s-anna@ti.com" <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: mercredi 11 mars 2020 22:45
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: bjorn.andersson@linaro.org; ohad@wizery.com; linux-
> remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Arnaud
> POULIQUEN <arnaud.pouliquen@st.com>; benjamin.gaignard@linaro.org;
> Fabien DESSENNE <fabien.dessenne@st.com>; s-anna@ti.com
> Subject: Re: [RFC 1/2] remoteproc: sysfs: authorize rproc shutdown when
> rproc is crashed
>=20
> Hi Loic,
>=20
> On Wed, Mar 11, 2020 at 11:54:31AM +0100, Loic Pallardy wrote:
> > When remoteproc recovery is disabled and rproc crashed, user space
> > client has no way to reboot co-processor except by a complete platform
> > reboot.
> > Indeed rproc_shutdown() is called by sysfs state_store() only is rproc
> > state is RPROC_RUNNING.
> >
> > This patch offers the possibility to shutdown the co-processor if
> > it is in RPROC_CRASHED state and so to restart properly co-processor
> > from sysfs interface.
>=20
> And it is not possible to use the debugfs interface [1] to restart the MC=
U?
>=20
> [1]. https://elixir.bootlin.com/linux/v5.6-
> rc2/source/drivers/remoteproc/remoteproc_debugfs.c#L147

Debugfs interface is optional and on final product it is often disabled.
The used control interfaces are in kernel API and sysfs one.

Regards,
Loic
>=20
>=20
> >
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
> >  			return -EINVAL;
> >
> >  		rproc_shutdown(rproc);
> > --
> > 2.7.4
> >
