Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC35321CA03
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Dec 2025 01:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765761255; cv=none; b=TOaZuycUQJgdRCo5LlgBkyzQEtgFof1Xw97FNgY+vN74wRQ3QVXxFAfjmtsYkA+zGw443rv31CfL9pn13Cc4i8PaZukdlHbF9eDC78ptBSher1XiahdwLNvZy1levAti4LYPDtMrtgg26r3rYCGBU64Pwt8b4G6Jabtf3Fxxrjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765761255; c=relaxed/simple;
	bh=88bPpntIhdNcLehdsEno3nfx3lVZUrQdCIpCx36pBEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWWrjKAftq8w3u42RmkF8ZYd+MFUZ56h44G9M5soNGB9uO5aJ0fVIJgeSTQ0fH1/2fGmSGugHhk2z4/hhXvvWQcvHMULrB9FOfjmOfOmuJEoWWLzixNEM8tSgQUsd4rKcj6wdMoa+MtmgeoXhj5WzqGSF8Ta0TMCA2qE7AOZs/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ajxzXOcl; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ajxzXOcl"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a081c163b0so16551895ad.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 14 Dec 2025 17:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765761253; x=1766366053; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3d60J3WZ0abyaWulvNv1Ih85c77Ca6ChpFYHa4mstdE=;
        b=ajxzXOclynvXcBQqDTUyeCepDtsJRH7SPrjgmfjUfSL/jVSvFAJCm9ab0nuGAayW1E
         pPhTmKgSAzoo1aSS1+mIlGwy+7ckL3fOVMaHhL/F0Y1Lm4fIVuvIeGD111xEhTHZjIO6
         xAa4bEqaABL/q8CgCrtdcKLfipGxS0ZZy5cWY8Kjqd7OCDaNtA9STp1ErBgY41GnKuPE
         hE0zftkusBVGPV8JBIoQx4ahxhQZxO1Lsk48nrEM8Hz/VZksAyT47dR95UQxos6nzQhP
         rw0fJgDfkyhv0svLYXsLkvQC9mn5aew99pAxK+GwmgDZ481O2bkaZyl1nLYNYp6kfEeQ
         1WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765761253; x=1766366053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3d60J3WZ0abyaWulvNv1Ih85c77Ca6ChpFYHa4mstdE=;
        b=PwbnpipCROK9Opf6X9jp7zO5NAqp3diOt5L2y2D21RrPAZ7bBIEo5kKWlGGj9U85zh
         EmSzG76YMe2Bb2+Y8pF5gOd4KQKgJTQ0ZZBJYaRjyP39DGyUh0t1mbgcj63lAKfUxtz6
         XGd0YST0ieoDFp/BIuR4ePn+NcImeqVq8yKMguwAJuJJE5AjZZogFGIS3ffaPnzKXz9x
         R4IdP74rh4Q7qzLSTad8/DY15cld92o7s5nXwOlx5KbWLF34qWtAO88S6z77hM5HeNQE
         Gy3w7mi03Ur+ItoJg0SCpWuwAt+6WzBx4kj/Shst+zglaFwq2Op7XjDxiKF5yAEkkvb5
         cM+g==
X-Forwarded-Encrypted: i=1; AJvYcCVoI47CiTqBVB5ujp/LATUfybIy8PsxNn93NjopB250rGh0DBYRJ/QHUVjL75w5Yq01O2GcKrFmdJEh0482Mg0V@vger.kernel.org
X-Gm-Message-State: AOJu0YyrI5ILwxcZT+Fo/aJjorWM4ZRWacdAivhR9/wJkHkyxSppOVeH
	B58ZiR+ZjUpaXE0TvS+idaoVty/2iVlyVzvZFgyCYNswddm2PPt+FwCGZNdu+eHZhIY=
