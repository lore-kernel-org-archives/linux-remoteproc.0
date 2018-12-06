Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 6/7] remoteproc: fix trace buffer va initialization
Date: Thu, 6 Dec 2018 20:37:05 +0000
Message-ID: <1a6e9b2e45c54d4183370e827e0e2891@SFHDAG7NODE2.st.com>
References: <1543526968-56091-1-git-send-email-loic.pallardy@st.com>
 <1543526968-56091-7-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1543526968-56091-7-git-send-email-loic.pallardy@st.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Arnaud POULIQUEN  <arnaud.pouliquen@st.com>, benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "s-anna@ti.com" <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Loic PALLARDY
> Sent: jeudi 29 novembre 2018 22:29
> To: bjorn.andersson@linaro.org; ohad@wizery.com
> Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org;
> Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org; s-anna@ti.com; Loic PALLARDY
> <loic.pallardy@st.com>
> Subject: [PATCH 6/7] remoteproc: fix trace buffer va initialization
>=20
> With rproc_alloc_registered_carveouts() introduction, carveouts are
> allocated after resource table parsing.
> rproc_da_to_va() may return NULL at trace resource registering.
> This patch modifies trace debufs registering to provide device address
> (da) instead of va.
> da to va translation is done at each trace buffer access
> through debugfs interface.
>=20
> Fixes: d7c51706d095 ("remoteproc: add alloc ops in rproc_mem_entry
> struct")
>=20
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c     | 26 ++++++++++----------------
>  drivers/remoteproc/remoteproc_debugfs.c  | 21 +++++++++++++++++----
>  drivers/remoteproc/remoteproc_internal.h |  9 ++++++++-
>  3 files changed, 35 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index f19bc6961e40..9dbcc16f8782 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -562,9 +562,8 @@ void rproc_vdev_release(struct kref *ref)
>  static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *=
rsc,
>  			      int offset, int avail)
>  {
> -	struct rproc_mem_entry *trace;
> +	struct rproc_debug_trace *trace;
>  	struct device *dev =3D &rproc->dev;
> -	void *ptr;
>  	char name[15];
>=20
>  	if (sizeof(*rsc) > avail) {
> @@ -578,28 +577,23 @@ static int rproc_handle_trace(struct rproc *rproc,
> struct fw_rsc_trace *rsc,
>  		return -EINVAL;
>  	}
>=20
> -	/* what's the kernel address of this resource ? */
> -	ptr =3D rproc_da_to_va(rproc, rsc->da, rsc->len);
> -	if (!ptr) {
> -		dev_err(dev, "erroneous trace resource entry\n");
> -		return -EINVAL;
> -	}
> -
>  	trace =3D kzalloc(sizeof(*trace), GFP_KERNEL);
>  	if (!trace)
>  		return -ENOMEM;
>=20
>  	/* set the trace buffer dma properties */
> -	trace->len =3D rsc->len;
> -	trace->va =3D ptr;
> +	trace->trace_mem.len =3D rsc->len;
> +	trace->trace_mem.da =3D rsc->da;
> +
> +	/* set pointer on rproc device */
> +	trace->rproc =3D rproc;
>=20
>  	/* make sure snprintf always null terminates, even if truncating */
>  	snprintf(name, sizeof(name), "trace%d", rproc->num_traces);
>=20
>  	/* create the debugfs entry */
> -	trace->priv =3D rproc_create_trace_file(name, rproc, trace);
> -	if (!trace->priv) {
> -		trace->va =3D NULL;
> +	trace->tfile =3D rproc_create_trace_file(name, rproc, trace);
> +	if (!trace->tfile) {
>  		kfree(trace);
>  		return -EINVAL;
>  	}
> @@ -608,8 +602,8 @@ static int rproc_handle_trace(struct rproc *rproc,
> struct fw_rsc_trace *rsc,
>=20
>  	rproc->num_traces++;
>=20
> -	dev_dbg(dev, "%s added: va %pK, da 0x%x, len 0x%x\n",
> -		name, ptr, rsc->da, rsc->len);
> +	dev_dbg(dev, "%s added: da 0x%x, len 0x%x\n",
> +		name, rsc->da, rsc->len);
>=20
>  	return 0;
>  }

rproc_resource_cleanup() modification not included in this patch. (lost dur=
ing rebase)
I'll post a v2.

Regards,
Loic

> diff --git a/drivers/remoteproc/remoteproc_debugfs.c
> b/drivers/remoteproc/remoteproc_debugfs.c
> index e90135c64af0..11240b4d0a91 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -47,10 +47,23 @@ static struct dentry *rproc_dbg;
>  static ssize_t rproc_trace_read(struct file *filp, char __user *userbuf,
>  				size_t count, loff_t *ppos)
>  {
> -	struct rproc_mem_entry *trace =3D filp->private_data;
> -	int len =3D strnlen(trace->va, trace->len);
> +	struct rproc_debug_trace *data =3D filp->private_data;
> +	struct rproc_mem_entry *trace =3D &data->trace_mem;
> +	void *va;
> +	char buf[100];
> +	int len;
> +
> +	va =3D rproc_da_to_va(data->rproc, trace->da, trace->len);
> +
> +	if (!va) {
> +		len =3D scnprintf(buf, sizeof(buf), "Trace %s not available\n",
> +				trace->name);
> +		va =3D buf;
> +	} else {
> +		len =3D strnlen(va, trace->len);
> +	}
>=20
> -	return simple_read_from_buffer(userbuf, count, ppos, trace->va,
> len);
> +	return simple_read_from_buffer(userbuf, count, ppos, va, len);
>  }
>=20
>  static const struct file_operations trace_rproc_ops =3D {
> @@ -288,7 +301,7 @@ void rproc_remove_trace_file(struct dentry *tfile)
>  }
>=20
>  struct dentry *rproc_create_trace_file(const char *name, struct rproc
> *rproc,
> -				       struct rproc_mem_entry *trace)
> +				       struct rproc_debug_trace *trace)
>  {
>  	struct dentry *tfile;
>=20
> diff --git a/drivers/remoteproc/remoteproc_internal.h
> b/drivers/remoteproc/remoteproc_internal.h
> index f6cad243d7ca..7d8936688164 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -25,6 +25,13 @@
>=20
>  struct rproc;
>=20
> +struct rproc_debug_trace {
> +	struct rproc *rproc;
> +	struct dentry *tfile;
> +	struct list_head node;
> +	struct rproc_mem_entry trace_mem;
> +};
> +
>  /* from remoteproc_core.c */
>  void rproc_release(struct kref *kref);
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> @@ -37,7 +44,7 @@ void rproc_remove_virtio_dev(struct rproc_vdev
> *rvdev);
>  /* from remoteproc_debugfs.c */
>  void rproc_remove_trace_file(struct dentry *tfile);
>  struct dentry *rproc_create_trace_file(const char *name, struct rproc
> *rproc,
> -				       struct rproc_mem_entry *trace);
> +				       struct rproc_debug_trace *trace);
>  void rproc_delete_debug_dir(struct rproc *rproc);
>  void rproc_create_debug_dir(struct rproc *rproc);
>  void rproc_init_debugfs(void);
> --
> 2.7.4
