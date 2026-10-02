Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BB34F5E0E
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Oct 2026 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959316; cv=pass; b=dkXp+cTU8HcfHlbHIZAtJdBA6FYp7nft+H5orfht0AhL6NAaDQZ5dzsEgBDMndq0jZBPR8O7KVn6lboXcOLj82+eNXT6Zp6AIEgIXk6ui5t3akQDo9AACcQZQltEeFRCZDhBi18ILBRBTBxiazQmv2AUKQMgEuiSbunFhpfseBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959316; c=relaxed/simple;
	bh=udiZlGGO/Yxsje1pchRhMyyAAkURtmf1L9RoQQQHsI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqNi3KLUxhaQdq8ZgLelVtmVVnGLVf031Ya36Xvx2QqoI443Isc7yGrn1PcqV1mki82XQFptQFl1GpRyMqQZwey44GS2guUArzqMAnnIT9ytW73ZsWtgf+IouiWdxFMrxE0ojqjfHsUnA1z6HAGuAfU6mdLbUk/hnXU/lzN+PQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L+Jrkak6; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L+Jrkak6"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2a25dfbf5fso2817966b.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 Oct 2026 09:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790959312; cv=none;
        d=google.com; s=arc-20260327;
        b=Rknzmo4taTRPL066dRJzTI7Istq+7W6HLKuQoEzUmS4GEUYcUFy0rkmDSQYOcGRzno
         OfNvfWT+auu9T/Jcs3qGZiVpBdan3wKqDeUiG36BQDv+/vVbNBK1IZyzvc+umeey7iBj
         AJkaFHzb5QhiJRo9dysEDBBkNvCCgnT+mgJYKful7S+oLZdBBeBbt76yVlVHTlXdehAq
         2VsTk526WbkJM2jBNP2WfmusfQxl88SwlGr/a1oRgRfqsvKeYPPOy1bEqTs9SzQEW7Pe
         Dcq25cSR6Bzu2sWsBM+Zrdld73wb/NBu5dG8mt5/QKmMTes92fHAT1Lfe7GtIBQ48Sxj
         NT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TZry/ty8gGLJnRfkXTBnb3Gu/VlfPJYp3jjRNHdhoCM=;
        fh=WbrDhxxLpT9jDVa3apxSe6pjYuUNI4PvEM2K0ywDeg4=;
        b=hMJutB9TNf2a0toXYrVPN5EcVEauQWR//pTjwGZuPA6SBzshXYDXzcvIpOZzBlaQme
         Tiwact92c4GtxW2cQ5E9goF5tEffVlmlURZ5fQ20UgX0IPhr6gWOcEjRkLUUybdZopO/
         e7kKgdu9RND7HQbKbrvoYw03J7ZV/BUhG+t9BcD3Or3wpw39GFU8vPnQQu9zS3pt2USu
         HLtcyDRYDrftcZS/gBYvnEgsOBuBOn/H5xOUvg8hYCPuDK5HrTzIYVHyw1OZEEo5L54C
         1nYyJwgxRTS5vcT6D6eMBl1dBCMsdQQYmlMEJ+qDV6sD17KbEUHl3tetCR/9D4uPA1RY
         pOiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790959312; x=1791564112; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZry/ty8gGLJnRfkXTBnb3Gu/VlfPJYp3jjRNHdhoCM=;
        b=L+Jrkak6HbVnONzU7aSaqmIov4JdOVLporpzSJSX39np/DMnX31DFV9OU1lvNUDaSZ
         qpERsywFM8pLgWg/sWePiLSNRcbrZeZhXvU2GeU5sFrqWy4fH5kPkTZkcziLmxPyVhMt
         H241s7Na/PcAOimT8RqG8eRDON+xpHPAa9leM02+Dftpt9FcnQL89X3zVw096m57+QeZ
         hz/Uqt0zjWeAqjLN8Z858Mwfvw99n2BffzFu+EuE+gbF8lCgKwVUsR8uEJZc3IKWQvbC
         c6lTqoRAufoT0mGk3itqI6Uh2ZGaxkSrpTOCaEL4e831JnrUUCQ4khjBrxCPU7EBNQ6w
         2ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790959312; x=1791564112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TZry/ty8gGLJnRfkXTBnb3Gu/VlfPJYp3jjRNHdhoCM=;
        b=ix60Z0mM9AR1Xku/qkDNjvmGG1/XuSS5F8HGREEbmfHD2MdtmJLC25HAHlBB4F6f65
         CZ8EaavOG5+yxwVwoc0NFLT91CUnmmssKafqWv4XLMYYiWHi/B5Bn+Hc12BG69fQPhOD
         RBCGyHQlAvt5mZvCe7QhbMZq7Kq/BufqSbQOolfw7s4v7hoHk9IlMp8mSsAh1bm3BCvo
         l53Ds2qfqdPB/PsPsUyzLYNdmleCw9oDSUqv+bocaDKrMDR4z7s+FbfSe+8JG4FL2BC5
         81iuGgWm72sRVW2YvkeToS091iVy3alm/4INq1ebv/A3F0g+nG4l3ZF9j5jsGWJwSpLo
         fZAA==
