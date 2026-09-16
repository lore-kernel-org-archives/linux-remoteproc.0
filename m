Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3205C4D795D
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 15:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573878; cv=none; b=bt1waMSzxLCzkFDSWpwkEqRPlyr+kcxyAoM7+bGXBwJVN996FF9KdhLcUtSr0rJkTe+w9CFiD3xsXYEkEvGFQNqlZX3tKw2BLKfBs/WDpVJxJ04ejnyGC7xLz5us02DRKlfPRNfRCSqk1oR48lB1Ne/KKjmY10AnRYvYyro49fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573878; c=relaxed/simple;
	bh=kIEPH4TQ1uf6bM0vkJT/+4CtCb1ozFkQucsWzPBXJmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQChcMHrWYfAwk6DnZVKAphq8uR+FKp4DIWawN587ppC670WpDkcNme/5kHsUX0+5dAKCg9N8YUuEVx9xwe1MNW1pjUNDr6Lph7iiNwtee5z9f7LgWBP3fX8tVVv/j60+FlJ54EQxBGvf2PLQGCOxiutcJayaiZ1u08CAWQS1/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FFA0WSHL; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FFA0WSHL"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ec6185so8229855ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 08:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789573874; x=1790178674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BcGmtXPoHCab0kNf32AsjMJOpOKyAdCYDuBBvlwj4Bs=;
        b=FFA0WSHLoiCUET7l60mlaaGmKW1mEATz/ko5A5oZAH8Ja0ifKQArWKR504koFybZya
         4zkkJj2C1N3vmUl2FFn6M+3n2c4FHn6V1KMdOUXg9KL6NU0z+n048mjf/jVfWbCjxEt6
         cW07DkrHQwKP+kscunoceQwXPO04F4ZK/DnjOmgE2tSANIEbxGyo4o4H3i+q8xmCzn8k
         DMQhPvLBen61vKJ7/raVxeM2qaPQoqp/EjLHGhM9qGYYwslGcKDjNjufy4+k1xCj1t24
         ovMM8taU3aJje73eCvROO7WrGzvPbPVmZX0T5sCY3Nr3lFNVSyY/7TK+A4CI4eV//bsg
         I5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573874; x=1790178674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcGmtXPoHCab0kNf32AsjMJOpOKyAdCYDuBBvlwj4Bs=;
        b=aV9nXkAmWM82zUovwl+LbQXIqs1mQFsrvuUwIBZga6Z4ymXHKcufdxDb2XOYZClZHh
         YlupRN51MhXvS/130ur+xellWU5TpyBcRhepBSDhYC55FG/yLzHDpFINHEAECgWjGZUj
         A62oGlzEIk6GggII+bUf9muRrNTgf1pTdMHBASYKel29ss4UahzPUwm+cjgKDJpqk9gR
         LPlprEZVvFAh4ZF61p0EpmtEzygd3pxzmnJ9D8yAYNzd3bOiLRGOLQrUSJ4gY6fuRdVo
         KON133tco/r5nStckMXK8B7bNOqrAWZdt7kmdChUsYr1tV70M0s8rtGtxPMIPvojlDK/
         MovA==
X-Forwarded-Encrypted: i=1; AKwUvBxBB5KQC71ESIgXZIy4pS8Mcui07/HcIgyYpK2JxdZ4rgsWhRH4Y+PJTL06UKNp69tqv+/Ybh0xVukvEvJ8764P@vger.kernel.org
X-Gm-Message-State: AFuF++nFSUclj9WU+WsjbiwW4cJ2lhNECvFd20t3fe9agwkAH/4pVO7O
	bVaKiSkatApUzI9GGviGLc1A0yHlMrKN5qbB/xZEB5VpxsFaBppPXWoc6e16vwiCWDE=
