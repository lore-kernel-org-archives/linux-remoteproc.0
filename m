Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6734848AF
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659957; cv=pass; b=hTyfOIHs45CW0a05a2eDwuQ2DAqDV41gEoZTQ/zTQohwSujn4CVnieNqfmN/G6VctDhBtTGQ1w9pf9e3Tz9jjSxQAjJCkcuNXFOAn8sC2UKj4ZnlF0o401jqX3PaxVwV1kCTMOTD7QP9ozzOLgDkEsJFBpiAPRZBrEyRG/56Imw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659957; c=relaxed/simple;
	bh=2Mbxz4Fzgk6MkDGn4Hn2euC2CAbW2ZeexCeu6o2sCK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOdEZUCsrPF0iaTgIVgju7JR4cxIHGN5B1jaQLUc0x7XQAnsU4W8VnJ4uX4o8B/saVVn6gIx893Ani2jAvx+ZLhDMifqr3J55KgBmBSYsVi8dxKD3EAOm30j/yDaJU1srUmhOloY7BvJCowa38VNvrAwL4eHhKG67HxpuECN+3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GFGK614e; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GFGK614e"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so1399515a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 08:45:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789659947; cv=none;
        d=google.com; s=arc-20260327;
        b=SIq+dQlKDaZMmPnfnliqoglM17plCtAqCNj8w4hE37rpSV+dtVN3Da52i138STlkVN
         jq2yLn4f65gVcVElUEEGJoFowMJ3ASXR3Uv8yvhiwvBWpq1iuMNOUPdVMrngBruvfvRJ
         o7tpkLs3aZWKgK/TmAHluySQNMWxcCvAeneFzydwNNxolmpeq6jDlk5NY25FkBvcqdfR
         ZNka9iAryWyGjcwRjDEbRgh5Wlyoj+k39imWfknqyyqwtHTN7JIsQn+UBQclI3RegQFC
         L+ArGdDjTLTk0eam0EIJk/NgeVMek7LIbFbBZRhUU+G6x3Cb9zo57EPxvcZc1RKlbq67
         sB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0xnEztL1Qkn6wCE3IYANlcE0zYyxui23wzQHzEtpEpw=;
        fh=/IgK69UbO+wVPnVxMiHL3S7pb86D8xa7+rPJtozVkeE=;
        b=ipb1Qju3/qQP45moeMpnElxZNrs0rw/BsQIo8iantKePaZC9zwsfp78Vzz5pCljWkz
         RNJ+Td/el8x/lJjyMtj7GzSH3UNfOobrcIMafupMULM3+2eEckjFWw9p2h6QtL4VNyRg
         5u1HcdvTZ0WqBJ1XPsBEuzvXt9uxd484R+9eN7iBAAh4McLjSxguPXWfE+XtGY2CyX/z
         9ELtQpvM6PigNHOcvyp2EzchtlFvjeNbF+RuFTdtzEGw1HxrUi/V65ZS/UjLk3SwhtMI
         jv3oISgOMbm8GwgfubDyn3UXL+nzXIO3hs1jEUbCvGxC/7qcC/u/3/grdEZB6TxgMESU
         NzLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789659947; x=1790264747; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xnEztL1Qkn6wCE3IYANlcE0zYyxui23wzQHzEtpEpw=;
        b=GFGK614eJdbP39VsUNUYjfgHZt2YcZRLz6cV6+AeBFYE+XfewY4v08lq7DsTW2fDdq
         8qc0cT/bw/2a4+8eszwzq4yyhaGDFpoWaa7xFjb3PM8loTcbcTZVnr/51oyHEEzPA7aq
         Y7N1oqTr+UaPBi7NolfLPAIZCr3QoZFJkAa3SgtJpBVpOLyxUP42oN4tzivzDR4IGpQ0
         zERhtHARf7Vk+eGSNuOO3AmgD5Ysm1YrVPlbN31AdeZmNHu53T2rqhqM0BR5Te42ktT1
         AnmehXpxYJjNDeUfsQQ+68VeJ7MKte26GCQn3ag/7u+CytANtP5U//RUH/S+m/aJSMWT
         hqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659947; x=1790264747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0xnEztL1Qkn6wCE3IYANlcE0zYyxui23wzQHzEtpEpw=;
        b=KlYistF1f5E/4T0IqHnETDsBNed3jRDLafHKAw1JfF32tsmJz3+yt/7z4pGvX3dT0S
         afV6/+Y5qYs/Z7fFaSwvixSWuPOjw1c1Jn6iRsNh/kFWCDAFZka1a5hVvIYj+OwYWTQM
         sP6cUsc1y3kH8WNm81Whj2HwO2y9hzWSrbupzpKr3weozscCNmEuzbZ4a4ekgbzj4Mmg
         HBEPuxv6w/KaAVtzG8YXl186N1fo23elTOv/g4/EAWhxY63rhQ7iGZWM/ljVpBxsGaA/
         kYQkfsTyPjKRrTRieCFd0qsLQ2t4cWz+X8ueI8OguzdGjsHkhKphBeDwOLqoRZlUbnov
         IGCw==
