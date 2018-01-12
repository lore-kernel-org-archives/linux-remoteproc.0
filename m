Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 02/16] remoteproc: add release ops in rproc_mem_entry
 struct
Date: Fri, 12 Jan 2018 07:43:52 +0000
Message-ID: <4dfc381266dd4290a8e53c4074fe3ccb@SFHDAG7NODE2.st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-3-git-send-email-loic.pallardy@st.com>
 <20171214003427.GD17344@builder>
In-Reply-To: <20171214003427.GD17344@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, December 14, 2017 1:34 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v2 02/16] remoteproc: add release ops in
> rproc_mem_entry struct
>=20
> On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
>=20
> > +static int rproc_release_carveout(struct rproc *rproc, struct
> rproc_mem_entry *mem)
> > +{
> > +	struct device *dev =3D &rproc->dev;
> > +
> > +	/* clean up carveout allocations */
> > +	dma_free_coherent(dev->parent, mem->len, mem->va, mem-
> >dma);
> > +	list_del(&mem->node);
>=20
> The core is responsible for putting the node on a list, so let the
> cleanup take if off the list.
ok
>=20
> > +	kfree(mem);
> > +	return 0;
> > +}
> > +
> [..]
> > @@ -319,12 +322,11 @@ struct rproc_mem_entry {
> >  	dma_addr_t dma;
> >  	int len;
> >  	u32 da;
> > +	int (*release)(struct rproc *rproc, struct rproc_mem_entry *mem);
>=20
> The placement here seems random, please move it last in the struct.
ok
>=20
> >  	void *priv;
> >  	struct list_head node;
> >  };
> >
>=20
> Regards,
> Bjorn
