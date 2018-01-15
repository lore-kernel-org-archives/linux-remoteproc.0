Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 15/16] remoteproc: st: associate memory device to
 memory regions
Date: Mon, 15 Jan 2018 21:04:26 +0000
Message-ID: <41c42a3c54ec45c4bccac6f5500b4697@SFHDAG7NODE2.st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-16-git-send-email-loic.pallardy@st.com>
 <20171214053729.GP17344@builder>
In-Reply-To: <20171214053729.GP17344@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, December 14, 2017 6:37 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v2 15/16] remoteproc: st: associate memory device to
> memory regions
>=20
> On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
>=20
> > Enable memory device creation for each memory region added
> > by rproc_add_carveout function.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/remoteproc/st_remoteproc.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/st_remoteproc.c
> b/drivers/remoteproc/st_remoteproc.c
> > index da42ec9..bf83d82 100644
> > --- a/drivers/remoteproc/st_remoteproc.c
> > +++ b/drivers/remoteproc/st_remoteproc.c
> > @@ -279,6 +279,7 @@ static int st_rproc_parse_dt(struct platform_device
> *pdev)
> >  		mem->dma =3D res.start;
> >  		mem->da =3D res.start;
> >  		mem->len =3D resource_size(&res);
> > +		strncpy(mem->name, node->name, sizeof(mem->name));
>=20
> Please add this to the previous patch.

As indicated in cover letter, I'll some patches to have a coherent series.

/Loic

>=20
> >  		mem->va =3D devm_ioremap_wc(dev, mem->dma, mem-
> >len);
> >  		if (!mem->va) {
> >  			dev_err(dev, "Unable to map memory region:
> %pa+%zx\n",
> > @@ -286,7 +287,7 @@ static int st_rproc_parse_dt(struct platform_device
> *pdev)
> >  			return -EBUSY;
> >  		}
> >
> > -		rproc_add_carveout(rproc, mem, false);
> > +		rproc_add_carveout(rproc, mem, true);
>=20
> Here you can see how easy it is to accidentally double-map the memory
> region.
>
> Regards,
> Bjorn