X-Gm-Gg: AY/fxX5u7hiJ4+K492juPbC5XrQWQml+MkL5p5J/bSDf/uXrZ711fTQ9LPlJYJS4gck
	WQD6TuHmyFcXH/mFLYqIysd+rIWt5ZfDnJuqQXaqRCENxyasiqCwnYYzHX4spCY6x2pZ0MmDavZ
	13Ti2mIIWc/gd+N124dX8uDxJKkAUewH7NrvUTgJKeRljH2NTs81HrcpzFTN0pahVQJajZGlRP9
	7IniJgMwlMeZlhPHSIVWccx6WrwJZeddx1Cc7S6Ci4RKJRNLRCNckkK73DfvhnmqMFi/vnXtnXy
	Sd8qlC67fD3/KtguvkOPXIyP7WPnm1z3WkDhvupcQqG9qkqc/Sy19uq2IBzaWlByHqbSgCromKS
	Ilh2OAldINEYewZvGp34IFyw/ktdnk/6w7Dyc905KL7TAPnXLnF4vqAfM9IX4ljRWmhocU9v9Xr
	lemOM2vStTIqALzqVCGxP7HkQ3t9PfAIi4RTr0K/sTUsZi7DWTzd4V
X-Google-Smtp-Source: AGHT+IG8+iH8744guE70WWn3yTrdXQoU+87X04Z+ivjiAnpTXO0n1NkKludE8N7RDMGLrKpd9hUBow==
X-Received: by 2002:a17:902:e94d:b0:295:6d30:e25f with SMTP id d9443c01a7336-29f243879d8mr88304805ad.53.1765761253057;
        Sun, 14 Dec 2025 17:14:13 -0800 (PST)
Received: from p14s (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0b465de71sm33354105ad.41.2025.12.14.17.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 17:14:12 -0800 (PST)
Date: Sun, 14 Dec 2025 18:14:08 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: Stefan Roese <stefan.roese@mailbox.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [v3 PATCH] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
Message-ID: <aT9g4FcdJdec01_q@p14s>
References: <20251204104009.129483-1-stefan.roese@mailbox.org>
 <b8951794-f720-49a9-9b21-1971a364c956@amd.com>
 <fcd670a1-75c9-4a18-89cf-52c12ff0c07c@mailbox.org>
 <747f8248-bbd8-4580-bc57-3efda9f50eb0@oss.qualcomm.com>
 <d78ab175-e235-4f14-9b36-199209f0da9c@mailbox.org>
 <1adb380c-4b57-4799-8e3f-f9ba5d14eb18@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1adb380c-4b57-4799-8e3f-f9ba5d14eb18@amd.com>

On Wed, Dec 10, 2025 at 12:28:52PM -0600, Tanmay Shah wrote:
> Hello, please check my comments below:
> 
> On 12/10/25 2:29 AM, Stefan Roese wrote:
> > Hi Tanmay,
> > 
> > On 12/10/25 03:51, Zhongqiu Han wrote:
> > > On 12/5/2025 8:06 PM, Stefan Roese wrote:
> > > > Hi Tanmay,
> > > > 
> > > > On 12/4/25 17:45, Tanmay Shah wrote:
> > > > > Hello,
> > > > > 
> > > > > Thank You for your patch. Please find my comments below.
> > > > > 
> > > > > On 12/4/25 4:40 AM, Stefan Roese wrote:
> > > > > > Testing on our ZynqMP platform has shown, that some R5 messages might
> > > > > > get dropped under high CPU load. This patch creates a new high-prio
> > > > > 
> 
> This commit text should be fixed. Messages are not dropped by Linux, but R5
> can't send new messages as rx vq is not processed by Linux.
>

I agree.
 
> > > > > Here, I would like to understand what it means by "R5
> > > > > messages might get dropped"
> > > > > 
> > > > > Even under high CPU load, the messages from R5 are stored in
> > > > > the virtqueues. If Linux doesn't read it, then it is not
> > > > > really lost/ dropped.
> > > > > 
> > > > > Could you please explain your use case in detail and how the
> > > > > testing is conducted?
> > > > 
> > > > Our use-case is, that we send ~4k messages per second from the R5 to
> > > > Linux - sometimes even a bit more. Normally these messages are received
> > > > okay and no messages are dropped. Sometimes, under "high CPU load"
> > > > scenarios it happens, that the R5 has to drop messages, as there is no
> > > > free space in the RPMsg buffer, which is 256 entries AFAIU. Resulting
> > > > from the Linux driver not emptying the RX queue.
> > > > 
> 
> Thanks for the details. Your understanding is correct.
> 
> > > > Could you please elaborate on these virtqueues a bit? Especially why no
> > > > messages drop should happen because of these virtqueues?
> > > 
> > > AFAIK, as a transport layer based on virtqueue, rpmsg is reliable once a
> > > message has been successfully enqueued. The observed "drop" here appears
> > > to be on the R5 side, where the application discards messages when no
> > > entry buffer is available.
> > 
> > Correct.
> > 
> > > In the long run, while improving the Linux side is recommended,
> > 
> > Yes, please.
> > 
> > > it could
> > > also be helpful for the R5 side to implement strategies such as an
> > > application-level buffer and retry mechanisms.
> > 
> > We already did this. We've added an additional buffer mechanism to the
> > R5, which improved this "message drop situation" a bit. Still it did not
> > fix it for all our high message rate situations - still resulting in
> > frame drops on the R5 side (the R5 is a bit resource restricted).
> > 
> > Improving the responsiveness on the Linux side seems to be the best way
> > for us to deal with this problem.
> > 
> 
> I agree to this. However, Just want to understand and cover full picture
> here.
> 
> On R5 side, I am assuming open-amp library is used for the RPMsg
> communication.
> 
> rpmsg_send() API will end up here: https://github.com/OpenAMP/open-amp/blob/be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/rpmsg/rpmsg_virtio.c#L384
> 
> Here, if the new buffer is not available, then R5 is supposed to wait for
> 1ms before sending a new message. After 1ms, R5 will try to get buffer
> again, and this continues for 15 seconds. This is the default mechanism.
> 
> This mechanism is used in your case correctly ?
> 
> Alternatively you can register platform specific wait mechanism via this
> callback: https://github.com/OpenAMP/open-amp/blob/be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/include/openamp/rpmsg_virtio.h#L42
> 
> Few questions for further understanding:
> 
> 1) As per your use case, 4k per second data transfer rate must be maintained
> all the time? And this is achieved with this patch?
> 
> Even after having the high priority queue, if someone wants to achieve 8k
> per seconds or 16k per seconds data transfer rate, at some point we will hit
> this issue again.
>

