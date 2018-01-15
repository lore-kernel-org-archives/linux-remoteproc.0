Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 11/16] remoteproc: introduce
 rproc_find_carveout_by_name function
Date: Mon, 15 Jan 2018 09:10:06 +0000
Message-ID: <9a77f950ed504e27a7e8a13ec29182cb@SFHDAG7NODE2.st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-12-git-send-email-loic.pallardy@st.com>
 <20171214013236.GL17344@builder>
In-Reply-To: <20171214013236.GL17344@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, December 14, 2017 2:33 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v2 11/16] remoteproc: introduce
> rproc_find_carveout_by_name function
>=20
> On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
> > +struct rproc_mem_entry *
> > +rproc_find_carveout_by_name(struct rproc *rproc, char *name)
>=20
> In almost all cases after this patch you have to do a snprintf(), so it
> would be better to make this function format the name based on a format
> string and variable arguments.

Good point
/Loic
>=20
> > +{
> > +	struct rproc_mem_entry *carveout, *mem =3D NULL;
> > +
> > +	if (!name)
> > +		return NULL;
> > +
> > +	list_for_each_entry(carveout, &rproc->carveouts, node) {
> > +		/* Compare carveout and requested names */
> > +		if (!strcmp(carveout->name, name)) {
> > +			mem =3D carveout;
> > +			break;
> > +		}
> > +	}
> > +
> > +	return mem;
> > +}
> > +
>=20
> Regards,
> Bjorn
