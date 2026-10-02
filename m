Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A560F4F93CC
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Oct 2026 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958884; cv=pass; b=k+OiSogFjr2biva4SYL9U8ZVlBc3fHXbByHlhvyH5L+XF9xhcQ4dahgjoo2lX42Wz8XUI9HDr2RQOkjlf59+KspRh+dvzdGaXGGItDzAaxv4gi6FaiLvml30LcwVYE2rBa/sjUR8Sw1iHDV6VXgRJW6VHdP1DTAuUdFAlj1HhS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958884; c=relaxed/simple;
	bh=kyGG97NiUwbxqy7J9CmBK8sT28vxnfJtEoyI3V98l3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h++4A9ogAVZj23ajc20XA9zofFb4EjkgT/NPjrhfGycnnBc3eus2PMmu94XmbO00++X/WAoChJaGEcmjIn1Yrl9ZCKU9B/YrbJEhOOGdKxMHWokCACvMR6ZxEcynPc7uWCk6LkpKJAMOZXaLVNf3vXn6f3FLIMYbQXcj4hd0gik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HdlXyWqb; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdlXyWqb"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6af9cc73235so134740a12.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 Oct 2026 09:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790958880; cv=none;
        d=google.com; s=arc-20260327;
        b=Py4pP2a9ktXmvepJjDgFgIIHuyVPvbBM9vSK3ynKmZn6EDsLa3X80B+xkrp5qjPTJa
         D+kSR+vsyKjiOC3R3xz4RwvrHyfeXA5XHhZbjcLciqABcN4opgONVqoNW3hRPkYxE1p6
         Gtbc/3nPr1XzQX1UPlXoMA24YL2FVJ4wkskU7KGoORxodzGyDJu8vIx6lEtG7jcqZdIJ
         SwK28a9g53FA6lXbLoQCLF9gSXCsuyy058u1VMOjdUTTGLCmfe2Y8XdZOJF8Pwj3pPu2
         LYVjh2zjkJg38oldk4/CiUXUuwoKGzBxc5bIiYpUZdnPP5wKpIZi1GZJr9sgeXSnDg5u
         bFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MksekO+MSLkGrBlhvN5gTB12u9YT563qpJvDNcoiCfc=;
        fh=CQW68e75DBNy8ojLauQUeOk8lGfQE4GWjy08Vyex6w4=;
        b=lAmxoqmHTmp3CJVxSiDBWNWv8B9vaIzEqGPfQAbN2jh9AwV50VzC2RBvMF0qi5Vhm7
         uV3xPz449T8SnkjGVqItlCN7galx+jRIRl8bGRYbwnwiYhxTNShiniPogvIWKQfpuF9v
         q/pD9V2m6i5qIaMRKEnixmcY90QkwjYa/DZU7ZQS7ow0spBQktvPTn3pqa1KSQ7GdPwP
         pD2KAwocUIL+yy+aYotBeCqiCrIkuufUjSpQaAWfkMYpRkKBljUdT3B9S3KDTkvsM543
         X+r/W4QQoAWj7gB6kL29VCLGU6a/kQGKQ6Ol29ES/5M5Swb4I5ZSzIc9C1RnRmK0zb9k
         iABA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790958880; x=1791563680; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MksekO+MSLkGrBlhvN5gTB12u9YT563qpJvDNcoiCfc=;
        b=HdlXyWqb/uzY99S2lyyUokkGIUNfWosuDoeyejPTBb4xOKM9AuOZZim0MURD9y2hrm
         g+ZUW7xBG2R21Ka1vgzkDxIAZgqPOF4mWtwAoV7MBiZsi+Tw+DfWCrivbiFk364hfgPJ
         u4NhU7Pu1iDgz7Q3LZYSf8OGjQM+7E3TQ+nAuYL/VXdOyXlB7HDp3fyTclw9iEaDxU/N
         b5GgzbG+Ij/6Y6vwviBHjmRI4OvG/sUsJHx4rax1RAQ3ywY6bkzGM7/vIeYZP/ToS1zD
         C1yx2sRUOMdeWjGb1YYi6Hh938q4VkApDI/5/iAb2G6Xi2O6+kP2ruFidWjmyCiHpy6K
         0iJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958880; x=1791563680;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MksekO+MSLkGrBlhvN5gTB12u9YT563qpJvDNcoiCfc=;
        b=YgsivfcnQyC9hXT4gtBrL8xOwuCRkg8RCQiVBOQg8Oa9gq+6XCZLeaZC+yjJvfSUES
         W7HT+RlTJNb0D8VRUuRTJw2h4fdW+nJqVx0esKSU1N7l7V5vT5PajXMArZu0PEkaBI/8
         ibFdw4TnoZXVCtAsg8Oa2DXVMmRgcwllChC8e/nckMkKlvVDPSnTNuaKhNO8vGmnp5kh
         72A7yYMNnEYU2kURJJcy5D/8FRbsOROpVxWHggd7CAEaKE/hWO0Oi2I37f+3IBP9fN1C
         Mew7DBdten0AgNAj1Z+YUVJ7NoQOlLZ7ZZaM5ktNILL6QnuvVgyj+Ro7F3uwAxRY3R9d
         2MqQ==
