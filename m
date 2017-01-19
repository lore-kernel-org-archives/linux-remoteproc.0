Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v1 1/3] remoteproc: st: add virtio communication support
Date: Thu, 19 Jan 2017 15:29:34 +0000
Message-ID: <e53cead2671040eba37b507d814747b7@SFHDAG7NODE2.st.com>
References: <1481142826-15528-1-git-send-email-loic.pallardy@st.com>
 <1481142826-15528-2-git-send-email-loic.pallardy@st.com>
 <20170118232343.GV10531@minitux>
In-Reply-To: <20170118232343.GV10531@minitux>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, January 19, 2017 12:24 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; lee.jones@linaro.org; Patrice CHOTARD
> <patrice.chotard@st.com>; linux-remoteproc@vger.kernel.org;
> kernel@stlinux.com
> Subject: Re: [PATCH v1 1/3] remoteproc: st: add virtio communication
> support
>=20
> On Wed 07 Dec 12:33 PST 2016, Loic Pallardy wrote:
>=20
> > This patch provides virtio communication support based on mailbox
> > for ST coprocessors.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/remoteproc/Kconfig         |   3 +
> >  drivers/remoteproc/st_remoteproc.c | 121
> ++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 123 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index 51d7ca0..fd275c0 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -119,6 +119,9 @@ config ST_REMOTEPROC
> >  	tristate "ST remoteproc support"
> >  	depends on ARCH_STI
> >  	depends on REMOTEPROC
> > +	select MAILBOX
> > +	select STI_MBOX
> > +	select RPMSG_VIRTIO
> >  	help
> >  	  Say y here to support ST's adjunct processors via the remote
> >  	  processor framework.
> > diff --git a/drivers/remoteproc/st_remoteproc.c
> b/drivers/remoteproc/st_remoteproc.c
> > index da4e152..113caf2 100644
> > --- a/drivers/remoteproc/st_remoteproc.c
> > +++ b/drivers/remoteproc/st_remoteproc.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/err.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mailbox_client.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > @@ -25,6 +26,17 @@
> >  #include <linux/remoteproc.h>
> >  #include <linux/reset.h>
> >
> > +#include "remoteproc_internal.h"
> > +
> > +#define ST_RPROC_MAX_VRING	2
> > +
> > +#define MBOX_RX			0
> > +#define MBOX_TX			1
> > +#define MBOX_MAX		2
> > +
> > +static struct mbox_client mbox_client_vq0;
> > +static struct mbox_client mbox_client_vq1;
> > +
> >  struct st_rproc_config {
> >  	bool			sw_reset;
> >  	bool			pwr_reset;
> > @@ -39,8 +51,45 @@ struct st_rproc {
> >  	u32			clk_rate;
> >  	struct regmap		*boot_base;
> >  	u32			boot_offset;
> > +	struct mbox_chan
> 	*mbox_chan[ST_RPROC_MAX_VRING][MBOX_MAX];
> >  };
> >
> > +static void st_rproc_mbox_callback(struct device *dev, u32 msg)
> > +{
> > +	struct rproc *rproc =3D dev_get_drvdata(dev);
> > +
> > +	if (rproc_vq_interrupt(rproc, msg) =3D=3D IRQ_NONE)
> > +		dev_dbg(dev, "no message was found in vqid %d\n", msg);
> > +}
> > +
> > +static void st_rproc_mbox_callback_vq0(struct mbox_client
> *mbox_client,
> > +				       void *data)
> > +{
> > +	st_rproc_mbox_callback(mbox_client->dev, 0);
> > +}
> > +
> > +static void st_rproc_mbox_callback_vq1(struct mbox_client
> *mbox_client,
> > +				       void *data)
> > +{
> > +	st_rproc_mbox_callback(mbox_client->dev, 1);
> > +}
> > +
> > +static void st_rproc_kick(struct rproc *rproc, int vqid)
> > +{
> > +	struct st_rproc *ddata =3D rproc->priv;
> > +	struct device *dev =3D rproc->dev.parent;
> > +	int ret;
> > +
> > +	/* send the index of the triggered virtqueue in the mailbox payload
> */
> > +	if (vqid < ST_RPROC_MAX_VRING) {
>=20
> If you flip this condition around and return if vqid >=3D
> ST_RPROC_MAX_VRING (probably with a WARN_ON() around it) you will
> save
> an indentation level and don't have to wrap the dev_err below.
OK I'll

>=20
> > +		ret =3D mbox_send_message(ddata-
> >mbox_chan[vqid][MBOX_TX],
> > +					(void *)&vqid);
> > +		if (ret < 0)
> > +			dev_err(dev,
> > +				"failed to send message via mbox: %d\n",
> ret);
> > +	}
> > +}
> > +
> >  static int st_rproc_start(struct rproc *rproc)
> >  {
> >  	struct st_rproc *ddata =3D rproc->priv;
> > @@ -108,6 +157,7 @@ static int st_rproc_stop(struct rproc *rproc)
> >  }
> >
> >  static struct rproc_ops st_rproc_ops =3D {
> > +	.kick		=3D st_rproc_kick,
> >  	.start		=3D st_rproc_start,
> >  	.stop		=3D st_rproc_stop,
> >  };
> > @@ -221,6 +271,7 @@ static int st_rproc_probe(struct platform_device
> *pdev)
> >  	struct st_rproc *ddata;
> >  	struct device_node *np =3D dev->of_node;
> >  	struct rproc *rproc;
> > +	struct mbox_chan *chan;
> >  	int enabled;
> >  	int ret;
> >
> > @@ -257,13 +308,76 @@ static int st_rproc_probe(struct platform_device
> *pdev)
> >  		clk_set_rate(ddata->clk, ddata->clk_rate);
> >  	}
> >
> > +	if (of_get_property(np, "mbox-names", NULL)) {
> > +		mbox_client_vq0.dev		=3D dev;
> > +		mbox_client_vq0.tx_done		=3D NULL;
> > +		mbox_client_vq0.tx_block	=3D false;
> > +		mbox_client_vq0.knows_txdone	=3D false;
> > +		mbox_client_vq0.rx_callback	=3D
> st_rproc_mbox_callback_vq0;
> > +
> > +		mbox_client_vq1.dev		=3D dev;
> > +		mbox_client_vq1.tx_done		=3D NULL;
> > +		mbox_client_vq1.tx_block	=3D false;
> > +		mbox_client_vq1.knows_txdone	=3D false;
> > +		mbox_client_vq1.rx_callback	=3D
> st_rproc_mbox_callback_vq1;
> > +
>=20
> As far as I can see these are const (although the mbox api doesn't
> declare the parameter as such), please fill them out as you declare the
> variables outside the function scope.
>
mbox_client can't be const as dev field must be set and is checked by mailb=
ox framework.
Patch v2 puts mbox_client_vq1 and mbox_client_vq2 in struct st_rproc_config=
 to be able to manage several coprocessors with rpmsg link.
=20
> > +		/*
> > +		 * To control a co-processor without IPC mechanism.
> > +		 * This driver can be used without mbox and rpmsg.
> > +		 */
> > +		chan =3D mbox_request_channel_byname(&mbox_client_vq0,
> "vq0_rx");
> > +		if (IS_ERR(chan)) {
> > +			dev_err(&rproc->dev, "failed to request mbox chan
> 0\n");
> > +			ret =3D PTR_ERR(chan);
> > +			goto free_rproc;
> > +		} else {
> > +			ddata->mbox_chan[0][MBOX_RX] =3D chan;
>=20
> No need to have these in else blocks, as the other code paths ends with
> a goto.
Yes true, I'll change

>=20
> > +		}
> > +
> > +		chan =3D mbox_request_channel_byname(&mbox_client_vq0,
> "vq0_tx");
> > +		if (IS_ERR(chan)) {
> > +			dev_err(&rproc->dev, "failed to request mbox chan
> 0\n");
> > +			ret =3D PTR_ERR(chan);
> > +			goto free_one;
> > +		} else {
> > +			ddata->mbox_chan[0][MBOX_TX] =3D chan;
> > +		}
> > +
> > +		chan =3D mbox_request_channel_byname(&mbox_client_vq1,
> "vq1_rx");
> > +		if (IS_ERR(chan)) {
> > +			dev_err(&rproc->dev, "failed to request mbox chan
> 1\n");
> > +			ret =3D PTR_ERR(chan);
> > +			goto free_two;
> > +		} else {
> > +			ddata->mbox_chan[1][MBOX_RX] =3D chan;
> > +		}
> > +
> > +		chan =3D mbox_request_channel_byname(&mbox_client_vq1,
> "vq1_tx");
> > +		if (IS_ERR(chan)) {
> > +			dev_err(&rproc->dev, "failed to request mbox chan
> 1\n");
> > +			ret =3D PTR_ERR(chan);
> > +			goto free_three;
> > +		} else {
> > +			ddata->mbox_chan[1][MBOX_TX] =3D chan;
> > +		}
> > +	}
> > +
> >  	ret =3D rproc_add(rproc);
> >  	if (ret)
> > -		goto free_rproc;
> > +		goto free_for;
> >
> >  	return 0;
> >
> > +free_for:
> > +	mbox_free_channel(ddata->mbox_chan[1][MBOX_TX]);
>=20
> If you flatten mbox_chan to a single-dimensional array you can loop over
> it like:
>=20
> for (i =3D 0; i < 4; i++)
> 	mbox_free_channel(ddata->mbox_chan[i]);
>=20
> And you don't need to check if they are still NULL because
> mbox_free_channel() handles that for you.
>=20
OK good point, I'll try this

> > +free_three:
> > +	mbox_free_channel(ddata->mbox_chan[1][MBOX_RX]);
> > +free_two:
> > +	mbox_free_channel(ddata->mbox_chan[0][MBOX_TX]);
> > +free_one:
> > +	mbox_free_channel(ddata->mbox_chan[0][MBOX_RX]);
> >  free_rproc:
> > +	clk_unprepare(ddata->clk);
>=20
> Nice catch, but I would like to have it in a separate patch - and it
> should not be done when st_rproc_parse_dt() returns an error.

Yes should be in a separate patch
>=20
> >  	rproc_free(rproc);
> >  	return ret;
> >  }
> > @@ -279,6 +393,11 @@ static int st_rproc_remove(struct platform_device
> *pdev)
> >
> >  	of_reserved_mem_device_release(&pdev->dev);
> >
> > +	mbox_free_channel(ddata->mbox_chan[0][MBOX_RX]);
> > +	mbox_free_channel(ddata->mbox_chan[1][MBOX_RX]);
> > +	mbox_free_channel(ddata->mbox_chan[0][MBOX_TX]);
> > +	mbox_free_channel(ddata->mbox_chan[1][MBOX_TX]);
> > +
>=20
> As with the error path in probe, this would be cleaner with a loop.
OK
Thanks Bjorn for the review, I'll send a v3.
>=20
> Regards,
> Bjorn
