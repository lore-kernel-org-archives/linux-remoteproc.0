Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64D41581F2
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Sep 2024 15:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726500170; cv=none; b=UXwdts+ZGIP9OMxrZMdHzwqZomhpSNGeN7JXsG4Qn/BeH68ispDz3sk5N2kr9ptojcK8zCrN4/fxFXP4Fdo+/Na+6U+aTFApMqXfzLXVFWBWwL89Rp8JCTLSNqQ/vnBmQWF1N4ZwbuobOD7jo5ggfg7QWzbhsefJsKAW5VfCdmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726500170; c=relaxed/simple;
	bh=tVZWxRmIaPjkwxZjrjPsv3Y2yTvtta+wB5FvXUdecJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZyXfTMs3tTSin4yZFZUEFu/HS5bWCBsZZji7Ing0cLACRCxC2l6yGz+8rNi6iiJh0KIk2K+NZawrjLmvb461bmjmlY6gDwcq/w0ujbq4P6QtZSLAiFstDNR0Mi3SWpOfKEA//6r6vsNQDo0NYhgdATYSxjUHszN9lcpVLENpBs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kw0jkG2m; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kw0jkG2m"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5356bb55224so4980676e87.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Sep 2024 08:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726500167; x=1727104967; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KJH8q3zUGDvemsqnvmD1EkQ7apsHHqB99DRBXUhb52Y=;
        b=Kw0jkG2mhFg1nP8h0TfqCNghWj5Ty3x0cNlGKgEJNtgS/sXSlfZx33fwELrr8a43Pe
         34MK/qoVX4XobX1PazeBaM20qi6gBMFtXsEVqdzwtEusLX5RW7bvpsqdiHTTVTtddRAY
         N6VkUqQSvNgGQAaaTZ/Lpf/2E2Q9afqJMgW1tlmvarPrldLfceMgRpjiQyNUjcOrVPep
         wagLbLW6onm4YZRYRftTAVWHgm55duZheNdAV6HCKI3hKYs0EJ9N9GDpiGA9ytI3CD2+
         ifF7Lg3ncG5Ru32OglV4+Bl4fQXym5KCStSW3Mf4UAX3G3YrOVarJN6f14Crdj1PRY9L
         i7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726500167; x=1727104967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJH8q3zUGDvemsqnvmD1EkQ7apsHHqB99DRBXUhb52Y=;
        b=TDtvJvH9SrkDYG7eCw/TJnES9+WnhyTjzlfrcAopZAqwlv82MqikhNc/h2SrmUVlN+
         jNly8av9eZMBmkSbW6KuR/XPfUsRtcPYRVbE0og0PyCU3RsQsHxe5hGyRPv/Qx+VAewq
         3DOzy6agR5W3ravO8qd4uBDq8Yev2+u+m/Ll0mvb3IFC5PF5cj8aROjKYKZRpjd9hFDm
         s5aX8oFTCr+P0KLtcr9O3YBB0QXD8tHwpGQn7hs5BkeiWgJqQYP5IvRcmYFVCFMUW/Dk
         cb0JukEkdYAii/R212xotydODsNkja8GOcRbleq/lGV1oAF8rhOXPV8zJEk7YIi/k+Sd
         Ep+g==
X-Forwarded-Encrypted: i=1; AJvYcCWK6S4+KTphXCaFDNUcyXUTABn8x9L0+GpB7VKmze444DzSZr+bURv8Xu35z1eI0Fk0hAom9cxscsNSf62qz0Bs@vger.kernel.org
X-Gm-Message-State: AOJu0YxPbjbfBipQUKXSxiOU7r+O9fHCExpsqrVwjFJidpbZ1jI1dwFi
	pDuVGQnBHHAsaZ3x2bXfrlkfOFzAB3NqxTuf+LkuHdmMJOjXMXv9sO2Vl1K0/U19p1EyEZPf/Im
	kOC3m7kIgICtNnSKCy/fgs834+wqhgwQ2PDrBYQ==
X-Google-Smtp-Source: AGHT+IGcEKlFV3pwbfg7CV1kZ+gQRTNQk5/kvcUGWZdfkvvt5fw/iXNqIsTSUF3APv0qV9KKgaOmCjXJOGrBE10LspA=
X-Received: by 2002:a05:6512:224f:b0:52f:c13f:23d2 with SMTP id
 2adb3069b0e04-53678fbf051mr8212934e87.25.1726500166823; Mon, 16 Sep 2024
 08:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812072811.9737-1-baolu.lu@linux.intel.com>
 <ZsdktJEqR9BOgivK@p14s> <20240822162425.GE3468552@ziepe.ca> <20240915140929.GA1834200@nvidia.com>
In-Reply-To: <20240915140929.GA1834200@nvidia.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 16 Sep 2024 09:22:35 -0600
Message-ID: <CANLsYkwQ3LbvyUSnJjSTYRPSwaWxwKn3sRFS1iy0=d2F-TyoFg@mail.gmail.com>
Subject: Re: [PATCH 1/1] remoteproc: Use iommu_paging_domain_alloc()
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, andersson@kernel.org, afd@ti.com, nm@ti.com, 
	hnagalla@ti.com, b-padhi@ti.com, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, linux-remoteproc@vger.kernel.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Sept 2024 at 08:09, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Thu, Aug 22, 2024 at 01:24:25PM -0300, Jason Gunthorpe wrote:
> > On Thu, Aug 22, 2024 at 10:17:56AM -0600, Mathieu Poirier wrote:
> >
> > > > - domain = iommu_domain_alloc(dev->bus);
> > > > - if (!domain) {
> > > > + domain = iommu_paging_domain_alloc(dev);
> > >
> > > I'm a little hesitant here.  Function iommu_domain_alloc() passes NULL two the
> > > second argument of __iommu_domain_alloc() while iommu_paging_domain_alloc()
> > > provides a 'dev'.  I don't have any HW to test on and I am not familiar enough
> > > with the IOMMU subsystem to confidently more forward.
> >
> > So long as dev is the device that will be initiating DMA this is a
> > correct change from the iommu subsystem perspective.
>
> This is the only call site left for iommu_domain_alloc() - we want to
> remove this API on the next cycle. Please take the patch
>

And I have no intentions of delaying things further.  I will discuss
this with Bjorn later this week in Vienna.

> Thanks,
> Jason
