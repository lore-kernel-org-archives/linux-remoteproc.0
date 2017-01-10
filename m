Return-Path: <marek.novak@nxp.com>
From: Marek Novak <marek.novak@nxp.com>
Subject: Re: [PATCH v2 1/1] rpmsg: virtio_rpmsg_bus: fix channel creation
Date: Tue, 10 Jan 2017 08:05:23 +0000
Message-ID: <DB6PR0402MB2870B0DD5BB865A916E11637F0670@DB6PR0402MB2870.eurprd04.prod.outlook.com>
References: <1481813396-1529-1-git-send-email-loic.pallardy@st.com>,<20170110075107.GC2155@dell>
In-Reply-To: <20170110075107.GC2155@dell>
Content-Language: cs-CZ
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Loic Pallardy <loic.pallardy@st.com>
Cc: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>, "patrice.chotard@st.com" <patrice.chotard@st.com>, Lee
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, 15 Dec 2016, Loic Pallardy wrote:

> Since commit 4dffed5b3ac796b ("rpmsg: Name rpmsg devices based on
> channel id"), it is no more possible for a firmware to register twice
> a service (on different endpoints). rpmsg_register_device function
> is failing when calling device_add for the second time as second
> device has the same name as first one already register.
> It is because name is based only on service name and so is not more
> unique. Previously name was unique thanks to the use of rpmsg_dev_index.
>=20
> This patch adds destination and source endpoint numbers device name to
> create an unique identifier.
>=20
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
> v2: Update commit header with commit ID generating regression
> Fix rpmsg_core instead of virtio_rpmsg
>=20
>=A0 drivers/rpmsg/rpmsg_core.c | 4 ++--
>=A0 1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Marek Novak <marek.novak@nxp.com>

> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index a79cb5a..18c73e0 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -453,8 +453,8 @@ int rpmsg_register_device(struct rpmsg_device *rpdev)
>=A0=A0=A0=A0=A0=A0=A0 struct device *dev =3D &rpdev->dev;
>=A0=A0=A0=A0=A0=A0=A0 int ret;
>=A0=20
> -=A0=A0=A0=A0 dev_set_name(&rpdev->dev, "%s:%s",
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_name(dev->parent=
), rpdev->id.name);
> +=A0=A0=A0=A0 dev_set_name(&rpdev->dev, "%s.%d.%d.%s", dev_name(dev->pare=
nt),
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rpdev->src, rpdev->d=
st, rpdev->id.name);
>=A0=20
>=A0=A0=A0=A0=A0=A0=A0 rpdev->dev.bus =3D &rpmsg_bus;
>=A0=A0=A0=A0=A0=A0=A0 rpdev->dev.release =3D rpmsg_release_device;

--=20
Marek Novak
Multicore Software Engineer
NXP Semiconductors