X-Forwarded-Encrypted: i=1; AKwUvByjV0Y6SiIu49uP3E27yu7+QVzz/EyIiYQqlCAjtTfqL06DsSapOf9mjxjo4wKrIcl5MT0LdxdNjNKkGEXZPQD5@vger.kernel.org
X-Gm-Message-State: AFq9FYJASMEFI3MHm/xPu7lzB8U87P0o4LS1xnhaS4XoMlZfC1IVQeKz
	FTN1JqS6dVrB0shc4LTHTUwxySKUZ/M/MJvxmDzx+jf6AVLIQpmKzCFCIYgv8toynys78wuI6gb
	SCfS2StSm8ZUW8Z/dtkkgVre1RITAx97uyDQQeBUylQ==
X-Gm-Gg: AYBFou3RJU7QuNzMKR1X8wGncpKpGni5tD1mfBSrT32JwpeLFZuW+ibNd6mndLUHOZm
	m5DIsOiSdtStW4RrNbhy0XdVpay3lvBkAqUfR9XgeRl+/udAybh7P3GG82bNmQ96HLMl4d3Xdrt
	ptzBY2l/C52jHL4KjNgNJ9T/zTXK3P2Mgn8unpwfCnBVUFfimN3/Pwt0h1Uv/l7440RJ383JrPZ
	11G1IBKNfsOUcaO0lgZE79wCpCUFMTQJuVkMcDscbwuX/PLieunxP5P6n2/+1j3rGhPI5/3HBHO
	zzAmS3RFZVNo/qwmM+nFoPMPhgfxOrnnDx+jZccOl/THVmNGuxvLHfgPg7Llr6CBcWbPRjkeJm5
	ZxQqHbKD5TxRyyLfQKtktHdRi
X-Received: by 2002:a17:907:2da2:b0:c2a:fe4e:61c5 with SMTP id
 a640c23a62f3a-c2e33ffd009mr512655366b.22.1790958880499; Fri, 02 Oct 2026
 09:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924203409.2484068-1-tanmay.shah@amd.com> <ar04gWStZiwMUogH@p14s>
 <2a4054f2-624c-4479-a4fb-8acd9b9654d3@amd.com>