X-Forwarded-Encrypted: i=1; AKwUvBx46X3w8wgC3e3yZ+6VnrxRtFzdikQc0GMYIV0njOUwuwf/NQ8xPPtooo3NjRQKFFIYZu2e/ftqYDamjAB/y9+6@vger.kernel.org
X-Gm-Message-State: AFuF++m/WPxjBcDtGZGGfKeqMlJBGNb41f2iIQoF0fTRRsOIctrWNxgI
	2aasQyLdlP33ioMWe0D6j2qs2J3CsqZluKh4+/xEu02g5b+MvJtHkAS2gHMwCDQ2KoNUFdifFtL
	Bef2QZ46aa0Dt/PLpvQNHlKDGR1x6PX9ORLDZvenC5w==
X-Gm-Gg: AYBFou2UgMCEMKguE71HZYO2XDqfMQqS64MxE6YtRwr7eXlOtMvcqywA+ZII2ngI49z
	5QiM8QCFEtUmw6Zujp033fLL1JFLQ4AProBfzjFVTMxluTaQK47OvKsnEQvHHVtE1uMZWdVlKxA
	XmmGRGBjS6cA+cRmB+6YyscfSPN86dpwJW2Jw6kdf/3T3I6VxivJ3/mde03VUcJI8oVjeH3/eyt
	EusX10wJsFfuDmV5PaN7jMDGGc7ThcZb0tIQ/5IaUAg9/9voq78AuSkEYVRWik3nIezOFVnWr4y
	I6g7Ujoqi2MUv+VMAF7bmozx1IzIzOuFNz4WTvRprwLIxlNL3Phybw2BTtoAIYthYi9fuip2aYZ
	oOOQ8f5X6gfC9oelGlwnZ2D7y
X-Received: by 2002:a05:6402:440b:b0:6a7:e514:1d85 with SMTP id
 4fb4d7f45d1cf-6aa2236a40bmr5354857a12.13.1789659946538; Thu, 17 Sep 2026
 08:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902214453.634339-2-tanmay.shah@amd.com> <aqBNoaF7m_JEiVYY@p14s>
 <281ad636-7963-43ad-b88a-8a196eab217b@amd.com> <aqQW7eOsFE7jRTXT@p14s>
 <935f29ea-adf0-45c2-84fc-0df40b6f591b@amd.com> <CANLsYkzWXRbQiystuX101POObnkhSAyyP-6sOf9Fb+X5H_5y3A@mail.gmail.com>
 <bb84213f-0168-425c-9803-24eb82415b52@amd.com> <aqq67R111xy20JC-@p14s>
