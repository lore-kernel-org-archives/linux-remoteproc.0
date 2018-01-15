Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 14/16] remoteproc: look-up pre-registered carveout by
 name for carveout allocation
Date: Mon, 15 Jan 2018 20:59:39 +0000
Message-ID: <96a72c95bd414095a94681f41637680c@SFHDAG7NODE2.st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-15-git-send-email-loic.pallardy@st.com>
 <20171214053456.GO17344@builder>
In-Reply-To: <20171214053456.GO17344@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, December 14, 2017 6:35 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v2 14/16] remoteproc: look-up pre-registered carveout
> by name for carveout allocation
>=20
> On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
> > +	/* By name */
> > +	mem =3D rproc_find_carveout_by_name(rproc, rsc->name);
> > +	if (mem) {
> > +		/*
> > +		 * Update resource table with registered carevout
> information
> > +		 */
> > +		rsc->len =3D mem->len;
>=20
> You should validate that len, da and pa are compatible.
Yes you're right, complete definition must be checked

Regards,
Loic
>=20
> > +		rsc->da =3D mem->da;
> > +		rsc->pa =3D rproc_va_to_pa(mem->va);
> > +		/* no need to register as already match one for one */
> > +		return 0;
> > +	}
>=20
> Regards,
> Bjorn