X-Gm-Gg: AYBFou3cnw8eGTLLbwAy7Ppz1f6RzTWiFtAhoFw4CroI0FAr/vZGmNIzp0PCyy7LW5j
	QKjnj4McvWfbSCkVTnyLAaqQw9aHxIbXnDYl9YqJsmACx2GdA55BaOrRZa49+KrnL9GXqLY+g5Q
	m+qk4QivdWQVAPTfp0sVIdtmbJWacHG5Rpa4HWFo6kCQ5TqQ4+3WPmMfPhQbFBk5fW3Nuyo9rvt
	zntK+i/b3HdSjP1Ijimc4wxbHdE+aXisXShRzGn8D6Ixm+mdQSXIzlETUlz95Ase1CrXdE0o4rz
	RnTgb2qzwm+CAlruyLu9DkrJvm/NsQh7a3juwWCfzLkq89S1dCO7XfK119SvFbWaIZbqWCJgqiS
	I/tXveB9K/Zpk8D0eiaujxYrr8e0rrPMqnpSzs/RDYprFY88V1iuqifzD2fHQctLXx0ZQe74kEZ
	YE3Eug0yNGl7Ry+v+7r/7eUrAA/0BYAryO2A4NTycghqK2Bds7NTpyKDHpmAql1OVufG4N16FfD
	eX74o8zPRxxqGU=
X-Received: by 2002:a17:903:2a8f:b0:2dd:3ddf:b87a with SMTP id d9443c01a7336-2dd8cc98358mr66456705ad.0.1789573872072;
        Wed, 16 Sep 2026 08:51:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5703:e05c:9814:52a1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fd37sm14157475ad.3.2026.09.16.08.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:51:11 -0700 (PDT)
Date: Wed, 16 Sep 2026 09:51:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: add acknowledged vdev
 reset
Message-ID: <aqq67R111xy20JC-@p14s>
References: <20260902214453.634339-2-tanmay.shah@amd.com>
 <aqBNoaF7m_JEiVYY@p14s>
 <281ad636-7963-43ad-b88a-8a196eab217b@amd.com>
 <aqQW7eOsFE7jRTXT@p14s>
 <935f29ea-adf0-45c2-84fc-0df40b6f591b@amd.com>
 <CANLsYkzWXRbQiystuX101POObnkhSAyyP-6sOf9Fb+X5H_5y3A@mail.gmail.com>
 <bb84213f-0168-425c-9803-24eb82415b52@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb84213f-0168-425c-9803-24eb82415b52@amd.com>

