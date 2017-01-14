Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v1 1/6] rpmsg: virtio_rpmsg: set rpmsg_buf_size
 customizable
Date: Sat, 14 Jan 2017 19:23:02 +0000
Message-ID: <3c2bd29a711e4f9393d51140cac4e5af@SFHDAG7NODE2.st.com>
References: <1481142941-15616-1-git-send-email-loic.pallardy@st.com>
 <1481142941-15616-2-git-send-email-loic.pallardy@st.com>
 <1bcd718a-1f5b-68ea-fc00-2bae276babd7@ti.com>
In-Reply-To: <1bcd718a-1f5b-68ea-fc00-2bae276babd7@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Suman Anna <s-anna@ti.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Suman Anna [mailto:s-anna@ti.com]
> Sent: Saturday, January 14, 2017 2:40 AM
> To: Loic PALLARDY <loic.pallardy@st.com>; bjorn.andersson@linaro.org;
> ohad@wizery.com; lee.jones@linaro.org; Patrice CHOTARD
> <patrice.chotard@st.com>
> Cc: linux-remoteproc@vger.kernel.org; kernel@stlinux.com
> Subject: Re: [PATCH v1 1/6] rpmsg: virtio_rpmsg: set rpmsg_buf_size
> customizable
>=20
> On 12/07/2016 02:35 PM, Loic Pallardy wrote:
> > Rpmsg buffer size is currently fixed to 512 bytes.
> > This patch introduces a new capability in struct virtproc_info to tune
> > shared buffer size between host and coprocessor according to the
> > needs.
>=20
> This patch breaks rpmsg functionality w.r.t bisectability. The new buf_si=
ze
> variable is not initialized (is 0) in this patch while you replace the
> RPMSG_BUF_SIZE with vrp->buf_size in most call sites. You introduce the
> initialization in Patch 4, that should be moved up. The ops to override c=
an
> stay in Patch 4.

Exact vrp->buf_size should be forced to MAX_RPMSG_BUF_SIZE (512) to preserv=
e virtio_rpmsg behavior.
Thanks,
Loic
>=20
> regards
> Suman
>=20
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c
> > b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 3090b0d..1f6dfc6 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -45,6 +45,7 @@
> >   * @rbufs:	kernel address of rx buffers
> >   * @sbufs:	kernel address of tx buffers
> >   * @num_bufs:	total number of buffers for rx and tx
> > + * @buf_size:   size of one rx or tx buffer
> >   * @last_sbuf:	index of last tx buffer used
> >   * @bufs_dma:	dma base addr of the buffers
> >   * @tx_lock:	protects svq, sbufs and sleepers, to allow concurrent
> senders.
> > @@ -65,6 +66,7 @@ struct virtproc_info {
> >  	struct virtqueue *rvq, *svq;
> >  	void *rbufs, *sbufs;
> >  	unsigned int num_bufs;
> > +	unsigned int buf_size;
> >  	int last_sbuf;
> >  	dma_addr_t bufs_dma;
> >  	struct mutex tx_lock;
> > @@ -158,7 +160,7 @@ struct virtio_rpmsg_channel {
> >   * processor.
> >   */
> >  #define MAX_RPMSG_NUM_BUFS	(512)
> > -#define RPMSG_BUF_SIZE		(512)
> > +#define MAX_RPMSG_BUF_SIZE	(512)
> >
> >  /*
> >   * Local addresses are dynamically allocated on-demand.
> > @@ -429,7 +431,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp=
)
> >  	 * (half of our buffers are used for sending messages)
> >  	 */
> >  	if (vrp->last_sbuf < vrp->num_bufs / 2)
> > -		ret =3D vrp->sbufs + RPMSG_BUF_SIZE * vrp->last_sbuf++;
> > +		ret =3D vrp->sbufs + vrp->buf_size * vrp->last_sbuf++;
> >  	/* or recycle a used one */
> >  	else
> >  		ret =3D virtqueue_get_buf(vrp->svq, &len); @@ -555,7 +557,7
> @@ static
> > int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> >  	 * messaging), or to improve the buffer allocator, to support
> >  	 * variable-length buffer sizes.
> >  	 */
> > -	if (len > RPMSG_BUF_SIZE - sizeof(struct rpmsg_hdr)) {
> > +	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
> >  		dev_err(dev, "message is too big (%d)\n", len);
> >  		return -EMSGSIZE;
> >  	}
> > @@ -696,8 +698,8 @@ static int rpmsg_recv_single(struct virtproc_info
> *vrp, struct device *dev,
> >  	 * We currently use fixed-sized buffers, so trivially sanitize
> >  	 * the reported payload length.
> >  	 */
> > -	if (len > RPMSG_BUF_SIZE ||
> > -	    msg->len > (len - sizeof(struct rpmsg_hdr))) {
> > +	if (len > vrp->buf_size ||
> > +		msg->len > (len - sizeof(struct rpmsg_hdr))) {
> >  		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg-
> >len);
> >  		return -EINVAL;
> >  	}
> > @@ -729,7 +731,7 @@ static int rpmsg_recv_single(struct virtproc_info
> *vrp, struct device *dev,
> >  		dev_warn(dev, "msg received with no recipient\n");
> >
> >  	/* publish the real size of the buffer */
> > -	sg_init_one(&sg, msg, RPMSG_BUF_SIZE);
> > +	sg_init_one(&sg, msg, vrp->buf_size);
> >
> >  	/* add the buffer back to the remote processor's virtqueue */
> >  	err =3D virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL); @@
> > -886,7 +888,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	else
> >  		vrp->num_bufs =3D MAX_RPMSG_NUM_BUFS;
> >
> > -	total_buf_space =3D vrp->num_bufs * RPMSG_BUF_SIZE;
> > +	total_buf_space =3D vrp->num_bufs * vrp->buf_size;
> >
> >  	/* allocate coherent memory for the buffers */
> >  	bufs_va =3D dma_alloc_coherent(vdev->dev.parent->parent,
> > @@ -909,9 +911,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	/* set up the receive buffers */
> >  	for (i =3D 0; i < vrp->num_bufs / 2; i++) {
> >  		struct scatterlist sg;
> > -		void *cpu_addr =3D vrp->rbufs + i * RPMSG_BUF_SIZE;
> > +		void *cpu_addr =3D vrp->rbufs + i * vrp->buf_size;
> >
> > -		sg_init_one(&sg, cpu_addr, RPMSG_BUF_SIZE);
> > +		sg_init_one(&sg, cpu_addr, vrp->buf_size);
> >
> >  		err =3D virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
> >  					  GFP_KERNEL);
> > @@ -976,7 +978,7 @@ static int rpmsg_remove_device(struct device *dev,
> > void *data)  static void rpmsg_remove(struct virtio_device *vdev)  {
> >  	struct virtproc_info *vrp =3D vdev->priv;
> > -	size_t total_buf_space =3D vrp->num_bufs * RPMSG_BUF_SIZE;
> > +	size_t total_buf_space =3D vrp->num_bufs * vrp->buf_size;
> >  	int ret;
> >
> >  	vdev->config->reset(vdev);
> >
