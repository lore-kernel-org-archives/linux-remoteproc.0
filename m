Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EBC1CCEC1
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Aug 2024 16:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724343869; cv=none; b=HZOrdifChWzfFYOreI13HfFcQPyT04UPFgYsXR0322IKoyiFvWHPiUqEXWKoZBxDJNxrC6TC/W/52nK9aAvqgUmRS4l5BIYYu5t2931wfNgKU7GTJ0fbW5VtjDOeKa44/XM8aCMmtE9yb5AwVcEnNu//fwsLq3NBZYGGLZ3glGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724343869; c=relaxed/simple;
	bh=ATxYdoET9i0tpoYEYnSCwulRxYkpITICJ0RdslxkZwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rrg+YTm78BmEHsFBFDkLWhMfngBlj3i9kmQdJlF+ARTwoRZoiWxCVzyRzBp7809apvl+87Xn8pcrJMUzzkqrYFqWLD/Q1D3/QPMF07P6CNZKTQ5lB1lK5QQn0OKfYaw63+EwhD+rZNexrfMrPuseOhape2WsZnmCigm05pb9qDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Q88/pBy+; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Q88/pBy+"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6bf6ea1d34aso4913636d6.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Aug 2024 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1724343866; x=1724948666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1+OUWg8fYZllfQV1XDu+F1uxRA+l5JfuQjDnhYEx0Lg=;
        b=Q88/pBy+oFjyuthA2yF5Ml7S6DtbYJ8ThkR4JsjHq1MW/KFLyyaZGG2YfF2fEi/qWd
         kACAHxoEtIHJLT7g5aMoR2kDUIW5ApM+A4f0fOewLhEOHWq/YWj9UjZ/fdzxx3pLWx8Q
         JLuVH0g1CUkkPfIJpXbIBRyUsSTKuCPTZHuU+1hH5vD2AfxIWU/8JuEMl/3tjQ2fP1f+
         1ghFnYu3w477DgwPqB+BhiXAGZmesaqc3/uoVyXPCIIZG1m1cGsrAQKuGX+bitXYXBjY
         W67yavv/2QnPaEfzCOZqz2nvRaJkTgdgZgH7zHdeiY49PJT/v2kmm4gCx7VHGjSXWLXJ
         YGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724343866; x=1724948666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+OUWg8fYZllfQV1XDu+F1uxRA+l5JfuQjDnhYEx0Lg=;
        b=UIIuq1yatAc59ggp1rjdsXM0snwBhYrb8T3SSHTGOdAFM9URizRtutNuYHoVvMm/XR
         3Bb3NGmBxUlR9FFuA3YFcWyZc8qkNBTohjdlvfOoD125Cv43zAt2sQ5Y4h8B1iixRV+7
         ljOkdiAp8REh4+YKFDpimC9EwM0VGlfaTUaW8cdOOovMecwf+dAUdNi5uByC6/rw+b0i
         KxvxXCFGdJTebXOCMbbujDYAme+gW7Ox+U0sbkk5kRvNH2xfUycYBw6lUPv5xZxaHg1/
         BLjXsf/JUlb6rNLjgV8i1YHIcknZN0Bpf0LyRW3s8DeXBYU79IGUjOw3mERuOz0h4Gtj
         wRGA==
X-Forwarded-Encrypted: i=1; AJvYcCUkVf4B90gC6UpwpNOAAFMfNTvKiZyjTKhGd4noNiNe/TObmvFAUGTccfOBYicS+B6MLgG5ijdWSTLsuQNVcBhJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwEGw+HEBO6jJwFeWG5euxbjUmx14hLNZu46J4uhEU7YAG1MFW3
	rdgIzp07W/ID8M8GAJ6V7oYvDBah5dIbbEE6dbg5w3dUEipN+4aY3QL0HDj279k=
X-Google-Smtp-Source: AGHT+IHQUMAushC/6F0n743es9SOL7bUKFJqvbyWITaa2Kk/SJ8KSGOK7+3gzFI4+gQRrz7/1kMK7A==
X-Received: by 2002:a05:6214:2f05:b0:6bb:a16d:279f with SMTP id 6a1803df08f44-6c156843ef9mr73410596d6.38.1724343866522;
        Thu, 22 Aug 2024 09:24:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162d7711asm9043146d6.73.2024.08.22.09.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 09:24:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1shAbp-001IVy-9Y;
	Thu, 22 Aug 2024 13:24:25 -0300
Date: Thu, 22 Aug 2024 13:24:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, andersson@kernel.org, afd@ti.com,
	nm@ti.com, hnagalla@ti.com, b-padhi@ti.com,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>, linux-remoteproc@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] remoteproc: Use iommu_paging_domain_alloc()
Message-ID: <20240822162425.GE3468552@ziepe.ca>
References: <20240812072811.9737-1-baolu.lu@linux.intel.com>
 <ZsdktJEqR9BOgivK@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsdktJEqR9BOgivK@p14s>

On Thu, Aug 22, 2024 at 10:17:56AM -0600, Mathieu Poirier wrote:

> > -	domain = iommu_domain_alloc(dev->bus);
> > -	if (!domain) {
> > +	domain = iommu_paging_domain_alloc(dev);
> 
> I'm a little hesitant here.  Function iommu_domain_alloc() passes NULL two the
> second argument of __iommu_domain_alloc() while iommu_paging_domain_alloc()
> provides a 'dev'.  I don't have any HW to test on and I am not familiar enough
> with the IOMMU subsystem to confidently more forward.

So long as dev is the device that will be initiating DMA this is a
correct change from the iommu subsystem perspective.

Jason
