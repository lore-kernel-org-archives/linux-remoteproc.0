Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 03/14] rpmsg: rpmsg_send() operations takes
 rpmsg_endpoint
Date: Thu, 18 Aug 2016 07:36:09 +0000
Message-ID: <D0C04901035AEF47BB4C8387F4AA41F53C5CB2@SAFEX1NODE23.st.com>
References: <1471306640-29917-1-git-send-email-bjorn.andersson@linaro.org>
 <1471306640-29917-4-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1471306640-29917-4-git-send-email-bjorn.andersson@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-
> owner@vger.kernel.org] On Behalf Of Bjorn Andersson
> Sent: Tuesday, August 16, 2016 2:17 AM
> To: Ohad Ben-Cohen <ohad@wizery.com>; Bjorn Andersson
> <bjorn.andersson@linaro.org>
> Cc: linux-remoteproc@vger.kernel.org; linux-arm-msm@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [PATCH 03/14] rpmsg: rpmsg_send() operations takes
> rpmsg_endpoint
>=20
> The rpmsg_send() operations has been taking a rpmsg_device, but this
> forces users of secondary rpmsg_endpoints to use the rpmsg_sendto()
> interface - by extracting source and destination from the given data
> structures. If we instead pass the rpmsg_endpoint to these functions a
> service can use rpmsg_sendto() to respond to messages, even on secondary
> endpoints.
>=20
> In addition this would allow us to support operations on multiple
> channels in future backends that does not support off-channel
> operations.
>=20
Hi Bjorn,

This patch is modifying rpmsg API by using rpmsg_endpoint as argument
instead of rpmsg_device.
But associated port of rpmsg_client_sample driver is missing in your patch =
series.

Please find inline few comments.

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c |  4 +--
>  include/linux/rpmsg.h            | 70 +++++++++++++++++++++++-----------=
------
>  2 files changed, 42 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c
> b/drivers/rpmsg/virtio_rpmsg_bus.c
> index c4bd89ea7681..1b63f4b7c2bd 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -382,7 +382,7 @@ static int rpmsg_dev_probe(struct device *dev)
>  		nsm.addr =3D rpdev->src;

Since endpoint is now used to indicate source, I'm wondering if it is possi=
ble
to suppress src field from struct rpmsg_channel and rely only on endpoint a=
ddr?
Else maybe confusing (which src addr used at the end: rpdev or ept?)

