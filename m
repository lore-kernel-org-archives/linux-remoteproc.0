Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 1/1] rpmsg: virtio_rpmsg_bus: fix channel creation
Date: Tue, 10 Jan 2017 08:18:34 +0000
Message-ID: <c663f50d02ee4bfca4f458b8de57516b@SFHDAG7NODE2.st.com>
References: <1481813396-1529-1-git-send-email-loic.pallardy@st.com>
 <20161216050912.GS3439@tuxbot> <a5c97c71-a78f-25a7-c2ee-cfb236825997@ti.com>
 <20161230195624.GF10531@minitux> <20170109234556.GY10531@minitux>
In-Reply-To: <20170109234556.GY10531@minitux>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Suman Anna <s-anna@ti.com>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>, Patrice CHOTARD <patrice.chotard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Tuesday, January 10, 2017 12:46 AM
> To: Loic PALLARDY <loic.pallardy@st.com>; Suman Anna <s-anna@ti.com>
> Cc: ohad@wizery.com; lee.jones@linaro.org; linux-
> remoteproc@vger.kernel.org; kernel@stlinux.com; Patrice CHOTARD
> <patrice.chotard@st.com>
> Subject: Re: [PATCH v2 1/1] rpmsg: virtio_rpmsg_bus: fix channel creation
>=20
> On Fri 30 Dec 11:56 PST 2016, Bjorn Andersson wrote:
>=20
> > On Tue 27 Dec 14:36 PST 2016, Suman Anna wrote:
> >
> > > Hi Loic,
> > >
> > > On 12/15/2016 11:09 PM, Bjorn Andersson wrote:
> > > > On Thu 15 Dec 06:49 PST 2016, Loic Pallardy wrote:
> > > >
> > > >> Since commit 4dffed5b3ac796b ("rpmsg: Name rpmsg devices based
> on
> > > >> channel id"), it is no more possible for a firmware to register
> > > >> twice a service (on different endpoints). rpmsg_register_device
> > > >> function is failing when calling device_add for the second time
> > > >> as second device has the same name as first one already register.
> > > >> It is because name is based only on service name and so is not
> > > >> more unique. Previously name was unique thanks to the use of
> rpmsg_dev_index.
> > > >>
> > > >> This patch adds destination and source endpoint numbers device
> > > >> name to create an unique identifier.
> > > >>
> > > >> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > > >
> > > > Looks good, thanks.
> > >
> > > Thanks for the patch, I have ran into the exact same issue as well.
> > >
> > > >
> > > > Regards,
> > > > Bjorn
> > > >
> > > >> ---
> > > >> v2: Update commit header with commit ID generating regression Fix
> > > >> rpmsg_core instead of virtio_rpmsg
> > > >>
> > > >>  drivers/rpmsg/rpmsg_core.c | 4 ++--
> > > >>  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >>
> > > >> diff --git a/drivers/rpmsg/rpmsg_core.c
> > > >> b/drivers/rpmsg/rpmsg_core.c index a79cb5a..18c73e0 100644
> > > >> --- a/drivers/rpmsg/rpmsg_core.c
> > > >> +++ b/drivers/rpmsg/rpmsg_core.c
> > > >> @@ -453,8 +453,8 @@ int rpmsg_register_device(struct
> rpmsg_device *rpdev)
> > > >>  	struct device *dev =3D &rpdev->dev;
> > > >>  	int ret;
> > > >>
> > > >> -	dev_set_name(&rpdev->dev, "%s:%s",
> > > >> -		     dev_name(dev->parent), rpdev->id.name);
> > > >> +	dev_set_name(&rpdev->dev, "%s.%d.%d.%s",
> dev_name(dev->parent),
> > > >> +		     rpdev->src, rpdev->dst, rpdev->id.name);
> > >
> > > This is fine, though I would have preferred the numbers at the end
> > > after the string literals (%s.%s.%d.%d instead of %s.%d.%d.%s)
> > >
> >
> > When using the Qualcomm SMD backend only the name is used to identify
> > channels, so I set src & dst to RPMSG_ADDR_ANY. Moving the numbers to
> > the end makes this slightly better looking and one could potentially
> > trim those without changing the structure of the name.
> >
> >
> > Loic, I took the liberty of changing the order and have updated my
> > for-next [1] with the following patches:
> >
> > a0c10687ec95 Revert "remoteproc: Merge table_ptr and cached_table
> pointers"
> > c81c0e0710f0 remoteproc: fix vdev reference management
> > 63447646ac65 rpmsg: virtio_rpmsg_bus: fix channel creation
> >
> >
> > I will let them sit there a few days to get some additional build and
> > boot test and hope you can give them a spin as well; before I send
> > them to Linus.
> >
> > [1] https://github.com/andersson/remoteproc/commits/for-next
> >
>=20
> Loic, did you have a chance to give this a test run? I would appreciate y=
our
> feedback before I send this off to Linus.
Hi Bjorn,

Sorry for my late answer.
Tested on my side. Works fine on ST platform.
Thanks,
Loic=20

>=20
> (The fixed version is part of linux-next as well)
>=20
> Regards,
> Bjorn
