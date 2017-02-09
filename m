Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v3 4/4] remoteproc: core: don't allocate carveout if pa or
 da are defined
Date: Thu, 9 Feb 2017 21:34:13 +0000
Message-ID: <0ba1b913c5bb407195dc9b664992b707@SFHDAG7NODE2.st.com>
References: <1485866156-6364-1-git-send-email-loic.pallardy@st.com>
 <1485866156-6364-5-git-send-email-loic.pallardy@st.com>
 <20170209015504.GM27837@minitux>
In-Reply-To: <20170209015504.GM27837@minitux>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>, Patrice CHOTARD <patrice.chotard@st.com>, Hugues FRUCHET <hugues.fruchet@st.com>, "peter.griffin@linaro.org" <peter.griffin@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, February 09, 2017 2:55 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; lee.jones@linaro.org; linux-
> remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org;
> kernel@stlinux.com; Patrice CHOTARD <patrice.chotard@st.com>; Hugues
> FRUCHET <hugues.fruchet@st.com>; peter.griffin@linaro.org
> Subject: Re: [PATCH v3 4/4] remoteproc: core: don't allocate carveout if =
pa or
> da are defined
>=20
> On Tue 31 Jan 04:35 PST 2017, Loic Pallardy wrote:
>=20
> > Remoteproc doesn't check if firmware requests fixed
> > addresses for carveout regions.
> > Current assumption is that platform specific driver is in
> > charge of coprocessor specific memory region allocation and
> > remoteproc core doesn't have to handle them.
> > If a da or a pa is specified in firmware resource table, remoteproc
> > core doesn't have to perform any allocation.
> > Access to carveout will be done thanks to rproc_da_to_pa function,
> > which will provide virtual address on carveout region allocated
> > by platform specific driver.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> > No change since V1
> >
> >  drivers/remoteproc/remoteproc_core.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> > index 90b05c7..dd63ceed 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -622,6 +622,11 @@ static int rproc_handle_carveout(struct rproc
> *rproc,
> >  	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x,
> flags 0x%x\n",
> >  		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
> >
> > +	if (rsc->pa !=3D FW_RSC_ADDR_ANY || rsc->da !=3D
> FW_RSC_ADDR_ANY) {
>=20
> For devices with an IOMMU it's valid to specify "da" and have the
> allocated region mapped there. So this is not correct.

You're right, moreover patch series touch only to pa, so even if da behavio=
r should be changed, should be done in a dedicated patch.
I'll send a V4.

Regards,
Loic
>=20
> Regards,
> Bjorn
