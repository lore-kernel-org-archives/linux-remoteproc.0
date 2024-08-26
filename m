Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAD9199242
	for <linux-remoteproc@vger.kernel.org>; Mon, 26 Aug 2024 23:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724715934; cv=none; b=AQzAU+zgXT161qEBlspay25KvWtuiy3fx1von1csO3ye9eJ1FPgEN1yV13iBaxhHfrtLcn/XQNFbYgkx5vDANEhYIBFZUjpvnWxCIl0ESj55fEah7qwQ1eNqDPcuVkOshZYOnZgzu3ktvSCIAHuDDfEX1qcrUuMOZbK8csXlKmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724715934; c=relaxed/simple;
	bh=vqZxLyIYwvOL7VofEWqLnPBg2kNsVlrEwKKqyU22uHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBwh3+w0nlxvbOdfH6jq3b7r5+qr+K2UwhMSco/ZujS8h2tS7DP2D9O7zThH+a3ImuRltMBJVfRKOxkowJyoaAh9Efwd7k141opmoOlLbhnTr67snjapyOB5K1hLuIaKNI8kKvjHMkHkB4qEj4NAGkktNH2zttiuRDbfTMBV3io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=HTM0zG1T; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HTM0zG1T"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6bf6e17cc2bso23736016d6.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Aug 2024 16:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1724715931; x=1725320731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lDuuNQ8/bu29BjzK9PteMZCVxgPOE2AxKbk9lTfYggQ=;
        b=HTM0zG1TAEakjLOil8Py3eNjoG5c6JNo9FFi5bHkUFS0Z0hApXFCTCuFEM5uv/MOZS
         BIaUfZZXw8AWpq+//8KMCnI1MDj7efhqimRoVjlO13+jaPZP+RonWK+jjvfsBHHqhWA5
         0XjztpiB6bZsNPqTB9WmB63Qt1YL51+LR0PD4rg81N9bLoDX+ZhJ92tMs16HxPbUjLmC
         csIUwLy3ApjmUQ0njAetuC24LGe95I8de8UagiBnRzohoB7uTmF7bVc4Ect+JoArz5gF
         U658thZh/AIXem3YOLb0PmPrTH2YfYrAYKx2LtuQ/dnoMhB9t6r/xE7pOHnICXIoTyEi
         sz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724715931; x=1725320731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDuuNQ8/bu29BjzK9PteMZCVxgPOE2AxKbk9lTfYggQ=;
        b=nAfPr0i4LNX2v7c1aIc4fGGlAeGYLnJ6EZJFRBddwedR54ylOBAJOXp6zsRLVAnB3W
         yE86MHDqJfyA5u5dWVrrzjaIJu5DI8XSZxD14CdgvxV65xTU8zBOKeC1rzVfqbcdZniK
         vy47Ucv0IMtbWH5FhQBtyDImLMjiwYDqaIpR/TDuilNg1pBin1QDsV0FzeA8WCLXxPpv
         BXYzbFOwHuzm5x94CqG6gp7AQmBAUharsB0MgRU15mdjuWmAfsR7J6KavnyAqzIFP7PB
         G0lO6/dpZkZ9IBObSMWnrtFQhLIB9cxePWHC1dFJjkRdTC6ESiVBltxmeYdoOTrzwqGk
         7lXA==
X-Forwarded-Encrypted: i=1; AJvYcCVbWcpiwFfw6Lo/9/oA6EViHZp/IqKmDoFJ8uf5WX82wDoOz7PY6eA+jSDZ+JUqpc+VHO13Vzz5Koot65QXUFlA@vger.kernel.org
X-Gm-Message-State: AOJu0YygIZQiBPHFzy9EbaTkPXSmr6J2dL2UI+a9TVuqYGhaITS5Xwjb
	393b8MqE4EqMuKF6cIi79UjTd7Eutm3DuLRH45nwxWH+WsdEbS3CwEjAz/dvTQE=
X-Google-Smtp-Source: AGHT+IHzaXl2WmXOTOiigwMW4vAHbvohhbDK0cgaRu+I2GIwQhZXzz+hJUacz877ZzUojnA/oSOOuQ==
X-Received: by 2002:a05:6214:4381:b0:6c1:6a2e:afc6 with SMTP id 6a1803df08f44-6c16dc36d53mr143333916d6.15.1724715931544;
        Mon, 26 Aug 2024 16:45:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162dcd5bfsm50953946d6.110.2024.08.26.16.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 16:45:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sijOs-00El7B-CY;
	Mon, 26 Aug 2024 20:45:30 -0300
Date: Mon, 26 Aug 2024 20:45:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: Doug Miller <doug.miller@cornelisnetworks.com>,
	linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	OFED mailing list <linux-rdma@vger.kernel.org>
Subject: Re: Using RPMSG to communicate between host and guest drivers
Message-ID: <20240826234530.GK3468552@ziepe.ca>
References: <133c1301-dd19-4cce-82dc-3e8ee145c594@cornelisnetworks.com>
 <842aef7f-d6e1-490a-97b9-163287ddfe2d@cornelisnetworks.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <842aef7f-d6e1-490a-97b9-163287ddfe2d@cornelisnetworks.com>

On Mon, Aug 26, 2024 at 12:27:02PM -0400, Dennis Dalessandro wrote:
> On 7/31/24 4:02 PM, Doug Miller wrote:
> > I am working on SR-IOV support for a new adapter which has shared 
> > resources between the PF and VFs and requires an out-of-band (outside 
> > the adapter) communication mechanism to manage those resources. I have 
> > been looking at RPMSG as a mechanism to communicate between the driver 
> > on a guest (VM) and the driver on the host OS (which "owns" the 
> > resources). It appears to me that virtio is intended for communication 
> > between guests and host, and RPMSG over virtio is what I want to use.
> > 
> > Can anyone confirm that RPMSG is capable of doing what we need? If so, 
> > I'll need some help figuring out how to use that from kernel device 
> > drivers (I've not been able to find any examples of doing the 
> > service/device side). If not, is there some other facility that is 
> > better suited?
> 
> Hi Bjorn and Mathieu, any advice here for Doug? Adding linux-rdma folks as that
> is where this will eventually target.

Typically in cases like this you'd paravirtualize some of the VF
before sticking it in the VM so that there is a tidy channel between
the VF driver and the VMM to do whatever this coordination is. There
are many examples, but it is hard to see if you don't know the device
architectures in detail.

If you stick it in seperate virtio PCI device you'll have hard
problems co-ordinating the two drivers.

Jason