>  		nsm.flags =3D RPMSG_NS_CREATE;
>=20
> -		err =3D rpmsg_sendto(rpdev, &nsm, sizeof(nsm),
> RPMSG_NS_ADDR);
> +		err =3D rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm),
> RPMSG_NS_ADDR);
>  		if (err)
>  			dev_err(dev, "failed to announce service %d\n", err);
>  	}
> @@ -407,7 +407,7 @@ static int rpmsg_dev_remove(struct device *dev)
>  		nsm.addr =3D rpdev->src;
>  		nsm.flags =3D RPMSG_NS_DESTROY;
>=20
> -		err =3D rpmsg_sendto(rpdev, &nsm, sizeof(nsm),
> RPMSG_NS_ADDR);
> +		err =3D rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm),
> RPMSG_NS_ADDR);
>  		if (err)
>  			dev_err(dev, "failed to announce service %d\n", err);
>  	}
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index 2b97c711a5e3..88e302c011e6 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -193,13 +193,14 @@ rpmsg_send_offchannel_raw(struct
> rpmsg_channel *, u32, u32, void *, int, bool);
>=20
>  /**
>   * rpmsg_send() - send a message across to the remote processor
> - * @rpdev: the rpmsg channel
> + * @ept: the rpmsg endpoint
>   * @data: payload of message
>   * @len: length of payload
>   *
> - * This function sends @data of length @len on the @rpdev channel.
> - * The message will be sent to the remote processor which the @rpdev
> - * channel belongs to, using @rpdev's source and destination addresses.
> + * This function sends @data of length @len on the @ept endpoint.
> + * The message will be sent to the remote processor which the @ept
> + * endpoint belongs to, using @ept's address and its associated rpmsg
> + * device destination addresses.
>   * In case there are no TX buffers available, the function will block un=
til
>   * one becomes available, or a timeout of 15 seconds elapses. When the
> latter
>   * happens, -ERESTARTSYS is returned.
> @@ -208,23 +209,24 @@ rpmsg_send_offchannel_raw(struct
> rpmsg_channel *, u32, u32, void *, int, bool);
>   *
>   * Returns 0 on success and an appropriate error value on failure.
>   */
> -static inline int rpmsg_send(struct rpmsg_channel *rpdev, void *data, in=
t
> len)
> +static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int
> len)
>  {
> -	u32 src =3D rpdev->src, dst =3D rpdev->dst;
> +	struct rpmsg_channel *rpdev =3D ept->rpdev;
> +	u32 src =3D ept->addr, dst =3D rpdev->dst;
As this function is part of rpmsg API, it will be good to verify pointers b=
efore use.
>=20
>  	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, true);
>  }
>=20
>  /**
>   * rpmsg_sendto() - send a message across to the remote processor, speci=
fy
> dst
> - * @rpdev: the rpmsg channel
> + * @ept: the rpmsg endpoint
>   * @data: payload of message
>   * @len: length of payload
>   * @dst: destination address
>   *
>   * This function sends @data of length @len to the remote @dst address.
> - * The message will be sent to the remote processor which the @rpdev
> - * channel belongs to, using @rpdev's source address.
> + * The message will be sent to the remote processor which the @ept
> + * endpoint belongs to, using @ept's address as source.
>   * In case there are no TX buffers available, the function will block un=
til
>   * one becomes available, or a timeout of 15 seconds elapses. When the
> latter
>   * happens, -ERESTARTSYS is returned.
> @@ -234,16 +236,17 @@ static inline int rpmsg_send(struct rpmsg_channel
> *rpdev, void *data, int len)
>   * Returns 0 on success and an appropriate error value on failure.
>   */
>  static inline
> -int rpmsg_sendto(struct rpmsg_channel *rpdev, void *data, int len, u32 d=
st)
> +int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 ds=
t)
>  {
> -	u32 src =3D rpdev->src;
> +	struct rpmsg_channel *rpdev =3D ept->rpdev;
> +	u32 src =3D ept->addr;
ditto

>=20
>  	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, true);
>  }
>=20
>  /**
>   * rpmsg_send_offchannel() - send a message using explicit src/dst
> addresses
> - * @rpdev: the rpmsg channel
> + * @ept: the rpmsg endpoint
>   * @src: source address
>   * @dst: destination address
>   * @data: payload of message
> @@ -251,8 +254,8 @@ int rpmsg_sendto(struct rpmsg_channel *rpdev, void
> *data, int len, u32 dst)
>   *
>   * This function sends @data of length @len to the remote @dst address,
>   * and uses @src as the source address.
> - * The message will be sent to the remote processor which the @rpdev
> - * channel belongs to.
> + * The message will be sent to the remote processor which the @ept
> + * endpoint belongs to.
>   * In case there are no TX buffers available, the function will block un=
til
>   * one becomes available, or a timeout of 15 seconds elapses. When the
> latter
>   * happens, -ERESTARTSYS is returned.
> @@ -262,21 +265,24 @@ int rpmsg_sendto(struct rpmsg_channel *rpdev,
> void *data, int len, u32 dst)
>   * Returns 0 on success and an appropriate error value on failure.
>   */
>  static inline
> -int rpmsg_send_offchannel(struct rpmsg_channel *rpdev, u32 src, u32 dst,
> +int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  			  void *data, int len)
>  {
> +	struct rpmsg_channel *rpdev =3D ept->rpdev;
ditto
> +
>  	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, true);
>  }
>=20
>  /**
>   * rpmsg_send() - send a message across to the remote processor
Function name and description not aligned with code.
Should be rpmsg_trysend
May be in another patch...

> - * @rpdev: the rpmsg channel
> + * @ept: the rpmsg endpoint
>   * @data: payload of message
>   * @len: length of payload
>   *
> - * This function sends @data of length @len on the @rpdev channel.
> - * The message will be sent to the remote processor which the @rpdev
> - * channel belongs to, using @rpdev's source and destination addresses.
> + * This function sends @data of length @len on the @ept endpoint.
> + * The message will be sent to the remote processor which the @ept
> + * endpoint belongs to, using @ept's addres as source and its associated
> + * rpdev's address as destination.
>   * In case there are no TX buffers available, the function will immediat=
ely
>   * return -ENOMEM without waiting until one becomes available.
>   *
> @@ -285,23 +291,24 @@ int rpmsg_send_offchannel(struct rpmsg_channel
> *rpdev, u32 src, u32 dst,
>   * Returns 0 on success and an appropriate error value on failure.
>   */
>  static inline
> -int rpmsg_trysend(struct rpmsg_channel *rpdev, void *data, int len)
> +int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
>  {
> -	u32 src =3D rpdev->src, dst =3D rpdev->dst;
> +	struct rpmsg_channel *rpdev =3D ept->rpdev;
> +	u32 src =3D ept->addr, dst =3D rpdev->dst;
Pointer check before use
>=20
>  	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
>  }
>=20
>  /**
>   * rpmsg_sendto() - send a message across to the remote processor, speci=
fy
> dst
Function name should be rpmsg_trysendto
> - * @rpdev: the rpmsg channel
> + * @ept: the rpmsg endpoint
>   * @data: payload of message
>   * @len: length of payload
>   * @dst: destination address
>   *
>   * This function sends @data of length @len to the remote @dst address.
> - * The message will be sent to the remote processor which the @rpdev
> - * channel belongs to, using @rpdev's source address.
> + * The message will be sent to the remote processor which the @ept
> + * endpoint belongs to, using @ept's address as source.
>   * In case there are no TX buffers available, the function will immediat=
ely
>   * return -ENOMEM without waiting until one becomes available.
>   *
> @@ -310,16 +317,17 @@ int rpmsg_trysend(struct rpmsg_channel *rpdev,
> void *data, int len)
>   * Returns 0 on success and an appropriate error value on failure.
>   */
>  static inline
> -int rpmsg_trysendto(struct rpmsg_channel *rpdev, void *data, int len, u3=
2
> dst)
> +int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32
> dst)
>  {
> -	u32 src =3D rpdev->src;
> +	struct rpmsg_channel *rpdev =3D ept->rpdev;
> +	u32 src =3D ept->addr;
Check pointer before use
>=20
>  	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
>  }
>=20
>  /**
>   * rpmsg_send_offchannel() - send a message using explicit src/dst
> addresses
Description for rpmsg_trysend_offchannel...

> - * @rpdev: the rpmsg channel
> + * @ept: the rpmsg endpoint
>   * @src: source address
>   * @dst: destination address
>   * @data: payload of message
> @@ -327,8 +335,8 @@ int rpmsg_trysendto(struct rpmsg_channel *rpdev,
> void *data, int len, u32 dst)
>   *
>   * This function sends @data of length @len to the remote @dst address,
>   * and uses @src as the source address.
> - * The message will be sent to the remote processor which the @rpdev
> - * channel belongs to.
> + * The message will be sent to the remote processor which the @ept
> + * endpoint belongs to.
>   * In case there are no TX buffers available, the function will immediat=
ely
>   * return -ENOMEM without waiting until one becomes available.
>   *
> @@ -337,9 +345,11 @@ int rpmsg_trysendto(struct rpmsg_channel *rpdev,
> void *data, int len, u32 dst)
>   * Returns 0 on success and an appropriate error value on failure.
>   */
>  static inline
> -int rpmsg_trysend_offchannel(struct rpmsg_channel *rpdev, u32 src, u32
> dst,
> +int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32
> dst,
>  			     void *data, int len)
>  {
> +	struct rpmsg_channel *rpdev =3D ept->rpdev;
> +
Point check before use
>  	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
>  }

Regards,
Loic=20

>=20
> --
> 2.5.0
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remotepro=
c" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
