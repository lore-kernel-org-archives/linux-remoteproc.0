Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2244776F
	for <linux-remoteproc@vger.kernel.org>; Mon,  1 Apr 2024 16:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711987316; cv=none; b=HA3TGtzLwKYCk9UC2i1CLjHCCi4D3CRjelNAzR+MHwiMGaExAtsne4DKKV0qb09kS4UTpODiVxLC7DZBCk+oFFA2WXGWPgG77qQ3Ehrk4yU+VPJpUssL9vCdsNCmhDlI19JqT0GPKOG8wJbXnRJSNc5W/XoNB7YMQA+zgGmAUCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711987316; c=relaxed/simple;
	bh=3jY/J46RZtli8mScReLicmAc9lElr0SHi5G+SHCPV0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UO16yU42dlhpSW9GEl00Ora1VLrng4WpBH7mtQANQeW1GTjW3yMAbG/Nbz+AYpJbj7+wuIVD6Q5LECpwXZ3v+wPgK5UH24ts8jAozuU53sdk0M+6cVxZo8P0iUey+iodTMzsnOkXEHOmlJ4hkimI+/aED5QXLvKIUoonAdMzyYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TPjhSYV3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TPjhSYV3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e0f0398553so37320535ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Apr 2024 09:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711987314; x=1712592114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iFnuB6vS67T3Bx2L10cFFT7Mq1afjPSG44HJZCE7BdQ=;
        b=TPjhSYV3goylMPbwtoV9tWPNmBVjTJbtCVNGpoq8Tr3WfuDPFq89LZib+fOnRe819G
         xd5GpKWKDoc5ADwdz4/F5cUry6pvM04sqBCacB2gH0VcvwsULnruM+XLEJdVFFIVTEwN
         PGPEveinozZ3xqg63HHTCdwBytX0S912RwphNBHt5Q3tugWbTKyEapBDaeASxwEuWpvK
         e/Kg1m05+t5SsNHw5X2EtpeUnmlWxBIyKWJsXdS7PZX6ricKCzB4KK7fHKNQl6rtvD3u
         wIJktqs+PATq5dNU3Qop5KNZzt4E5x3d6YyMBFR0KRV66/P3XRusV8vebMeCTqnDRhm/
         SnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711987314; x=1712592114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFnuB6vS67T3Bx2L10cFFT7Mq1afjPSG44HJZCE7BdQ=;
        b=OBzdhtUs6hUIehLG73XtoK+9Aj//vRPjdy8eij8B0X1l1WYaWjsh9NLcYZWieLbPiL
         N43Cu/C/iz0dMsGFoZ9/sLC7fLYM/AKElOcy3x7cy3Z+veFgpcDje4B/tJ27Auf+pXiU
         bj50EF+1+6wNSK775jq4C5N9Z9fmZH5R7JyDDwAbDd+VFZ66UoFBvtH7AxK2jHhKyq8o
         K3cpJdXdGi/DYYE03iq8T/9NiXeI1sbd6WOJIhpLeNlv4+jZJwpSE9y9/9FQy5SlJap/
         NwvY1kXF+2atsbV6/JTNUvXvRtDnHBu88Wk8xi/Hi1O0+dOp5ogdq1Lso1xgV9FnSn8U
         pC/A==
X-Forwarded-Encrypted: i=1; AJvYcCUhWZwtNqVfZYw4hNf7BaxdYa1FKOr9ZWjHbCfIfCS3qdUg/oE4R5Mp3TzGy5n2HoK1nMCvbqH7eiYi9L5YOuVHBNb7N4ZL7HBm6eabzvVDpQ==
X-Gm-Message-State: AOJu0YwkRHdxhMC1DvQdo8CA0dLfyORDmW6Q9BxmXifaGZxy8X4gR92K
	v0AQR39kqUOY9LaCRzpUF+FFdzBJ7IyRvSftd9eZqckFxRd6m+5Z0wPV8Qhfvjg=
X-Google-Smtp-Source: AGHT+IE2dwtITxXsxaB0G/uLpOwwGbnutfeGyBbuSp4/5enbVEAxS7FoDRT1e/cft7qh39/yhDc8SQ==
X-Received: by 2002:a17:903:543:b0:1dd:e114:121c with SMTP id jo3-20020a170903054300b001dde114121cmr10066859plb.56.1711987314265;
        Mon, 01 Apr 2024 09:01:54 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8aef:41d9:be1:3de4])
        by smtp.gmail.com with ESMTPSA id lc13-20020a170902fa8d00b001e0c949124fsm9133368plb.309.2024.04.01.09.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 09:01:53 -0700 (PDT)
