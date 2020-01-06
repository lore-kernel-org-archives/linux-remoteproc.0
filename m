Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v4 1/1] remoteproc: add support for co-processor loaded
 and booted before kernel
Date: Mon, 6 Jan 2020 14:53:49 +0000
Message-ID: <74f82823df134c0aa19b3922b65eb912@SFHDAG7NODE2.st.com>
References: <1574940831-7433-1-git-send-email-loic.pallardy@st.com>
 <20191229053037.GU3108315@builder>
In-Reply-To: <20191229053037.GU3108315@builder>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "Fabien DESSENNE  <fabien.dessenne@st.com>, s-anna@ti.com" <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> Sent: dimanche 29 d=E9cembre 2019 06:31
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org; Fabien DESSENNE
> <fabien.dessenne@st.com>; s-anna@ti.com
> Subject: Re: [PATCH v4 1/1] remoteproc: add support for co-processor
> loaded and booted before kernel
>=20
> On Thu 28 Nov 03:33 PST 2019, Loic Pallardy wrote:
>=20
> > Remote processor could boot independently or be loaded/started before
> > Linux kernel by bootloader or any firmware.
> > This patch introduces a new property in rproc core, named skip_fw_load,
> > to be able to allocate resources and sub-devices like vdev and to
> > synchronize with current state without loading firmware from file syste=
m.
> > It is platform driver responsibility to implement the right firmware
> > load ops according to HW specificities.
> >
>=20
> I was going to apply the patch, as I like what it actually does. But I'm
> concerned about how you're going to use it (which you fail to show in
> this single patch). Just two things below.
>=20
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >
> > ---
> > Change from v3:
> > - add comment about firmware NULL pointer
> > - add Mathieu Poirier Ack
> > Change from v2:
> > - rename property into skip_fw_load
> > - update rproc_boot and rproc_fw_boot description
> > - update commit message
> > Change from v1:
> > - Keep bool in struct rproc
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 67
> ++++++++++++++++++++++++++++--------
> >  include/linux/remoteproc.h           |  2 ++
> >  2 files changed, 55 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> > index 307df98347ba..367a7929b7a0 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1358,8 +1358,19 @@ static int rproc_start(struct rproc *rproc, cons=
t
> struct firmware *fw)
> >  	return ret;
> >  }
> >
> > -/*
> > - * take a firmware and boot a remote processor with it.
> > +/**
> > + * rproc_fw_boot() - boot specified remote processor according to
> specified
> > + * firmware
> > + * @rproc: handle of a remote processor
> > + * @fw: pointer on firmware to handle
> > + *
> > + * Handle resources defined in resource table, load firmware and
> > + * start remote processor.
> > + *
> > + * If firmware pointer fw is NULL, firmware is not handled by remotepr=
oc
> > + * core, but under the responsibility of platform driver.
> > + *
> > + * Returns 0 on success, and an appropriate error value otherwise.
> >   */
> >  static int rproc_fw_boot(struct rproc *rproc, const struct firmware *f=
w)
> >  {
> > @@ -1371,7 +1382,11 @@ static int rproc_fw_boot(struct rproc *rproc,
> const struct firmware *fw)
> >  	if (ret)
> >  		return ret;
> >
> > -	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
> > +	if (fw)
> > +		dev_info(dev, "Booting fw image %s, size %zd\n", name,
> > +			 fw->size);
> > +	else
> > +		dev_info(dev, "Synchronizing with preloaded co-
> processor\n");
>=20
> This log line implies that ops->start() doesn't actually start the
> remoteproc, but it sounds like a remote proc with skip_fw_load actually
> would boot the remote processor, but with some pre-existing firmware.
>=20
> As such it makes more sense, in this patch, to print "Booting\n" here.
>=20
>=20
In fact we have two use cases:
- coprocessor is booting before kernel start and so rproc platform driver s=
tart function will do a nop start
- coprocessor is preloaded but not started, and rproc platform driver will =
handle coprocessor start
As it is platform driver that is setting  "skip_fw_load" value, its start f=
unction need to be aligned with supported use case.

So rproc core doesn't know about coprocessor current state (booted or not).
To keep consistency between both messages, I can propose "Booting preloaded=
 coprocessor\n".

> But I presume you have a platform driver with a nop start()
> implementation and no ability to reload the firmware on a crash?

Yes exactly.

>=20
> >
> >  	/*
> >  	 * if enabling an IOMMU isn't relevant for this rproc, this is
> > @@ -1718,16 +1733,22 @@ static void rproc_crash_handler_work(struct
> work_struct *work)
> >   * rproc_boot() - boot a remote processor
> >   * @rproc: handle of a remote processor
> >   *
> > - * Boot a remote processor (i.e. load its firmware, power it on, ...).
> > + * Boot a remote processor (i.e. load its firmware, power it on, ...) =
from
> > + * different contexts:
> > + * - power off
> > + * - preloaded firmware
> > + * - started before kernel execution
> > + * The different operations are selected thanks to properties defined =
by
> > + * platform driver.
> >   *
> > - * If the remote processor is already powered on, this function
> immediately
> > - * returns (successfully).
> > + * If the remote processor is already powered on at rproc level, this
> function
> > + * immediately returns (successfully).
> >   *
> >   * Returns 0 on success, and an appropriate error value otherwise.
> >   */
> >  int rproc_boot(struct rproc *rproc)
> >  {
> > -	const struct firmware *firmware_p;
> > +	const struct firmware *firmware_p =3D NULL;
> >  	struct device *dev;
> >  	int ret;
> >
> > @@ -1758,11 +1779,20 @@ int rproc_boot(struct rproc *rproc)
> >
> >  	dev_info(dev, "powering up %s\n", rproc->name);
> >
> > -	/* load firmware */
> > -	ret =3D request_firmware(&firmware_p, rproc->firmware, dev);
> > -	if (ret < 0) {
> > -		dev_err(dev, "request_firmware failed: %d\n", ret);
> > -		goto downref_rproc;
> > +	if (!rproc->skip_fw_load) {
> > +		/* load firmware */
> > +		ret =3D request_firmware(&firmware_p, rproc->firmware,
> dev);
> > +		if (ret < 0) {
> > +			dev_err(dev, "request_firmware failed: %d\n", ret);
> > +			goto downref_rproc;
> > +		}
> > +	} else {
> > +		/*
> > +		 * Set firmware name pointer to null as remoteproc core is
> not
> > +		 * in charge of firmware loading
> > +		 */
> > +		kfree(rproc->firmware);
> > +		rproc->firmware =3D NULL;
>=20
> Why do this on every boot? Why don't you change rproc_alloc() to never
> populate rproc->firmware?

Because state of " skip_fw_load" could be changed dynamically by platform d=
river during the product life time.
By example, we can boot an initial firmware by U-Boot to start a feature as=
 fast as possible like a camera preview and then wait for customer applicat=
ion launch to stop and restart the coprocessor on a new firmware provided b=
y customer...
In that case, platform driver will set skip_fw_load variable to disabled on=
 rproc stop request to allow rproc core to load customer firmware at next b=
oot request.

Regards,
Loic
>=20
> Regards,
> Bjorn
>=20
> >  	}
> >
> >  	ret =3D rproc_fw_boot(rproc, firmware_p);
> > @@ -1916,8 +1946,17 @@ int rproc_add(struct rproc *rproc)
> >  	/* create debugfs entries */
> >  	rproc_create_debug_dir(rproc);
> >
> > -	/* if rproc is marked always-on, request it to boot */
> > -	if (rproc->auto_boot) {
> > +	if (rproc->skip_fw_load) {
> > +		/*
> > +		 * If rproc is marked already booted, no need to wait
> > +		 * for firmware.
> > +		 * Just handle associated resources and start sub devices
> > +		 */
> > +		ret =3D rproc_boot(rproc);
> > +		if (ret < 0)
> > +			return ret;
> > +	} else if (rproc->auto_boot) {
> > +		/* if rproc is marked always-on, request it to boot */
> >  		ret =3D rproc_trigger_auto_boot(rproc);
> >  		if (ret < 0)
> >  			return ret;
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 16ad66683ad0..4fd5bedab4fa 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -479,6 +479,7 @@ struct rproc_dump_segment {
> >   * @table_sz: size of @cached_table
> >   * @has_iommu: flag to indicate if remote processor is behind an MMU
> >   * @auto_boot: flag to indicate if remote processor should be auto-sta=
rted
> > + * @skip_fw_load: remote processor has been preloaded before start
> sequence
> >   * @dump_segments: list of segments in the firmware
> >   * @nb_vdev: number of vdev currently handled by rproc
> >   */
> > @@ -512,6 +513,7 @@ struct rproc {
> >  	size_t table_sz;
> >  	bool has_iommu;
> >  	bool auto_boot;
> > +	bool skip_fw_load;
> >  	struct list_head dump_segments;
> >  	int nb_vdev;
> >  };
> > --
> > 2.7.4
> >
