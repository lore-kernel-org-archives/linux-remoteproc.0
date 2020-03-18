Return-Path: <mathieu.poirier@linaro.org>
MIME-Version: 1.0
References: <20200305224108.21351-1-s-anna@ti.com> <20200305224108.21351-3-s-anna@ti.com>
 <20200317180530.GA1801@xps15> <17204b55-2d58-d8cf-e504-6b6969afa987@ti.com>
In-Reply-To: <17204b55-2d58-d8cf-e504-6b6969afa987@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 18 Mar 2020 10:37:43 -0600
Message-ID: <CANLsYkzU_X1QfkMZigbNsxu2i2qsaq2oxojBuKR5uYFNXmsHgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: Fix and restore the parenting hierarchy
 for vdev
Content-Type: text/plain; charset="UTF-8"
To: Suman Anna <s-anna@ti.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Tero Kristo <t-kristo@ti.com>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 18 Mar 2020 at 09:00, Suman Anna <s-anna@ti.com> wrote:
>
> Hi Mathieu,
>
> On 3/17/20 1:05 PM, Mathieu Poirier wrote:
> > Hi Suman,
> >
> > On Thu, Mar 05, 2020 at 04:41:08PM -0600, Suman Anna wrote:
> >> The commit 086d08725d34 ("remoteproc: create vdev subdevice with specific
> >> dma memory pool") has introduced a new vdev subdevice for each vdev
> >> declared in the firmware resource table and made it as the parent for the
> >> created virtio rpmsg devices instead of the previous remoteproc device.
> >> This changed the overall parenting hierarchy for the rpmsg devices, which
> >> were children of virtio devices, and does not allow the corresponding
> >> rpmsg drivers to retrieve the parent rproc device through the
> >> rproc_get_by_child() API.
> >>
> >> Fix this by restoring the remoteproc device as the parent. The new vdev
> >> subdevice can continue to inherit the DMA attributes from the remoteproc's
> >> parent device (actual platform device).
> >>
> >> Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool")
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 097f33e4f1f3..ba18f32bd0c4 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -510,7 +510,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
> >>
> >>      /* Initialise vdev subdevice */
> >>      snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> >> -    rvdev->dev.parent = rproc->dev.parent;
> >> +    rvdev->dev.parent = &rproc->dev;
> >
> > I can see how it would not be possible to retrieve the parent rproc device since
> > rvdev->dev.parent was set to be platform device...
> >
> > I wonder how the original change didn't blow up sysmon_probe() and potentially
> > other out-of-tree users of rproc_get_by_child().
>
> QCOM code uses SMD transport, and not virtio_rpmsg transport, and the
> parent-child relationship is direct rproc subdevices which are added in
> their platform drivers directly. This affects only virtio-rpmsg clients.
> Please see qcom_add_smd_subdev().

Thanks for the clarification, I didn't go that far in my investigation.

>
> It would be nice to have
> > someone from the QCOM team test your patch.
> >
> >>      rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
> >>      rvdev->dev.release = rproc_rvdev_release;
> >>      dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> >
> > Be mindful there might be fallouts from applying this patch since it does change
> > the location of the vdev under /sys/device/platform/ .
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> Thanks for the review.
>
> regards
> Suman