In-Reply-To: <2a4054f2-624c-4479-a4fb-8acd9b9654d3@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 2 Oct 2026 10:34:28 -0600
X-Gm-Features: AclHuK_Tjl5pmr2hlp_pRWsX_qLl7w88-ZDc0t-stunuOVrLW5eJ12QNo39CA0k
Message-ID: <CANLsYkxGSgO1pY9Wcbt3mtThaN2_ULKQHFL+qfRGGQV19D7nbA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: xlnx: reset virtio status during attach
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 10:51, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 9/30/2026 11:27 AM, Mathieu Poirier wrote:
> > Hi,
> >
> > On Thu, Sep 24, 2026 at 01:34:09PM -0700, Tanmay Shah wrote:
> >> On AMD-Xilinx platforms cortex-A and cortex-R can be configured as
> >> separate subsystems. In this case, both cores can boot independent of
> >> each other. This is platform management firmware configuration to manage
> >
> > I'm not sure to understand what the above sentence adds to the changelog.  I
> > suggest either reworking or removing.
> >
>
> Ack, I will remove it.
>
> >> cores. In such a configuration, if Linux went through an uncontrolled
> >> reboot during active rpmsg communication, then during next boot it can
> >> find rpmsg virtio status not in the reset state. In such case it is
> >> important to reset the virtio status during attach callback and wait
> >> for the remote to handle virtio device reset. After reset, the remote
> >> is expected to generate the notification to the host or the host will
> >> eventually timeout and continue the normal boot flow.
> >>
> >> Assisted-by: LLM
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>  drivers/remoteproc/xlnx_r5_remoteproc.c | 74 +++++++++++++++++++++++++
> >>  1 file changed, 74 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> index 630621288430..6e7e2a5ea83c 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -6,6 +6,7 @@
> >>
> >>  #include <linux/dma-mapping.h>
> >>  #include <linux/firmware/xlnx-zynqmp.h>
> >> +#include <linux/jiffies.h>
> >>  #include <linux/kernel.h>
> >>  #include <linux/mailbox_client.h>
> >>  #include <linux/mailbox/zynqmp-ipi-message.h>
> >> @@ -15,6 +16,7 @@
> >>  #include <linux/of_reserved_mem.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/remoteproc.h>
> >> +#include <linux/wait.h>
> >>
> >>  #include "remoteproc_internal.h"
> >>
> >> @@ -33,6 +35,8 @@
> >>  #define RSC_TBL_XLNX_MAGIC  ((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
> >>                               (uint32_t)'m' << 8 | (uint32_t)'p')
> >>
> >> +#define RPROC_ATTACH_TIMEOUT_US (1000 * 1000)
> >> +
> >
> > Please see if you can use a kernel defined time constant instead of minting your
> > own.
> >
>
> Ack.
>
> >>  /*
> >>   * settings for RPU cluster mode which
> >>   * reflects possible values of xlnx,cluster-mode dt-property
> >> @@ -167,6 +171,9 @@ struct xlnx_rproc_crash_report {
> >>   * @rsc_tbl_size: resource table size retrieved from remote
> >>   * @pm_domain_id: RPU CPU power domain id
> >>   * @ipi: pointer to mailbox information
> >> + * @attach_wq: wait queue for attach-time vdev reset acknowledgment
> >
> > I don't understand the explanation for @attach_wq - please rework.
> >
> >> + * @waiting_for_attach_ack: whether attach is waiting for remote interrupt
> >> + * @attach_ack: remote interrupt observed while attach wait is active
> >>   */
> >>  struct zynqmp_r5_core {
> >>      struct xlnx_rproc_crash_report *crash_report;
> >> @@ -181,6 +188,9 @@ struct zynqmp_r5_core {
> >>      u32 rsc_tbl_size;
> >>      u32 pm_domain_id;
> >>      struct mbox_info *ipi;
> >> +    wait_queue_head_t attach_wq;
> >> +    bool waiting_for_attach_ack;
> >> +    bool attach_ack;
> >>  };
> >>
> >>  /**
> >> @@ -270,10 +280,17 @@ static void handle_event_notified(struct work_struct *work)
> >>  static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
> >>  {
> >>      struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> >> +    struct zynqmp_r5_core *r5_core;
> >>      struct mbox_info *ipi;
> >>      size_t len;
> >>
> >>      ipi = container_of(cl, struct mbox_info, mbox_cl);
> >> +    r5_core = ipi->r5_core;
> >
> > Is there really a chance that ipi->r5_core be NULL?
> >
>
> Recently, INIT_WORK was moved before
> mbox_request_channel_byname(mbox_cl, "rx"), In this case, if interrupt
> occurs between requesting "rx" channel, and assigning r5_cores to ipi,
> then r5_core can be NULL.
>
> >> +
> >> +    if (r5_core && READ_ONCE(r5_core->waiting_for_attach_ack)) {
> >> +            WRITE_ONCE(r5_core->attach_ack, true);
> >
> > Why use READ_ONCE/WRITE_ONCE here - what does it give you?
> >
>
> I think this was added by AI agent, and I think it is to maintain atomic
> nature of variable access. But if you prefer to protect these variables
> via locks I will do that. These variables are shared between attach()
> context and IPI interrupt, so I think they should be protected somehow.
>

READ_ONCE/WRITE_ONCE don't guard against concurrency, only against
access reordering.

> >> +            wake_up(&r5_core->attach_wq);
> >> +    }
> >
> > If @rsc->status has been set to 0 in zynqmp_r5_attach() and an IPI is received
> > before ->kick(), the core may erroneously think the remote processor is
> > acknowleging the reset.
> >
>
> Ack. Probably need to set these flags after kick(). I will do that.
>
> >>
> >>      /* copy data from ipi buffer to r5_core if IPI is buffered. */
> >>      ipi_msg = (struct zynqmp_ipi_message *)msg;
> >> @@ -820,6 +837,62 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
> >>
> >>  static int zynqmp_r5_attach(struct rproc *rproc)
> >>  {
> >> +    struct zynqmp_r5_core *r5_core = rproc->priv;
> >> +    struct device *dev = &rproc->dev;
> >> +    bool wait_for_remote = false;
> >> +    struct fw_rsc_vdev *rsc;
> >> +    struct fw_rsc_hdr *hdr;
> >> +    int i, offset, avail;
> >> +    long time_left;
> >> +
> >> +    if (!rproc->table_ptr)
> >> +            goto attach_success;
> >> +
> >> +    for (i = 0; i < rproc->table_ptr->num; i++) {
> >> +            offset = rproc->table_ptr->offset[i];
> >> +            hdr = (void *)rproc->table_ptr + offset;
> >> +            avail = rproc->table_sz - offset - sizeof(*hdr);
> >> +            rsc = (void *)hdr + sizeof(*hdr);
> >> +
> >> +            /* make sure table isn't truncated */
> >> +            if (avail < 0) {
> >> +                    dev_err(dev, "rsc table is truncated\n");
> >> +                    return -EINVAL;
> >> +            }
> >> +
> >> +            if (hdr->type != RSC_VDEV)
> >> +                    continue;
> >> +
> >> +            /*
> >> +             * reset vdev status, in case previous run didn't leave it in
> >> +             * a clean state.
> >> +             */
> >> +            if (rsc->status) {
> >> +                    rsc->status = 0;
> >> +                    wait_for_remote = true;
> >> +                    break;
> >> +            }
> >> +    }
> >> +
> >> +    if (wait_for_remote) {
> >> +            WRITE_ONCE(r5_core->attach_ack, false);
> >> +            WRITE_ONCE(r5_core->waiting_for_attach_ack, true);
> >> +    }
> >
> > Again, I would like to understand the motivation behind using WRITE_ONCE()
> > here...  I just don't see what kind of re-ordering issue you need to guard
> > against.
> >
>
> Ack. I will remove and introduce locks if that plan works.
>
> >> +
> >> +    /* kick remote to notify about attach */
> >> +    rproc->ops->kick(rproc, 0);
> >
> > Will older FW be able to deal with this properly?
> >

This question hasn't been answered.

> >> +
> >> +    if (wait_for_remote) {
> >> +            time_left = wait_event_timeout(r5_core->attach_wq,
> >> +                                           READ_ONCE(r5_core->attach_ack),
> >> +                                           usecs_to_jiffies(RPROC_ATTACH_TIMEOUT_US));
> >
> > The condition where the driver is removed or the remoteproc shut down needs also
> > needs to be handled as a break out condition.
> >
>
> So this whole feature will be helpful only if linux gets rebooted
> without proper cleanup. If driver is removed, it will call detach() via
> zynqmp_cluster_exit(). If machine goes throug 'reboot' command, then the
> driver has 'shutdown' callback registered which will call 'detach()'
> operation. In these cases the remoteproc reset is guranteed and the
> status will be 0 on next boot.
>
> But if linux didn't get chance to execute above callbacks, only then the
> status will be left non-zero on reboot.
>

What if you insmod the driver after an unexpected reboot and then
rmmod the driver while waiting for the remote processor to come back
up?

> > Thanks,
> > Mathieu
> >
> >> +            WRITE_ONCE(r5_core->waiting_for_attach_ack, false);
> >> +
> >> +            if (!time_left)
> >> +                    dev_warn(dev, "timeout waiting for remote vdev reset ack\n");
> >> +    }
> >> +
> >> +attach_success:
> >>      dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
> >>
> >>      return 0;
> >> @@ -920,6 +993,7 @@ static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
> >>      r5_core = r5_rproc->priv;
> >>      r5_core->dev = cdev;
> >>      r5_core->np = dev_of_node(cdev);
> >> +    init_waitqueue_head(&r5_core->attach_wq);
> >>      if (!r5_core->np) {
> >>              dev_err(cdev, "can't get device node for r5 core\n");
> >>              ret = -EINVAL;
> >>
> >> base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
> >> --
> >> 2.43.0
> >>
>
