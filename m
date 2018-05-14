Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v3 09/13] remoteproc: modify rproc_handle_carveout to
 support pre-registered region
Date: Mon, 14 May 2018 14:52:32 +0000
Message-ID: <35c35efde19e464285402786cba732ff@SFHDAG7NODE2.st.com>
References: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
 <1519921440-21356-10-git-send-email-loic.pallardy@st.com>
 <20180510004244.GE29093@builder>
In-Reply-To: <20180510004244.GE29093@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, May 10, 2018 2:43 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v3 09/13] remoteproc: modify rproc_handle_carveout to
> support pre-registered region
>=20
> On Thu 01 Mar 08:23 PST 2018, Loic Pallardy wrote:
>=20
> > In current version rproc_handle_carveout function support only dynamic
> > region allocation.
> > This patch extends rproc_handle_carveout function to support pre-
> registered
> > region. Match is done on region name, then requested device address and
> > length are checked.
> > If no name match found, original allocation is used.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 49
> +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 48 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> > index 0ebbc4f..49b28a0 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -679,7 +679,7 @@ static int rproc_handle_carveout(struct rproc
> *rproc,
> >  				 struct fw_rsc_carveout *rsc,
> >  				 int offset, int avail)
> >  {
> > -	struct rproc_mem_entry *carveout, *mapping =3D NULL;
> > +	struct rproc_mem_entry *carveout, *mapping =3D NULL, *mem;
> >  	struct device *dev =3D &rproc->dev;
> >  	dma_addr_t dma;
> >  	void *va;
> > @@ -699,6 +699,51 @@ static int rproc_handle_carveout(struct rproc
> *rproc,
> >  	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x,
> flags 0x%x\n",
> >  		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
> >
> > +	/* Check carveout rsc already part of a registered carveout */
> > +	/* Search by name */
> > +	mem =3D rproc_find_carveout_by_name(rproc, rsc->name);
> > +	if (mem) {
>=20
> I don't fancy the concept of "check if there is another registered
> carveout and if so update this carveouts data based on that one and then
> skip the bottom half of this function but keep them both on the
> carveouts list".
>=20
> It's unfortunately not very easy to follow and it doesn't allow us to
> reuse the carveout-handler for allocations in remoteprocs without a
> resource table.
>=20
> How about splitting the handling of the resource table in two parts; one
> that creates or updates a carveout on the carvouts list and a second
> part that runs through all carveouts and "allocate" (similar to your
> specific release function) them.
>=20
>=20
> The first part of this function would then attempt to find a carveout
> entry matching the one we're trying to "handle";
>=20
> * if one is found we check if it's compatible (as you do here), update a
>   rsc_offset (as we do with vrings) and return.
>=20
> * if no match is found we create a new rproc_mem_entry, fill it out
>   based on the fw_rsc_carveout information and stash it at the end of
>   the carveouts list.
>=20
> We do the same in the other resource handlers (just allocate entries
> onto the lists).
>=20
>=20
> As that is done the second step is to loop over all carveouts, devmem,
> trace and vdev resources and actually "allocate" the resources, by
> calling a "alloc" function pointer next to your proposed release one.
>=20
> For memremap() memory this could be as simple as filling out the
> resource table at the associated rsc_offset or simply doing the
> memremap().
>=20
> The default alloc (filled out in step 1, if not already specified) would
> be what's today found in rproc_handle_carveout().
>=20
>=20
> This allows carveout resources not specified in the resource table to be
> allocated as well. Which comes in handy for the handling of vdev
> resources:
>=20
> In rproc_parse_vdev() we do a similar operation to the parser of a
> fw_rsc_carveout and try to find an existing carveout by name and if not
> create a new one on the list.
>=20
> As the actual allocation of carveouts is done before the "allocation" of
> vrings there will be an allocated carveout ready when we hit
> rproc_alloc_vring() - and we don't care if it came from
> dma_alloc_coherent() or a driver defined region.
>=20
>=20
> Does this sound reasonable?
Yes, better to separate resource table parsing and memory carveout allocati=
on.
I'll update series in that way

Regards,
Loic


>=20
> Regards,
> Bjorn
