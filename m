Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 03/16] remoteproc: introduce rproc_add_carveout
 function
Date: Fri, 12 Jan 2018 07:45:52 +0000
Message-ID: <b4c2671d03f2433dbee0a6215ae57a38@SFHDAG7NODE2.st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-4-git-send-email-loic.pallardy@st.com>
 <20171214003641.GE17344@builder>
In-Reply-To: <20171214003641.GE17344@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, December 14, 2017 1:37 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v2 03/16] remoteproc: introduce rproc_add_carveout
> function
>=20
> On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> > index f23daf9..279320a 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -737,6 +737,7 @@ static int rproc_handle_carveout(struct rproc
> *rproc,
> >  	carveout->dma =3D dma;
> >  	carveout->da =3D rsc->da;
> >  	carveout->release =3D rproc_release_carveout;
> > +	carveout->priv =3D (void *)CARVEOUT_RSC_ALLOCATED;
>=20
> I don't fancy the (ab)use of priv to keep track of this, I also don't
> see that it's ever used. Please drop it.
It was to distinguish carveout defined from resource table and carveout reg=
istered by driver.
But agree about priv field usage
>=20
> [..]
> > +int rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry
> *mem)
> > +{
> > +	if (!rproc || !mem)
> > +		return -EINVAL;
>=20
> I don't see this function doing more than adding the item to the list of
> carveouts, which can't fail. So let's just rely on the user calling it
> with valid references and make it return void.
Ok

>=20
> > +
> > +	mem->priv =3D (void *)CARVEOUT_EXTERNAL;
> > +
> > +	list_add_tail(&mem->node, &rproc->carveouts);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(rproc_add_carveout);
>=20
> Regards,
> Bjorn
