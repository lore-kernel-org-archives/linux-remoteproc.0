Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v3 1/4] remoteproc: st: correct probe error management
Date: Tue, 7 Feb 2017 22:20:08 +0000
Message-ID: <8d46724e3bd84c6b82ab63b34f5b3600@SFHDAG7NODE2.st.com>
References: <1485866156-6364-1-git-send-email-loic.pallardy@st.com>
 <1485866156-6364-2-git-send-email-loic.pallardy@st.com>
 <20170206211955.GI31134@builder>
In-Reply-To: <20170206211955.GI31134@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>, Patrice CHOTARD <patrice.chotard@st.com>, Hugues FRUCHET <hugues.fruchet@st.com>, "peter.griffin@linaro.org" <peter.griffin@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Monday, February 06, 2017 10:20 PM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; lee.jones@linaro.org; linux-
> remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org;
> kernel@stlinux.com; Patrice CHOTARD <patrice.chotard@st.com>; Hugues
> FRUCHET <hugues.fruchet@st.com>; peter.griffin@linaro.org
> Subject: Re: [PATCH v3 1/4] remoteproc: st: correct probe error managemen=
t
>=20
> On Tue 31 Jan 04:35 PST 2017, Loic Pallardy wrote:
>=20
> > Associated clock is prepared in st_rproc_parse_dt function.
> > it should be unprepared in case of error during probing.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>=20
> Applied patch 1 and 2.
Thanks Bjorn.
Did you have time to review patch 3 and 4?
Regards,
Loic
>=20
> Regards,
> Bjorn
