Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 0/2] remoteproc: increase debug capabilities
Date: Mon, 6 Nov 2017 16:51:41 +0000
Message-ID: <c655e10d26a64fcdbebd1800912038fb@SFHDAG7NODE2.st.com>
References: <1509108082-22201-1-git-send-email-loic.pallardy@st.com>
 <20171031042157.GB12511@builder>
In-Reply-To: <20171031042157.GB12511@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Tuesday, October 31, 2017 5:22 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>
> Subject: Re: [PATCH 0/2] remoteproc: increase debug capabilities
>=20
> On Fri 27 Oct 05:41 PDT 2017, Loic Pallardy wrote:
>=20
> > This series increases remoteproc debug capabilities by adding:
> > - associated resource table dump feature
> > - registered carveouts list dump feature
> >
>=20
> This looks very reasonable, can you please fix the problem reported by
> 0-day?
Hi Bjorn,
I'll send a v2 fixing reported issues.
Regards,
Loic
>=20
> Regards,
> Bjorn
>=20
> > Loic Pallardy (2):
> >   remoteproc: debug: add resource table dump feature
> >   remoteproc: debug: add carveouts list dump feature
> >
> >  drivers/remoteproc/remoteproc_debugfs.c | 130
> ++++++++++++++++++++++++++++++++
> >  1 file changed, 130 insertions(+)
> >
> > --
> > 1.9.1
> >