X-Forwarded-Encrypted: i=1; AKwUvBxlNmxQLfKER6nRdqlXiTRzMy5sFXHU4SdiSpsJfk97Ae0M19YH1lXwlHHzXUy5cysqxlnIAN6FnIw0SMDeaRDH@vger.kernel.org
X-Gm-Message-State: AFq9FYKC2gR2cv9yY/fD6fQ58Tq6LDn34cnK+z3LsHIsDusunb/QjSUJ
	9WN+Emq3yx/rFr6oIXnstdql2WMbH/JA+CpdpPE1IvSJ00mCxgQjnBbi6x+bHl9Fg5OGZ1lL5JS
	qAN77GkPki6AIYHapLk8KH6jTdfnzmzFKkrMOM1UIhA==
X-Gm-Gg: AYBFou1seMUxy9b4bft4yWLGlz8KWVfd8wAYbgXaHL0FGtOaHiNic7oKNoGJLwkhIYr
	p8KMCylnRPkNb2NpojrYuoQa0AOVp0xbaffC1zLZn8oM8WzESDBGwC160COhi9uqJbTs3kcJ5aj
	RomxOzL7fBB69g9unvRIoZVk5aLweXhrLuOaAedl+iGtSDuogSRY6YiF8Sgym+pIF+YTZgcrTHg
	daCXT01xDYkPLks1dfnqpWzBCxixmvEUqGtqp7FfcCpT7LR8ziZ7njoTojGDCJZr/e1chhvEvUq
	q3IonkfixSjPmp5fPElwzmaDTnu9dD6WAlMvoNsKyWgEGXQ6ZtighdWzwEfdC1B01SJqswdZB9i
	4ZhPOyut/d9/P8Q==
X-Received: by 2002:a05:6402:4387:b0:6aa:8d04:fa79 with SMTP id
 4fb4d7f45d1cf-6afad8d08d9mr65471a12.13.1790959312169; Fri, 02 Oct 2026
 09:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924205901.2505186-2-tanmay.shah@amd.com> <arjZvftSMlG3OMHP@bywater>
 <ar6PTLS194v3YJPU@p14s> <6e13a1ca-adc6-4c26-a9fe-63f4b046cabc@amd.com>
In-Reply-To: <6e13a1ca-adc6-4c26-a9fe-63f4b046cabc@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 2 Oct 2026 10:41:40 -0600
X-Gm-Features: AclHuK9Dwrn-HspmBs2afKv0XgYfCyTpWE3OkSG3FGr-tj2no8XqzThzQ7vhwjo
Message-ID: <CANLsYkwq6iqc9vCM6t0+Mbj9byzuzeW+uw89P6jCpZwk0xgSOQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: reset vdev before removing it
To: tanmay.shah@amd.com
Cc: Francesco Valla <francesco@valla.it>, andersson@kernel.org, ohad@wizery.com, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 11:18, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 10/1/2026 11:50 AM, Mathieu Poirier wrote:
> > On Sun, Sep 27, 2026 at 10:55:59AM +0200, Francesco Valla wrote:
> >> Hi Tanmay,
> >>
> >> On Thu, Sep 24, 2026 at 01:59:02PM -0700, Tanmay Shah wrote:
> >>> The virtio device is removed when the remoteproc device is removed. The
> >>> driver should issue reset on the virtio device so the remote can do
> >>> corresponding cleanup.
> >>>
> >>
> >> Shouldn't be the driver, and not the transport, the one that calls
> >> virtio_reset_device()?
> >
> > Function rproc_remove_virtio_dev() calls unregister_virtio_device(), which calls
> > device_unregister(), which should end up calling virtio_bus.remove(), in this
> > case virtio_dev_remove().  virtio_dev_remove() calls drv->remove().  If we take
> > the RPMSG driver, rpmsg_remove() calls virtio_reset_device(), so explicitly
> > resetting devices as part of rproc_remove_virtio_dev() is not needed.
> >
> > Tanmay, have you observed a scenario where the above isn't working?
> >
>
> Nope. I didn't send the patch based on any practical scenario. This is
> an old patch that I had used at the time to issue reset on shutdown. I
> missed that the driver is already doing it. Probably my assessment was
> incorrect at the time. I think we should remove this patch.
>

I backed it out.

> >>
> >>> Fixes: 7a186941626d ("remoteproc: remove the single rpmsg vdev limitation")
> >>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>> ---
> >>>  drivers/remoteproc/remoteproc_virtio.c | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> >>> index d5e9ff045a28..1cb0ee0ea656 100644
> >>> --- a/drivers/remoteproc/remoteproc_virtio.c
> >>> +++ b/drivers/remoteproc/remoteproc_virtio.c
> >>> @@ -469,6 +469,8 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
> >>>  {
> >>>     struct virtio_device *vdev = dev_to_virtio(dev);
> >>>
> >>> +   virtio_reset_device(vdev);
> >>> +
> >>>     unregister_virtio_device(vdev);
> >>>     return 0;
> >>>  }
> >>>
> >>> base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
> >>> --
> >>> 2.43.0
> >>>
>
