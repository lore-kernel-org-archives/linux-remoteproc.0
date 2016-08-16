Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: Ongoing remoteproc discussions
Date: Tue, 16 Aug 2016 12:24:22 +0000
Message-ID: <D0C04901035AEF47BB4C8387F4AA41F53C3972@SAFEX1NODE23.st.com>
References: <20160718231011.GK13516@tuxbot>
 <3c054d9e-db70-a1d2-c755-3a71ce45fcb7@ti.com> <20160811181306.GX26240@tuxbot>
In-Reply-To: <20160811181306.GX26240@tuxbot>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Suman Anna <s-anna@ti.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Sarangdhar Joshi <spjoshi@codeaurora.org>, Eric FINCO <eric.finco@st.com>, Russell Wayman <russell.wayman@linaro.org>, "Matthew Locke  <matthew.locke@linaro.org>, Kumar Gala" <kumar.gala@linaro.org>, "Bill Fletcher  <bill.fletcher@linaro.org>, Puja Gupta" <pujag@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, August 11, 2016 8:13 PM
> To: Suman Anna <s-anna@ti.com>
> Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Lee
> Jones <lee.jones@linaro.org>; Sarangdhar Joshi <spjoshi@codeaurora.org>;
> Loic PALLARDY <loic.pallardy@st.com>; Eric FINCO <eric.finco@st.com>;
> Russell Wayman <russell.wayman@linaro.org>; Matthew Locke
> <matthew.locke@linaro.org>; Kumar Gala <kumar.gala@linaro.org>; Bill
> Fletcher <bill.fletcher@linaro.org>; Puja Gupta <pujag@codeaurora.org>;
> Ohad Ben-Cohen <ohad@wizery.com>
> Subject: Re: Ongoing remoteproc discussions
>=20
> On Wed 10 Aug 17:19 PDT 2016, Suman Anna wrote:
>=20
> > Hi Bjorn,
> >
>=20
> Hi,
>=20
> > On 07/18/2016 06:10 PM, Bjorn Andersson wrote:
> [..]
> > > =3D=3D Auto-boot or always-on:
> > > There are cases where we want to achieve the current auto-boot
> > > mechanism without rpmsg and there are cases where we don't want to
> > > auto-boot a remoteproc just because its resource table contains
> > > rpmsg entries. So we need to decouple this logic from the vdev. I sug=
gest
> that:
> >
> > I am trying to understand the usecase where one doesn't want to
> > auto-boot with rpmsg entries, did you come across such an usecase?
> >
>=20
> This is a request that comes from Loic (ST). I'm unaware of the details, =
but I
> can think of scenarios where rpmsg channels serves as auxiliary functiona=
lity
> to the main purpose of a co-processor (e.g. debug functionality).
>=20
Hi Bjorn, Suman,

In ST, in general we have a driver on the top of remoteproc to control rpro=
c activities (set fw name, boot, shutdown...).
The request was to have the same behavior between rproc with and without rp=
msg.
With rpmsg, a rproc is automatically boot and so if on the top driver wants=
 to apply same boot sequence (rproc_set_fw_name, rproc_boot, rproc_shutdown=
), rproc_shutdown will never happened as rproc_boot called twice (one by on=
 the top driver, one by "rpmsg").

So the proposal was to have autoboot capability linked to the rproc itself,=
 not to the communication link.

Regards,
Loic
[...]
>=20
> Thanks for your input!
>=20
> Regards,
> Bjorn
