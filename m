Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 01/16] remoteproc: add rproc_va_to_pa function
Date: Fri, 12 Jan 2018 07:43:09 +0000
Message-ID: <cd29783dd87f44ba9eea02656b000bc2@SFHDAG7NODE2.st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-2-git-send-email-loic.pallardy@st.com>
 <20171214003056.GC17344@builder>
In-Reply-To: <20171214003056.GC17344@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>


Hi Bjorn,

Thanks for the review of this series.

> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, December 14, 2017 1:31 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v2 01/16] remoteproc: add rproc_va_to_pa function
>=20
> On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
>=20
> > This new function translates CPU virtual address in
> > CPU physical one according to virtual address location.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> > index eab14b4..faa18a7 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -139,6 +139,17 @@ static void rproc_disable_iommu(struct rproc
> *rproc)
> >  	iommu_domain_free(domain);
> >  }
> >
> > +static phys_addr_t rproc_va_to_pa(void *cpu_addr)
> > +{
> > +	if (is_vmalloc_addr(cpu_addr)) {
>=20
> Please add a comment describing when is_vmalloc_addr() would be true.
Yes sure.
Regards,
Loic
>=20
> > +		return page_to_phys(vmalloc_to_page(cpu_addr)) +
> > +				    offset_in_page(cpu_addr);
> > +	}
> > +
> > +	WARN_ON(!virt_addr_valid(cpu_addr));
> > +	return virt_to_phys(cpu_addr);
> > +}
> > +
> >  /**
> >   * rproc_da_to_va() - lookup the kernel virtual address for a remotepr=
oc
> address
> >   * @rproc: handle of a remote processor
> > @@ -700,7 +711,7 @@ static int rproc_handle_carveout(struct rproc
> *rproc,
> >  	 * In this case, the device address and the physical address
> >  	 * are the same.
> >  	 */
> > -	rsc->pa =3D dma;
> > +	rsc->pa =3D (u32)rproc_va_to_pa(va);
>=20
> This is more correct than using "dma", so this is good.
>=20
> Regards,
> Bjorn