Right, I also think this patch is not the right solution.

> The reliable solution would be to keep the data transfer rate reasonable,
> and have solid re-try mechanism.
> 
> I am okay to take this patch in after addressing comments below but, please
> make sure all above things are r5 side is working as well.

Tanmay is correct on all front.

> 
> Thanks,
> Tanmay
> 
> 
> > Thanks,
> > Stefan
> > 
> > > 
> > > > 
> > > > Thanks,
> > > > Stefan
> > > > 
> > > > > Thanks,
> > > > > Tanmay
> > > > > 
> > > > > > workqueue which is now used instead of the default system workqueue.
> > > > > > With this change we don't experience these message drops any more.
> > > > > > 
> > > > > > Signed-off-by: Stefan Roese <stefan.roese@mailbox.org>
> > > > > > Cc: Tanmay Shah <tanmay.shah@amd.com>
> > > > > > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > > > ---
> > > > > > v3:
> > > > > > - Call cancel_work_sync() before freeing ipi (suggested
> > > > > > by Zhongqiu Han)
> > > > > > 
> > > > > > v2:
> > > > > > - Also call destroy_workqueue() in
> > > > > > zynqmp_r5_cluster_exit() (suggested by Zhongqiu Han)
> > > > > > - Correct call seq to avoid UAF (suggested by Zhongqiu Han)
> > > > > > 
> > > > > >   drivers/remoteproc/xlnx_r5_remoteproc.c | 23 ++++++++++++++++++++++-
> > > > > >   1 file changed, 22 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c
> > > > > > b/drivers/ remoteproc/xlnx_r5_remoteproc.c
> > > > > > index feca6de68da28..308328b0b489f 100644
> > > > > > --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> > > > > > +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > > > > > @@ -16,6 +16,7 @@
> > > > > >   #include <linux/of_reserved_mem.h>
> > > > > >   #include <linux/platform_device.h>
> > > > > >   #include <linux/remoteproc.h>
> > > > > > +#include <linux/workqueue.h>
> > > > > >   #include "remoteproc_internal.h"
> > > > > > @@ -116,6 +117,7 @@ struct zynqmp_r5_cluster {
> > > > > >       enum  zynqmp_r5_cluster_mode mode;
> > > > > >       int core_count;
> > > > > >       struct zynqmp_r5_core **r5_cores;
> > > > > > +    struct workqueue_struct *workqueue;
> > > > > >   };
> > > > > >   /**
> > > > > > @@ -174,10 +176,18 @@ static void
> > > > > > handle_event_notified(struct work_struct *work)
> > > > > >   static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
> > > > > >   {
> > > > > >       struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> > > > > > +    struct zynqmp_r5_cluster *cluster;
> > > > > >       struct mbox_info *ipi;
> > > > > > +    struct device *dev;
> > > > > >       size_t len;
> > > > > >       ipi = container_of(cl, struct mbox_info, mbox_cl);
> > > > > > +    dev = ipi->r5_core->dev;
> > > > > > +    cluster = dev_get_drvdata(dev->parent);
> > > > > > +    if (!cluster) {
> > > > > > +        dev_err(dev->parent, "Invalid driver data\n");
> > > > > > +        return;
> > > > > > +    }
> > > > > >       /* copy data from ipi buffer to r5_core */
> > > > > >       ipi_msg = (struct zynqmp_ipi_message *)msg;
> > > > > > @@ -195,7 +205,7 @@ static void
> > > > > > zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
> > > > > >       if (mbox_send_message(ipi->rx_chan, NULL) < 0)
> > > > > >           dev_err(cl->dev, "ack failed to mbox rx_chan\n");
> > > > > > -    schedule_work(&ipi->mbox_work);
> > > > > > +    queue_work(cluster->workqueue, &ipi->mbox_work);
> > > > > >   }
> > > > > >   /**
> > > > > > @@ -1154,6 +1164,7 @@ static void zynqmp_r5_cluster_exit(void *data)
> > > > > >       for (i = 0; i < cluster->core_count; i++) {
> > > > > >           r5_core = cluster->r5_cores[i];
> > > > > > +        cancel_work_sync(&r5_core->ipi->mbox_work);
> 
> I see merge-conflict on top of the for-next branch. Please rebase the patch
> on top of the for-next branch: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/log/?h=for-next
> 
> 
> > > > > >           zynqmp_r5_free_mbox(r5_core->ipi);
> > > > > >           of_reserved_mem_device_release(r5_core->dev);
> > > > > >           put_device(r5_core->dev);
> > > > > > @@ -1162,6 +1173,7 @@ static void zynqmp_r5_cluster_exit(void *data)
> > > > > >       }
> > > > > >       kfree(cluster->r5_cores);
> > > > > > +    destroy_workqueue(cluster->workqueue);
> > > > > >       kfree(cluster);
> > > > > >       platform_set_drvdata(pdev, NULL);
> > > > > >   }
> > > > > > @@ -1194,11 +1206,20 @@ static int
> > > > > > zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> > > > > >           return ret;
> > > > > >       }
> > > > > > +    cluster->workqueue = alloc_workqueue(dev_name(dev),
> > > > > > +                         WQ_UNBOUND | WQ_HIGHPRI, 0);
> > > > > > +    if (!cluster->workqueue) {
> > > > > > +        dev_err_probe(dev, -ENOMEM, "cannot create workqueue\n");
> > > > > > +        kfree(cluster);
> > > > > > +        return -ENOMEM;
> > > > > > +    }
> > > > > > +
> 
> Workqueue will be unused if mbox properties are not mentioned in the
> device-tree. So, we need to allocate workqueue only if IPI is setup for at
> least one core. I think following logic should work:
> 
> Make decision if workqueue is needed or not, if zynqmp_r5_setup_mbox()
> function is passing for atleast one core. If zynqmp_r5_setup_mbox() is
> success, then set a flag to allocate workqueue, and then later right before
> calling zynqmp_r5_core_init() allocate the workqueue for the cluster.
> 
> Remoteproc can be used only to load() and start() stop() fw, and RPMsg can
> be optional.
> 
> Also, before calling destroy_workqueue make sure to have NULL check and
> destroy only if it was allocated.
> 
> Thanks,
> Tanmay
> 
> > > > > >       /* wire in so each core can be cleaned up at driver remove */
> > > > > >       platform_set_drvdata(pdev, cluster);
> > > > > >       ret = zynqmp_r5_cluster_init(cluster);
> > > > > >       if (ret) {
> > > > > > +        destroy_workqueue(cluster->workqueue);
> > > > > >           kfree(cluster);
> > > > > >           platform_set_drvdata(pdev, NULL);
> > > > > >           dev_err_probe(dev, ret, "Invalid r5f subsystem
> > > > > > device tree\n");
> > > > > 
> > > > 
> > > 
> > > 
> > 
> 
