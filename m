Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 04/16] remoteproc: introduce rproc_find_carveout_by_da
Date: Fri, 12 Jan 2018 07:48:04 +0000
Message-ID: <e221259698c845bdb0ac269615059d05@SFHDAG7NODE2.st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-5-git-send-email-loic.pallardy@st.com>
 <20171214004532.GF17344@builder>
In-Reply-To: <20171214004532.GF17344@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, December 14, 2017 1:46 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v2 04/16] remoteproc: introduce
> rproc_find_carveout_by_da
>=20
> On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
>=20
> > This patch provides a new function to find a carveout according
> > to a device address (da).
> > If match found, this function returns CPU virtual address corresponding
> > to specified da.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 42
> ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> > index 279320a..78525d1 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -211,6 +211,48 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da,
> int len)
> >  }
> >  EXPORT_SYMBOL(rproc_da_to_va);
> >
> > +/**
> > + * rproc_find_carveout_by_da() - lookup the carveout region for a
> remoteproc address
> > + * @rproc: handle of a remote processor
> > + * @da: remoteproc device address to find
> > + * @len: length of the memory region @da is pointing to
> > + *
> > + * Platform driver has the capability to register some pre-allacoted
> carveout
> > + * (physically contiguous memory regions) before rproc firmware loadin=
g
> and
> > + * associated resource table analysis. These regions may be dedicated
> memory
> > + * regions internal to the coprocessor or specified DDR region with sp=
ecific
> > + * attributes
> > + *
> > + * This function is a helper function with which we can go over the
> > + * allocated carveouts and translate specific device addresse to virtu=
al
> > + * addresse so we can fill firmware resource table.
> > + *
> > + * The function returns a valid virtual address on success or NULL on
> failure.
> > + */
> > +void *rproc_find_carveout_by_da(struct rproc *rproc, u64 da, int len)
>=20
> The name suggest that this returns a struct rproc_mem_entry *, but the
> implementation is just a duplicate of rproc_da_to_va.
>=20
> I think I prefer that we just use the name based lookup in the
> subsequent patch, alternatively I think this should be made to return
> the carveout and one could then use da_to_va if you need a reference
> within that carveout.
Ok, agree to have more coherent API. And as discussed we can first lookup b=
y name and then check if requested da is matching.

/Loic
>=20
> > +{
> > +	struct rproc_mem_entry *carveout;
> > +	void *va =3D NULL;
> > +
> > +	list_for_each_entry(carveout, &rproc->carveouts, node) {
> > +		int offset =3D da - carveout->da;
> > +
> > +		/* try next carveout if da is too small */
> > +		if (offset < 0)
> > +			continue;
> > +
> > +		/* try next carveout if da is too large */
> > +		if (offset + len > carveout->len)
> > +			continue;
> > +
> > +		va =3D carveout->va + offset;
> > +
> > +		break;
> > +	}
> > +
> > +	return va;
> > +}
>=20
> Regards,
> Bjorn
