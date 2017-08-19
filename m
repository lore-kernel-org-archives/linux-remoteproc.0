Return-Path: <tomas.winkler@intel.com>
From: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: RE: [PATCH 05/15] mei: make device_type const
Date: Sat, 19 Aug 2017 16:48:37 +0000
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B749EFDE4@hasmsx108.ger.corp.intel.com>
References: <1503130946-2854-1-git-send-email-bhumirks@gmail.com>
 <1503130946-2854-6-git-send-email-bhumirks@gmail.com>
In-Reply-To: <1503130946-2854-6-git-send-email-bhumirks@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Return-Path: tomas.winkler@intel.com
To: Bhumika Goyal <bhumirks@gmail.com>, "julia.lawall@lip6.fr" <julia.lawall@lip6.fr>, "bp@alien8.de" <bp@alien8.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "Vetter, Daniel" <daniel.vetter@intel.com>, "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "seanpaul@chromium.org" <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, "g.liakhovetski@gmx.de" <g.liakhovetski@gmx.de>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>, "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, "peda@axentia.se" <peda@axentia.se>, "kishon@ti.com" <kishon@ti.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "andy@infradead.org" <andy@infradead.org>, "ohad@wizery.com" <ohad@wizery.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "freude@de.ibm.com" <freude@de.ibm.com>, "schwidefsky@de.ibm.com" <schwidefsky@de.ibm.com>, "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>, "jth@kernel.org" <jth@kernel.org>, "jejb@linux.vnet.ibm.com" <jejb@linux.vnet.ibm.com>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "lduncan@suse.com" <lduncan@suse.com>, "cleech@redhat.com" <cleech@redhat.com>, "johan@kernel.org" <johan@kernel.org>, "elder@kernel.org" <elder@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "fcoe-devel@open-fcoe.org" <fcoe-devel@open-fcoe.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "open-iscsi@googlegroups.com" <open-iscsi@googlegroups.com>, "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>


> Subject: [PATCH 05/15] mei: make device_type const
>=20
> Make this const as it is only stored in the type field of a device struct=
ure,
> which is const.
> Done using Coccinelle.
>=20
> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> ---
>  drivers/misc/mei/bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c index
> 40c7908..1ac10cb 100644
> --- a/drivers/misc/mei/bus.c
> +++ b/drivers/misc/mei/bus.c
> @@ -845,7 +845,7 @@ static void mei_cl_bus_dev_release(struct device
> *dev)
>  	kfree(cldev);
>  }
>=20
> -static struct device_type mei_cl_device_type =3D {
> +static const struct device_type mei_cl_device_type =3D {
>  	.release	=3D mei_cl_bus_dev_release,
>  };
>=20
LGTM
Thanks
Tomas=20