Date: Mon, 1 Apr 2024 10:01:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] remoteproc: k3-dsp: Fix usage of omap_mbox_message
 and mbox_msg_t
Message-ID: <Zgrab/l1Fp5HPKDb@p14s>
References: <20240325165808.31885-1-afd@ti.com>
 <ZgWMi088/zORh0m3@p14s>
 <0697211f-4a28-4a74-8540-840c075d513c@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0697211f-4a28-4a74-8540-840c075d513c@ti.com>

On Thu, Mar 28, 2024 at 11:26:24AM -0500, Andrew Davis wrote:
> On 3/28/24 10:28 AM, Mathieu Poirier wrote:
> > Hi Andrew,
> > 
> > On Mon, Mar 25, 2024 at 11:58:06AM -0500, Andrew Davis wrote:
> > > The type of message sent using omap-mailbox is always u32. The definition
> > > of mbox_msg_t is uintptr_t which is wrong as that type changes based on
> > > the architecture (32bit vs 64bit). Use u32 unconditionally and remove
> > > the now unneeded omap-mailbox.h include.
> > > 
> > > Signed-off-by: Andrew Davis <afd@ti.com>
> > > ---
> > >   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 7 +++----
> > >   1 file changed, 3 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > > index 3555b535b1683..33b30cfb86c9d 100644
> > > --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > > +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > > @@ -11,7 +11,6 @@
> > >   #include <linux/module.h>
> > >   #include <linux/of.h>
> > >   #include <linux/of_reserved_mem.h>
> > > -#include <linux/omap-mailbox.h>
> > >   #include <linux/platform_device.h>
> > >   #include <linux/remoteproc.h>
> > >   #include <linux/reset.h>
> > > @@ -113,7 +112,7 @@ static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
> > >   						  client);
> > >   	struct device *dev = kproc->rproc->dev.parent;
> > >   	const char *name = kproc->rproc->name;
> > > -	u32 msg = omap_mbox_message(data);
> > > +	u32 msg = (u32)(uintptr_t)(data);
> > 
> > Looking at omap-mailbox.h and unless I'm missing something, the end result is
> > the same.
> > 
> > 
> > >   	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
> > > @@ -152,11 +151,11 @@ static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
> > >   {
> > >   	struct k3_dsp_rproc *kproc = rproc->priv;
> > >   	struct device *dev = rproc->dev.parent;
> > > -	mbox_msg_t msg = (mbox_msg_t)vqid;
> > > +	u32 msg = vqid;
> > >   	int ret;
> > > 
> > 
> > Here @vqid becomes a 'u32' rather than a 'uintptr'...
> > 
> 
> u32 is the correct type for messages sent with OMAP mailbox. It
> only sends 32bit messages, uintptr is 64bit when compiled on
> 64bit hardware (like our ARM64 cores on K3). mbox_msg_t should
> have been defined as u32, this was a mistake we missed as we only
> ever used to compile it for 32bit cores (where uintptr is 32bit).
> 
> > >   	/* send the index of the triggered virtqueue in the mailbox payload */
> > > -	ret = mbox_send_message(kproc->mbox, (void *)msg);
> > > +	ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)msg);
> > 
> > ... but here it is casted as a 'uintptr_t', which yields the same result.
> > 
> 
> The function mbox_send_message() takes a void*, so we need to cast our 32bit
> message to that first, it is cast back to u32 inside the OMAP mailbox driver.
> Doing that in one step (u32 -> void*) causes a warning when void* is 64bit
> (cast from int to pointer of different size).
> 
> > 
> > I am puzzled - other than getting rid of a header file I don't see what else
> > this patch does.
> > 
> 
> Getting rid of the header is the main point of this patch (I have a later
> series that needs that header gone). But the difference this patch makes is that
> before we passed a pointer to a 64bit int to OMAP mailbox which takes a pointer
> to a 32bit int. Sure, the result is the same in little-endian systems, but that
> isn't a strictly correct in general.

From your explanation above this patchset is about two things:

1) Getting rid of a compilation warning when void* is 64bit wide
2) Getting rid of omap-mailbox.h

This is what the changelog should describe.  And next time, please add a cover
letter to your work.

Thanks,
Mathieu

> > >   	if (ret < 0)
> > >   		dev_err(dev, "failed to send mailbox message (%pe)\n",
> > >   			ERR_PTR(ret));
> > > -- 
> > > 2.39.2
> > > 
