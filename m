Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 0/2] remoteproc: increase debug capabilities
Date: Tue, 7 Nov 2017 08:19:52 +0000
Message-ID: <d44ab362902a4b4a9fea1a10eb0027c5@SFHDAG7NODE2.st.com>
References: <1509988196-24377-1-git-send-email-loic.pallardy@st.com>
 <20171107060331.GA22677@builder>
In-Reply-To: <20171107060331.GA22677@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Tuesday, November 07, 2017 7:04 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v2 0/2] remoteproc: increase debug capabilities
>=20
> On Mon 06 Nov 09:09 PST 2017, Loic Pallardy wrote:
>=20
> > This series increases remoteproc debug capabilities by adding:
> > - associated resource table dump feature
> > - registered carveouts list dump feature
> >
>=20
> Looks good, patches applied to rproc-next
Thanks

Regards,
Loic
>=20
> Regards,
> Bjorn
>=20
> > ---
> > Changes from V1:
> > - Fix 0-DAY reported issues on open functions prototype
> > - Rebase on Linux 4.14-rc8
> >
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