On Tue, Sep 15, 2026 at 12:20:34PM -0500, Shah, Tanmay wrote:
> 
> 
> On 9/14/2026 11:47 AM, Mathieu Poirier wrote:
> > On Fri, 11 Sept 2026 at 12:03, Shah, Tanmay <tanmays@amd.com> wrote:
> >>
> >>
> >>
> >> On 9/11/2026 9:57 AM, Mathieu Poirier wrote:
> >>> On Tue, Sep 08, 2026 at 02:21:53PM -0500, Shah, Tanmay wrote:
> >>>> Hello,
> >>>>
> >>>> Thank you for the reviews.
> >>>>
> >>>> On 9/8/2026 1:02 PM, Mathieu Poirier wrote:
> >>>>> Good day,
> >>>>>
> >>>>> On Wed, Sep 02, 2026 at 02:44:54PM -0700, Tanmay Shah wrote:
> >>>>>> The existing remoteproc virtio reset path clears the vdev status locally
> >>>>>> without notifying the remote processor. As a result, the host cannot tell
> >>>>>> whether the remote side has observed the reset request or completed its
> >>>>>> cleanup.
> >>>>>>
> >>>>>> Add a new resource type, RSC_VDEV_V2, for virtio vdevs that support an
> >>>>>> acknowledged reset protocol. For these resources, encode a reset request
> >>>>>> in the virtio status byte, kick the remote processor using the vdev notify
> >>>>>> ID, and wait for the remote side to clear the status back to 0.
> >>>>>>
> >>>>>> Keep the existing RSC_VDEV behavior for backwards compatibility by
> >>>>>> clearing the status locally. Also reset remoteproc-created virtio
> >>>>>> devices before unregistering them, and expose RSC_VDEV_V2 reset state
> >>>>>> in debugfs.
> >>>>>>
> >>>>>> Assisted-by: Codex:GPT-5
> >>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>>>>> ---
> >>>>>>  drivers/remoteproc/remoteproc_core.c     |  3 +-
> >>>>>>  drivers/remoteproc/remoteproc_debugfs.c  | 29 +++++++++++++++-
> >>>>>>  drivers/remoteproc/remoteproc_internal.h | 21 +++++++++++
> >>>>>>  drivers/remoteproc/remoteproc_virtio.c   | 44 ++++++++++++++++++++++--
> >>>>>>  include/linux/rsc_table.h                |  5 ++-
> >>>>>>  5 files changed, 97 insertions(+), 5 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >>>>>> index 1ed406714849..31d79684977c 100644
> >>>>>> --- a/drivers/remoteproc/remoteproc_core.c
> >>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
> >>>>>> @@ -471,6 +471,7 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> >>>>>>  static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >>>>>>                         int offset, int avail)
> >>>>>>  {
> >>>>>> +  struct fw_rsc_hdr *hdr = ptr - sizeof(*hdr);
> >>>>>
> >>>>> Spurious change.
> >>>>>
> >>>>
> >>>> Ack will remove it.
> >>>>
> >>>>>>    struct fw_rsc_vdev *rsc = ptr;
> >>>>>>    struct device *dev = &rproc->dev;
> >>>>>>    struct rproc_vdev *rvdev;
> >>>>>> @@ -485,7 +486,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >>>>>>            return -EINVAL;
> >>>>>>    }
> >>>>>>
> >>>>>> -  /* make sure reserved bytes are zeroes */
> >>>>>
> >>>>> Same
> >>>>
> >>>> Ack, will be removed.
> >>>>
> >>>>>
> >>>>>>    if (rsc->reserved[0] || rsc->reserved[1]) {
> >>>>>>            dev_err(dev, "vdev rsc has non zero reserved bytes\n");
> >>>>>>            return -EINVAL;
> >>>>>> @@ -1009,6 +1009,7 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
> >>>>>>    [RSC_DEVMEM] = rproc_handle_devmem,
> >>>>>>    [RSC_TRACE] = rproc_handle_trace,
> >>>>>>    [RSC_VDEV] = rproc_handle_vdev,
> >>>>>> +  [RSC_VDEV_V2] = rproc_handle_vdev,
> >>>>>>  };
> >>>>>>
> >>>>>>  struct rproc_rsc_cb_data {
> >>>>>> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> >>>>>> index b86c1d09c70c..1fe99749f5b4 100644
> >>>>>> --- a/drivers/remoteproc/remoteproc_debugfs.c
> >>>>>> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> >>>>>> @@ -274,7 +274,7 @@ static const struct file_operations rproc_crash_ops = {
> >>>>>>  /* Expose resource table content via debugfs */
> >>>>>>  static int rproc_rsc_table_show(struct seq_file *seq, void *p)
> >>>>>>  {
> >>>>>> -  static const char * const types[] = {"carveout", "devmem", "trace", "vdev"};
> >>>>>> +  static const char * const types[] = {"carveout", "devmem", "trace", "vdev", "vdev_v2"};
> >>>>>>    struct rproc *rproc = seq->private;
> >>>>>>    struct resource_table *table = rproc->table_ptr;
> >>>>>>    struct fw_rsc_carveout *c;
> >>>>>> @@ -336,6 +336,33 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
> >>>>>>                    seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
> >>>>>>                               v->reserved[0], v->reserved[1]);
> >>>>>>
> >>>>>> +                  for (j = 0; j < v->num_of_vrings; j++) {
> >>>>>> +                          seq_printf(seq, "  Vring %d\n", j);
> >>>>>> +                          seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
> >>>>>> +                          seq_printf(seq, "    Alignment %d\n", v->vring[j].align);
> >>>>>> +                          seq_printf(seq, "    Number of buffers %d\n", v->vring[j].num);
> >>>>>> +                          seq_printf(seq, "    Notify ID %d\n", v->vring[j].notifyid);
> >>>>>> +                          seq_printf(seq, "    Physical Address 0x%x\n\n",
> >>>>>> +                                     v->vring[j].pa);
> >>>>>> +                  }
> >>>>>> +                  break;
> >>>>>> +          case RSC_VDEV_V2:
> >>>>>> +                  v = rsc;
> >>>>>> +                  seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
> >>>>>> +
> >>>>>> +                  seq_printf(seq, "  ID %d\n", v->id);
> >>>>>> +                  seq_printf(seq, "  Notify ID %d\n", v->notifyid);
> >>>>>> +                  seq_printf(seq, "  Device features 0x%x\n", v->dfeatures);
> >>>>>> +                  seq_printf(seq, "  Guest features 0x%x\n", v->gfeatures);
> >>>>>> +                  seq_printf(seq, "  Config length 0x%x\n", v->config_len);
> >>>>>> +                  seq_printf(seq, "  Status 0x%x\n", v->status);
> >>>>>> +                  seq_printf(seq, "  Number of vrings %d\n", v->num_of_vrings);
> >>>>>> +                  seq_printf(seq, "  Reset request pending %s\n",
> >>>>>> +                             rproc_rsc_vdev_reset_requested(v->status) ?
> >>>>>> +                             "yes" : "no");
> >>>>>> +                  seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
> >>>>>> +                             v->reserved[0], v->reserved[1]);
> >>>>>> +
> >>>>>>                    for (j = 0; j < v->num_of_vrings; j++) {
> >>>>>>                            seq_printf(seq, "  Vring %d\n", j);
> >>>>>>                            seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
> >>>>>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> >>>>>> index 3a742ef6ef60..f07a96ff82a4 100644
> >>>>>> --- a/drivers/remoteproc/remoteproc_internal.h
> >>>>>> +++ b/drivers/remoteproc/remoteproc_internal.h
> >>>>>> @@ -14,6 +14,7 @@
> >>>>>>
> >>>>>>  #include <linux/irqreturn.h>
> >>>>>>  #include <linux/firmware.h>
> >>>>>> +#include <linux/virtio_config.h>
> >>>>>>  #ifdef CONFIG_HAS_IOMEM
> >>>>>>  #include <linux/io.h>
> >>>>>>  #endif
> >>>>>> @@ -42,6 +43,26 @@ struct rproc_vdev_data {
> >>>>>>    struct fw_rsc_vdev *rsc;
> >>>>>>  };
> >>>>>>
> >>>>>> +/*
> >>>>>> + * RSC_VDEV_V2 requests an acknowledged reset by writing an otherwise
> >>>>>> + * impossible virtio status pattern: DRIVER and FAILED set while
> >>>>>> + * ACKNOWLEDGE is clear. Other status bits are left unchanged.
> >>>>>> + */
> >>>>>> +static inline u8 rproc_rsc_vdev_reset_status(u8 status)
> >>>>>> +{
> >>>>>> +  status |= VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_FAILED;
> >>>>>> +  status &= ~VIRTIO_CONFIG_S_ACKNOWLEDGE;
> >>>>>> +
> >>>>>> +  return status;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static inline bool rproc_rsc_vdev_reset_requested(u8 status)
> >>>>>> +{
> >>>>>> +  return !(status & VIRTIO_CONFIG_S_ACKNOWLEDGE) &&
> >>>>>> +         (status & VIRTIO_CONFIG_S_DRIVER) &&
> >>>>>> +         (status & VIRTIO_CONFIG_S_FAILED);
> >>>>>> +}
> >>>>>> +
> >>>>>>  static inline bool rproc_has_feature(struct rproc *rproc, unsigned int feature)
> >>>>>>  {
> >>>>>>    return test_bit(feature, rproc->features);
> >>>>>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> >>>>>> index d5e9ff045a28..e682caa546b2 100644
> >>>>>> --- a/drivers/remoteproc/remoteproc_virtio.c
> >>>>>> +++ b/drivers/remoteproc/remoteproc_virtio.c
> >>>>>> @@ -13,6 +13,7 @@
> >>>>>>  #include <linux/dma-map-ops.h>
> >>>>>>  #include <linux/dma-mapping.h>
> >>>>>>  #include <linux/export.h>
> >>>>>> +#include <linux/iopoll.h>
> >>>>>>  #include <linux/of_reserved_mem.h>
> >>>>>>  #include <linux/platform_device.h>
> >>>>>>  #include <linux/remoteproc.h>
> >>>>>> @@ -234,12 +235,48 @@ static void rproc_virtio_set_status(struct virtio_device *vdev, u8 status)
> >>>>>>  static void rproc_virtio_reset(struct virtio_device *vdev)
> >>>>>>  {
> >>>>>>    struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
> >>>>>> +  struct rproc *rproc = rvdev->rproc;
> >>>>>>    struct fw_rsc_vdev *rsc;
> >>>>>> +  struct fw_rsc_hdr *hdr;
> >>>>>> +  int ret;
> >>>>>> +  u8 val;
> >>>>>> +
> >>>>>> +  /*
> >>>>>> +   * During crash recovery, vdev can be stopped. But the driver can't reset
> >>>>>> +   * the device, as device is already crashed. In this case, reset becomes
> >>>>>> +   * no op.
> >>>>>> +   */
> >>>>>> +  if (rproc->state == RPROC_CRASHED)
> >>>>>> +          return;
> >>>>>>
> >>>>>>    rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
> >>>>>> +  hdr = (void *)rsc - sizeof(*hdr);
> >>>>>> +
> >>>>>> +  if (hdr->type == RSC_VDEV_V2) {
> >>>>>> +          /*
> >>>>>> +           * RSC_VDEV_V2 encodes an acknowledged reset request in the
> >>>>>> +           * status byte. The remote is expected to complete the reset
> >>>>>> +           * and then clear status back to 0.
> >>>>>> +           */
> >>>>>> +          rsc->status = rproc_rsc_vdev_reset_status(rsc->status);
> >>>>>> +
> >>>>>> +          /* after setting reset request, kick the device */
> >>>>>> +          rproc->ops->kick(rproc, rsc->notifyid);
> >>>>>>
> >>>>>> -  rsc->status = 0;
> >>>>>> -  dev_dbg(&vdev->dev, "reset !\n");
> >>>>>> +          /*
> >>>>>> +           * When device completes reset, it is expected to set status
> >>>>>> +           * to 0.
> >>>>>> +           */
> >>>>>> +          ret = readb_poll_timeout(&rsc->status, val, val == 0,
> >>>>>> +                                   1000,      /* 1ms between reads */
> >>>>>> +                                   3000000);  /* 3s total timeout */
> >>>>>> +          if (ret)
> >>>>>> +                  dev_warn(&vdev->dev, "vdev reset timed out\n");
> >>>>>
> >>>>> The problem here is that we are introducing behavior that is not compliant with
> >>>>> the virtio specifications.  One way to acheive the same behavior could be for
> >>>>> the remote processor to check rsc->status before sending a interrupt of using
> >>>>> the virtqueues.
> >>>>>
> >>>>
> >>>> That is what remote is supposed to do. But what if remote do not
> >>>> respond? If remote is deadlocked for some reason, then the Linux will
> >>>> hang at this point too. That is why we need some kind of timeout.
> >>>
> >>> If the remote is dead then a watchdog timer should fire at some point.
> >>> Moreover, that situation won't be different from other circumstances where a
> >>> remote processor locks up.
> >>>
> >>
> >> There are few concerns:
> >>
> >> 1) Heterogeneous system where Linux is handling many remotes, the
> >> watchdog might not be available to all the remotes or watchdog mechanism
> >> is not implemented at all on the remote side.
> > 
> > If a watchdog is not available adding a timeout upon resetting
> > rsc-status won't help.
> > 
> >>
> >> 2) Let's say watchdog is configured for 10s, or so then for that long
> >> Linux will be stuck too. I am trying to avoid this case where Linux gets
> >> stuck for long time.
> > 
> > Same resoning as above - if the remote processor dies and a watchdog
> > timeout is set for 10 seconds, adding a shorter timeout when
> > rsc->status is modified will do very little.
> > 
> >>> Looking at your patch, sending a kick() won't do anything for a dead remote
> >>> processor.  If the remote processor is alive, it should monitor rsc->status and
> >>> take action when it is set to '0' by the host.  If it is locked-up, the normal
> >>> lockup procedure should apply.
> >>>
> >>
> >> Notifying virtio device on the status change is standard virtio
> >> mechanism. In the virtio statck it's done via virtqueue_notify so I am
> >> trying to do the same. It also helps remote to avoid polling on status.
> >>
> > 
> > Can you point me to that code?  Having the same mental picture will help.
> > 
> >>> I'm not sure what problem this patch is trying to address.
> >>>
> >>
> >> Some platforms allow Linux and Remote boot independently.
> >>
> >> Let's say Linux reboots without reseting the remote then during next
> >> boot Linux will find virtio status is not in the reset state.
> >>
> > 
> > That should be handled via the attach()/detach() state machine.
> > 
> >> In such case, linux need to issue virtio device reset, and wait until
> >> RPU completes the reset and start the device again. The virtio framework
> >> already issues the reset during boot here:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/virtio/virtio.c?h=for-next#n570
> >>
> >> However, the virtio_reset implementation for remoteproc_virtio simply
> >> set the status to 0, and doesn't wait for the remote to complete the
> >> reset. Due to this, attach operation becomes successfull, but the rpmsg
> >> channels are not created on the linux side.
> >>
> > 
> > I think this situation should be handled in driver code rather than
> > the remoteproc framework.  We can consider adding this to the
> > remoteproc framework if/when several platforms implement the same
> > logic.  Otherwise I fear we'll bloat the framework with something that
> > isn't generic.
> > 
> 
> Hi Mathieu,
> 
> The previous patch sent in this matter was doing the same:
> https://lore.kernel.org/linux-remoteproc/20260317201251.3920841-1-tanmay.shah@amd.com/
>

I think this is a much better approach.  That said, I would really like to see
something like wait_for_completion_timeout() being used rather than
usleep_range(). 
 
> If you are okay, can I resend it ? I think if that is accepted then we
> don't need this patch atleast for now.
> 
> Thank You,
> Tanmay
> 
> >> This patch solves this issue. It changes the reset mechanism while
> >> maintaining the backward compatibility for old way of reseting the device.
> >>
> >> I had sent a different patch regarding this before:
> >> https://lore.kernel.org/linux-remoteproc/20260317201251.3920841-1-tanmay.shah@amd.com/
> >>
> >> Old patch was rejected because we decided to modify the reset mechanism
> >> instead:
> >> https://lists.openampproject.org/archives/list/openamp-rp@lists.openampproject.org/thread/DDIFUMGQQ2R7CQZJHK7EB6UDO3ISAAVU/
> >>
> >> Thank You,
> >> Tanmay
> >>
> >>
> >>>>
> >>>> I think timeout mechanism is better for AMP systems over waiting forever
> >>>> for remote to clear the status.
> >>>>
> >>>> Thanks,
> >>>> Tanmay
> >>>>
> >>>>
> >>>>>> +  } else {
> >>>>>> +          /* back compatible for RSC_VDEV type of rsc vdev */
> >>>>>> +          rsc->status = 0;
> >>>>>> +  }
> >>>>>> +  dev_info(&vdev->dev, "reset !\n");
> >>>>>>  }
> >>>>>>
> >>>>>>  /* provide the vdev features as retrieved from the firmware */
> >>>>>> @@ -469,6 +506,9 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
> >>>>>>  {
> >>>>>>    struct virtio_device *vdev = dev_to_virtio(dev);
> >>>>>>
> >>>>>> +  /* reset virtio device before unregister */
> >>>>>> +  virtio_reset_device(vdev);
> >>>>>> +
> >>>>>
> >>>>> Regardless of this feature, I think it is wise to reset the device before
> >>>>> unregistering with the virtio subsystem.
> >>>>>
> >>>>
> >>>> Agreed. I intend to keep this.
> >>>>
> >>>>> Thanks,
> >>>>> Mathieu
> >>>>>
> >>>>>>    unregister_virtio_device(vdev);
> >>>>>>    return 0;
> >>>>>>  }
> >>>>>> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
> >>>>>> index 71b60125310e..2398a6d7033e 100644
> >>>>>> --- a/include/linux/rsc_table.h
> >>>>>> +++ b/include/linux/rsc_table.h
> >>>>>> @@ -66,6 +66,8 @@ struct fw_rsc_hdr {
> >>>>>>   *                    the remote processor will be writing logs.
> >>>>>>   * @RSC_VDEV:       declare support for a virtio device, and serve as its
> >>>>>>   *                    virtio header.
> >>>>>> + * @RSC_VDEV_V2:    declare support for a virtio device whose reset request is
> >>>>>> + *                    encoded in the virtio status byte.
> >>>>>>   * @RSC_LAST:       just keep this one at the end of standard resources
> >>>>>>   * @RSC_VENDOR_START:     start of the vendor specific resource types range
> >>>>>>   * @RSC_VENDOR_END:       end of the vendor specific resource types range
> >>>>>> @@ -83,7 +85,8 @@ enum fw_resource_type {
> >>>>>>    RSC_DEVMEM              = 1,
> >>>>>>    RSC_TRACE               = 2,
> >>>>>>    RSC_VDEV                = 3,
> >>>>>> -  RSC_LAST                = 4,
> >>>>>> +  RSC_VDEV_V2             = 4,
> >>>>>> +  RSC_LAST                = 5,
> >>>>>>    RSC_VENDOR_START        = 128,
> >>>>>>    RSC_VENDOR_END          = 512,
> >>>>>>  };
> >>>>>>
> >>>>>> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
> >>>>>> --
> >>>>>> 2.43.0
> >>>>>>
> >>>>
> >>
> 
