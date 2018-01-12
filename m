Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 08/16] remoteproc: add name in rproc_mem_entry struct
Date: Fri, 12 Jan 2018 08:19:50 +0000
Message-ID: <89505210a56a412e9716f1052267b231@SFHDAG7NODE2.st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-9-git-send-email-loic.pallardy@st.com>
 <20171214012110.GJ17344@builder>
In-Reply-To: <20171214012110.GJ17344@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, December 14, 2017 2:21 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v2 08/16] remoteproc: add name in rproc_mem_entry
> struct
>=20
> On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
>=20
> > Add name field in struc rproc_mem_entry.
> > This new field will be used to match memory area
> > requested in resource table with pre-registered carveout.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c    | 1 +
> >  drivers/remoteproc/remoteproc_debugfs.c | 1 +
> >  include/linux/remoteproc.h              | 2 ++
> >  3 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> > index bdc99cd..cc53247 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -835,6 +835,7 @@ static int rproc_handle_carveout(struct rproc
> *rproc,
> >  	carveout->da =3D rsc->da;
> >  	carveout->release =3D rproc_release_carveout;
> >  	carveout->priv =3D (void *)CARVEOUT_RSC_ALLOCATED;
> > +	strncpy(carveout->name, rsc->name, sizeof(carveout->name));
>=20
> Please ensure that this string is NUL terminated.

I'll use strlcpy instead

Regards,
Loic
>=20
> Regards,
> Bjorn