In-Reply-To: <aqq67R111xy20JC-@p14s>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 17 Sep 2026 09:45:34 -0600
X-Gm-Features: AcwNN1Xb9uJ_zbaUYEpLQQ0Qks2LMmwJbS8_d7Rbjqq3ROK5ZoX3xKlXb1wMKj8
Message-ID: <CANLsYkzg7HGJbrDkuSY6evohUqRv5n=sPcp_uZn3kCkgbmZojA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: add acknowledged vdev reset
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 09:51, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, Sep 15, 2026 at 12:20:34PM -0500, Shah, Tanmay wrote:
> >
> >
> > On 9/14/2026 11:47 AM, Mathieu Poirier wrote:
> > > On Fri, 11 Sept 2026 at 12:03, Shah, Tanmay <tanmays@amd.com> wrote:
> > >>
> > >>
> > >>
> > >> On 9/11/2026 9:57 AM, Mathieu Poirier wrote:
> > >>> On Tue, Sep 08, 2026 at 02:21:53PM -0500, Shah, Tanmay wrote:
> > >>>> Hello,
> > >>>>
> > >>>> Thank you for the reviews.
> > >>>>
> > >>>> On 9/8/2026 1:02 PM, Mathieu Poirier wrote:
> > >>>>> Good day,
> > >>>>>
> > >>>>> On Wed, Sep 02, 2026 at 02:44:54PM -0700, Tanmay Shah wrote:
> > >>>>>> The existing remoteproc virtio reset path clears the vdev status locally
> > >>>>>> without notifying the remote processor. As a result, the host cannot tell
> > >>>>>> whether the remote side has observed the reset request or completed its
> > >>>>>> cleanup.
> > >>>>>>
> > >>>>>> Add a new resource type, RSC_VDEV_V2, for virtio vdevs that support an
> > >>>>>> acknowledged reset protocol. For these resources, encode a reset request
> > >>>>>> in the virtio status byte, kick the remote processor using the vdev notify
> > >>>>>> ID, and wait for the remote side to clear the status back to 0.
> > >>>>>>
> > >>>>>> Keep the existing RSC_VDEV behavior for backwards compatibility by
> > >>>>>> clearing the status locally. Also reset remoteproc-created virtio
> > >>>>>> devices before unregistering them, and expose RSC_VDEV_V2 reset state
> > >>>>>> in debugfs.
> > >>>>>>
> > >>>>>> Assisted-by: Codex:GPT-5
> > >>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > >>>>>> ---
> > >>>>>>  drivers/remoteproc/remoteproc_core.c     |  3 +-
> > >>>>>>  drivers/remoteproc/remoteproc_debugfs.c  | 29 +++++++++++++++-
> > >>>>>>  drivers/remoteproc/remoteproc_internal.h | 21 +++++++++++
> > >>>>>>  drivers/remoteproc/remoteproc_virtio.c   | 44 ++++++++++++++++++++++--
> > >>>>>>  include/linux/rsc_table.h                |  5 ++-
> > >>>>>>  5 files changed, 97 insertions(+), 5 deletions(-)
> > >>>>>>
> > >>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > >>>>>> index 1ed406714849..31d79684977c 100644
> > >>>>>> --- a/drivers/remoteproc/remoteproc_core.c
> > >>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
> > >>>>>> @@ -471,6 +471,7 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> > >>>>>>  static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >>>>>>                         int offset, int avail)
> > >>>>>>  {
> > >>>>>> +  struct fw_rsc_hdr *hdr = ptr - sizeof(*hdr);
> > >>>>>
> > >>>>> Spurious change.
> > >>>>>
> > >>>>
> > >>>> Ack will remove it.
> > >>>>
> > >>>>>>    struct fw_rsc_vdev *rsc = ptr;
> > >>>>>>    struct device *dev = &rproc->dev;
> > >>>>>>    struct rproc_vdev *rvdev;
> > >>>>>> @@ -485,7 +486,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >>>>>>            return -EINVAL;
> > >>>>>>    }
> > >>>>>>
> > >>>>>> -  /* make sure reserved bytes are zeroes */
> > >>>>>
> > >>>>> Same
> > >>>>
> > >>>> Ack, will be removed.
> > >>>>
> > >>>>>
> > >>>>>>    if (rsc->reserved[0] || rsc->reserved[1]) {
> > >>>>>>            dev_err(dev, "vdev rsc has non zero reserved bytes\n");
> > >>>>>>            return -EINVAL;
> > >>>>>> @@ -1009,6 +1009,7 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
> > >>>>>>    [RSC_DEVMEM] = rproc_handle_devmem,
> > >>>>>>    [RSC_TRACE] = rproc_handle_trace,
> > >>>>>>    [RSC_VDEV] = rproc_handle_vdev,
> > >>>>>> +  [RSC_VDEV_V2] = rproc_handle_vdev,
> > >>>>>>  };
> > >>>>>>
> > >>>>>>  struct rproc_rsc_cb_data {
> > >>>>>> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> > >>>>>> index b86c1d09c70c..1fe99749f5b4 100644
> > >>>>>> --- a/drivers/remoteproc/remoteproc_debugfs.c
> > >>>>>> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> > >>>>>> @@ -274,7 +274,7 @@ static const struct file_operations rproc_crash_ops = {
> > >>>>>>  /* Expose resource table content via debugfs */
> > >>>>>>  static int rproc_rsc_table_show(struct seq_file *seq, void *p)
> > >>>>>>  {
> > >>>>>> -  static const char * const types[] = {"carveout", "devmem", "trace", "vdev"};
> > >>>>>> +  static const char * const types[] = {"carveout", "devmem", "trace", "vdev", "vdev_v2"};
> > >>>>>>    struct rproc *rproc = seq->private;
> > >>>>>>    struct resource_table *table = rproc->table_ptr;
> > >>>>>>    struct fw_rsc_carveout *c;
> > >>>>>> @@ -336,6 +336,33 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
> > >>>>>>                    seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
> > >>>>>>                               v->reserved[0], v->reserved[1]);
> > >>>>>>
> > >>>>>> +                  for (j = 0; j < v->num_of_vrings; j++) {
> > >>>>>> +                          seq_printf(seq, "  Vring %d\n", j);
> > >>>>>> +                          seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
> > >>>>>> +                          seq_printf(seq, "    Alignment %d\n", v->vring[j].align);
> > >>>>>> +                          seq_printf(seq, "    Number of buffers %d\n", v->vring[j].num);
> > >>>>>> +                          seq_printf(seq, "    Notify ID %d\n", v->vring[j].notifyid);
> > >>>>>> +                          seq_printf(seq, "    Physical Address 0x%x\n\n",
> > >>>>>> +                                     v->vring[j].pa);
> > >>>>>> +                  }
> > >>>>>> +                  break;
> > >>>>>> +          case RSC_VDEV_V2:
> > >>>>>> +                  v = rsc;
> > >>>>>> +                  seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
> > >>>>>> +
> > >>>>>> +                  seq_printf(seq, "  ID %d\n", v->id);
> > >>>>>> +                  seq_printf(seq, "  Notify ID %d\n", v->notifyid);
> > >>>>>> +                  seq_printf(seq, "  Device features 0x%x\n", v->dfeatures);
> > >>>>>> +                  seq_printf(seq, "  Guest features 0x%x\n", v->gfeatures);
> > >>>>>> +                  seq_printf(seq, "  Config length 0x%x\n", v->config_len);
> > >>>>>> +                  seq_printf(seq, "  Status 0x%x\n", v->status);
> > >>>>>> +                  seq_printf(seq, "  Number of vrings %d\n", v->num_of_vrings);
> > >>>>>> +                  seq_printf(seq, "  Reset request pending %s\n",
> > >>>>>> +                             rproc_rsc_vdev_reset_requested(v->status) ?
> > >>>>>> +                             "yes" : "no");
> > >>>>>> +                  seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
> > >>>>>> +                             v->reserved[0], v->reserved[1]);
> > >>>>>> +
> > >>>>>>                    for (j = 0; j < v->num_of_vrings; j++) {
> > >>>>>>                            seq_printf(seq, "  Vring %d\n", j);
> > >>>>>>                            seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
> > >>>>>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > >>>>>> index 3a742ef6ef60..f07a96ff82a4 100644
> > >>>>>> --- a/drivers/remoteproc/remoteproc_internal.h
> > >>>>>> +++ b/drivers/remoteproc/remoteproc_internal.h
> > >>>>>> @@ -14,6 +14,7 @@
> > >>>>>>
> > >>>>>>  #include <linux/irqreturn.h>
> > >>>>>>  #include <linux/firmware.h>
> > >>>>>> +#include <linux/virtio_config.h>
> > >>>>>>  #ifdef CONFIG_HAS_IOMEM
> > >>>>>>  #include <linux/io.h>
> > >>>>>>  #endif
> > >>>>>> @@ -42,6 +43,26 @@ struct rproc_vdev_data {
> > >>>>>>    struct fw_rsc_vdev *rsc;
> > >>>>>>  };
> > >>>>>>
> > >>>>>> +/*
> > >>>>>> + * RSC_VDEV_V2 requests an acknowledged reset by writing an otherwise
> > >>>>>> + * impossible virtio status pattern: DRIVER and FAILED set while
> > >>>>>> + * ACKNOWLEDGE is clear. Other status bits are left unchanged.
> > >>>>>> + */
> > >>>>>> +static inline u8 rproc_rsc_vdev_reset_status(u8 status)
> > >>>>>> +{
> > >>>>>> +  status |= VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_FAILED;
> > >>>>>> +  status &= ~VIRTIO_CONFIG_S_ACKNOWLEDGE;
> > >>>>>> +
> > >>>>>> +  return status;
> > >>>>>> +}
> > >>>>>> +
> > >>>>>> +static inline bool rproc_rsc_vdev_reset_requested(u8 status)
> > >>>>>> +{
> > >>>>>> +  return !(status & VIRTIO_CONFIG_S_ACKNOWLEDGE) &&
> > >>>>>> +         (status & VIRTIO_CONFIG_S_DRIVER) &&
> > >>>>>> +         (status & VIRTIO_CONFIG_S_FAILED);
> > >>>>>> +}
> > >>>>>> +
> > >>>>>>  static inline bool rproc_has_feature(struct rproc *rproc, unsigned int feature)
> > >>>>>>  {
> > >>>>>>    return test_bit(feature, rproc->features);
> > >>>>>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > >>>>>> index d5e9ff045a28..e682caa546b2 100644
> > >>>>>> --- a/drivers/remoteproc/remoteproc_virtio.c
> > >>>>>> +++ b/drivers/remoteproc/remoteproc_virtio.c
> > >>>>>> @@ -13,6 +13,7 @@
> > >>>>>>  #include <linux/dma-map-ops.h>
> > >>>>>>  #include <linux/dma-mapping.h>
> > >>>>>>  #include <linux/export.h>
> > >>>>>> +#include <linux/iopoll.h>
> > >>>>>>  #include <linux/of_reserved_mem.h>
> > >>>>>>  #include <linux/platform_device.h>
> > >>>>>>  #include <linux/remoteproc.h>
> > >>>>>> @@ -234,12 +235,48 @@ static void rproc_virtio_set_status(struct virtio_device *vdev, u8 status)
> > >>>>>>  static void rproc_virtio_reset(struct virtio_device *vdev)
> > >>>>>>  {
> > >>>>>>    struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
> > >>>>>> +  struct rproc *rproc = rvdev->rproc;
> > >>>>>>    struct fw_rsc_vdev *rsc;
> > >>>>>> +  struct fw_rsc_hdr *hdr;
> > >>>>>> +  int ret;
> > >>>>>> +  u8 val;
> > >>>>>> +
> > >>>>>> +  /*
> > >>>>>> +   * During crash recovery, vdev can be stopped. But the driver can't reset
> > >>>>>> +   * the device, as device is already crashed. In this case, reset becomes
> > >>>>>> +   * no op.
> > >>>>>> +   */
> > >>>>>> +  if (rproc->state == RPROC_CRASHED)
> > >>>>>> +          return;
> > >>>>>>
> > >>>>>>    rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
> > >>>>>> +  hdr = (void *)rsc - sizeof(*hdr);
> > >>>>>> +
> > >>>>>> +  if (hdr->type == RSC_VDEV_V2) {
> > >>>>>> +          /*
> > >>>>>> +           * RSC_VDEV_V2 encodes an acknowledged reset request in the
> > >>>>>> +           * status byte. The remote is expected to complete the reset
> > >>>>>> +           * and then clear status back to 0.
> > >>>>>> +           */
> > >>>>>> +          rsc->status = rproc_rsc_vdev_reset_status(rsc->status);
> > >>>>>> +
> > >>>>>> +          /* after setting reset request, kick the device */
> > >>>>>> +          rproc->ops->kick(rproc, rsc->notifyid);
> > >>>>>>
> > >>>>>> -  rsc->status = 0;
> > >>>>>> -  dev_dbg(&vdev->dev, "reset !\n");
> > >>>>>> +          /*
> > >>>>>> +           * When device completes reset, it is expected to set status
> > >>>>>> +           * to 0.
> > >>>>>> +           */
> > >>>>>> +          ret = readb_poll_timeout(&rsc->status, val, val == 0,
> > >>>>>> +                                   1000,      /* 1ms between reads */
> > >>>>>> +                                   3000000);  /* 3s total timeout */
> > >>>>>> +          if (ret)
> > >>>>>> +                  dev_warn(&vdev->dev, "vdev reset timed out\n");
> > >>>>>
> > >>>>> The problem here is that we are introducing behavior that is not compliant with
> > >>>>> the virtio specifications.  One way to acheive the same behavior could be for
> > >>>>> the remote processor to check rsc->status before sending a interrupt of using
> > >>>>> the virtqueues.
> > >>>>>
> > >>>>
> > >>>> That is what remote is supposed to do. But what if remote do not
> > >>>> respond? If remote is deadlocked for some reason, then the Linux will
> > >>>> hang at this point too. That is why we need some kind of timeout.
> > >>>
> > >>> If the remote is dead then a watchdog timer should fire at some point.
> > >>> Moreover, that situation won't be different from other circumstances where a
> > >>> remote processor locks up.
> > >>>
> > >>
> > >> There are few concerns:
> > >>
> > >> 1) Heterogeneous system where Linux is handling many remotes, the
> > >> watchdog might not be available to all the remotes or watchdog mechanism
> > >> is not implemented at all on the remote side.
> > >
> > > If a watchdog is not available adding a timeout upon resetting
> > > rsc-status won't help.
> > >
> > >>
> > >> 2) Let's say watchdog is configured for 10s, or so then for that long
> > >> Linux will be stuck too. I am trying to avoid this case where Linux gets
> > >> stuck for long time.
> > >
> > > Same resoning as above - if the remote processor dies and a watchdog
> > > timeout is set for 10 seconds, adding a shorter timeout when
> > > rsc->status is modified will do very little.
> > >
> > >>> Looking at your patch, sending a kick() won't do anything for a dead remote
> > >>> processor.  If the remote processor is alive, it should monitor rsc->status and
> > >>> take action when it is set to '0' by the host.  If it is locked-up, the normal
> > >>> lockup procedure should apply.
> > >>>
> > >>
> > >> Notifying virtio device on the status change is standard virtio
> > >> mechanism. In the virtio statck it's done via virtqueue_notify so I am
> > >> trying to do the same. It also helps remote to avoid polling on status.
> > >>
> > >
> > > Can you point me to that code?  Having the same mental picture will help.
> > >
> > >>> I'm not sure what problem this patch is trying to address.
> > >>>
> > >>
> > >> Some platforms allow Linux and Remote boot independently.
> > >>
> > >> Let's say Linux reboots without reseting the remote then during next
> > >> boot Linux will find virtio status is not in the reset state.
> > >>
> > >
> > > That should be handled via the attach()/detach() state machine.
> > >
> > >> In such case, linux need to issue virtio device reset, and wait until
> > >> RPU completes the reset and start the device again. The virtio framework
> > >> already issues the reset during boot here:
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/virtio/virtio.c?h=for-next#n570
> > >>
> > >> However, the virtio_reset implementation for remoteproc_virtio simply
> > >> set the status to 0, and doesn't wait for the remote to complete the
> > >> reset. Due to this, attach operation becomes successfull, but the rpmsg
> > >> channels are not created on the linux side.
> > >>
> > >
> > > I think this situation should be handled in driver code rather than
> > > the remoteproc framework.  We can consider adding this to the
> > > remoteproc framework if/when several platforms implement the same
> > > logic.  Otherwise I fear we'll bloat the framework with something that
> > > isn't generic.
> > >
> >
> > Hi Mathieu,
> >
> > The previous patch sent in this matter was doing the same:
> > https://lore.kernel.org/linux-remoteproc/20260317201251.3920841-1-tanmay.shah@amd.com/
> >
>
> I think this is a much better approach.  That said, I would really like to see
> something like wait_for_completion_timeout() being used rather than
> usleep_range().
>

Thinking back on this, function wait_event_timeout() would be a better choice.

> > If you are okay, can I resend it ? I think if that is accepted then we
> > don't need this patch atleast for now.
> >
> > Thank You,
> > Tanmay
> >
> > >> This patch solves this issue. It changes the reset mechanism while
> > >> maintaining the backward compatibility for old way of reseting the device.
> > >>
> > >> I had sent a different patch regarding this before:
> > >> https://lore.kernel.org/linux-remoteproc/20260317201251.3920841-1-tanmay.shah@amd.com/
> > >>
> > >> Old patch was rejected because we decided to modify the reset mechanism
> > >> instead:
> > >> https://lists.openampproject.org/archives/list/openamp-rp@lists.openampproject.org/thread/DDIFUMGQQ2R7CQZJHK7EB6UDO3ISAAVU/
> > >>
> > >> Thank You,
> > >> Tanmay
> > >>
> > >>
> > >>>>
> > >>>> I think timeout mechanism is better for AMP systems over waiting forever
> > >>>> for remote to clear the status.
> > >>>>
> > >>>> Thanks,
> > >>>> Tanmay
> > >>>>
> > >>>>
> > >>>>>> +  } else {
> > >>>>>> +          /* back compatible for RSC_VDEV type of rsc vdev */
> > >>>>>> +          rsc->status = 0;
> > >>>>>> +  }
> > >>>>>> +  dev_info(&vdev->dev, "reset !\n");
> > >>>>>>  }
> > >>>>>>
> > >>>>>>  /* provide the vdev features as retrieved from the firmware */
> > >>>>>> @@ -469,6 +506,9 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
> > >>>>>>  {
> > >>>>>>    struct virtio_device *vdev = dev_to_virtio(dev);
> > >>>>>>
> > >>>>>> +  /* reset virtio device before unregister */
> > >>>>>> +  virtio_reset_device(vdev);
> > >>>>>> +
> > >>>>>
> > >>>>> Regardless of this feature, I think it is wise to reset the device before
> > >>>>> unregistering with the virtio subsystem.
> > >>>>>
> > >>>>
> > >>>> Agreed. I intend to keep this.
> > >>>>
> > >>>>> Thanks,
> > >>>>> Mathieu
> > >>>>>
> > >>>>>>    unregister_virtio_device(vdev);
> > >>>>>>    return 0;
> > >>>>>>  }
> > >>>>>> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
> > >>>>>> index 71b60125310e..2398a6d7033e 100644
> > >>>>>> --- a/include/linux/rsc_table.h
> > >>>>>> +++ b/include/linux/rsc_table.h
> > >>>>>> @@ -66,6 +66,8 @@ struct fw_rsc_hdr {
> > >>>>>>   *                    the remote processor will be writing logs.
> > >>>>>>   * @RSC_VDEV:       declare support for a virtio device, and serve as its
> > >>>>>>   *                    virtio header.
> > >>>>>> + * @RSC_VDEV_V2:    declare support for a virtio device whose reset request is
> > >>>>>> + *                    encoded in the virtio status byte.
> > >>>>>>   * @RSC_LAST:       just keep this one at the end of standard resources
> > >>>>>>   * @RSC_VENDOR_START:     start of the vendor specific resource types range
> > >>>>>>   * @RSC_VENDOR_END:       end of the vendor specific resource types range
> > >>>>>> @@ -83,7 +85,8 @@ enum fw_resource_type {
> > >>>>>>    RSC_DEVMEM              = 1,
> > >>>>>>    RSC_TRACE               = 2,
> > >>>>>>    RSC_VDEV                = 3,
> > >>>>>> -  RSC_LAST                = 4,
> > >>>>>> +  RSC_VDEV_V2             = 4,
> > >>>>>> +  RSC_LAST                = 5,
> > >>>>>>    RSC_VENDOR_START        = 128,
> > >>>>>>    RSC_VENDOR_END          = 512,
> > >>>>>>  };
> > >>>>>>
> > >>>>>> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
> > >>>>>> --
> > >>>>>> 2.43.0
> > >>>>>>
> > >>>>
> > >>
> >
