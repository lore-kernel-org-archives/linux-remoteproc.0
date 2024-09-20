Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1963813D897
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Sep 2024 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726836338; cv=none; b=aJtd8pEw+SXtfslH1bf8kwuMLFoMEfXwmfj6uXCvnBd92StBgRGlt5uV3u4Nx6e/5qqyzXGDTi/nazZiwq3KUQUsoEHzVlWOaE2DU4sUTXI1IFF+NRoTHIJpDTF79BsTUdoV1z1jY3hERa9A16pV20d606/+VyOtCL6teh8nXQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726836338; c=relaxed/simple;
	bh=6MDUFAzEP285GCjmDxeM7QwhxpeCWlw3jw0rPZ3Umy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYnT4HPlDQp1barZe7gQQ+ZVq/F/rCQ/7hfBxp79ZiUtKEOSMl5Xt1ywYMxcdEzA5drMJwCZ2DtEZPAVbbF39i46T0u1o1kd4xs4zIwrTX8KLlrTSDQGPrFBcTlwoM/X3GMHQQtq6PkdRC3kjWlXeZKW3uNNNTqjQ70VgClTGB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WGJzajxu; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WGJzajxu"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c465578555so901811a12.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Sep 2024 05:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1726836334; x=1727441134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HfUzaSYfe7JzaUrsdtf4EvyOxWKOBY5So2dMJqZysKw=;
        b=WGJzajxutePOqx0tXftmz92CqyCZyJ/zo1k+cHYBgszh4orc5ldnUYKod1+aZgFWVP
         +BhpX0M6xOQIGL7H+xrEp5b8JSBg21eWnlzzmnVxz9S2aP2+ws0+heckxC9CLMA9nLZd
         Aj4/G/oXfkVirrLLYr80Zf2tnGtL+fdQk320hj/Lz11hCKixWnGtZgDgCIs4lnBKUdw1
         LlZZrxvGScnYHBVyJFyrUeEa59rN8hyYSPtSSb2X89Ux8QWUn1WbF1RnG8KQoUrzYLYc
         KMK//CDRPKheGqpTJEIqQGY6DE0Rb4hVa1Ototr/eyVDsMGF9dNCs2b4Xjam+LLzG2yJ
         4kbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726836334; x=1727441134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfUzaSYfe7JzaUrsdtf4EvyOxWKOBY5So2dMJqZysKw=;
        b=sdQ99OUEkvKT2Uhwk/C1LHsbV5yunVHDjVLISSGmRzM4rgTnAqRK9MpesmkifWiYXl
         sCei+76YeRDUEJDiYtY+gok24tyJrg05bmUi6MjmOifQ3PrAZXtK/dbrOposLs5douWo
         SVJySMkx0Egk+XNu8sSj+RcOH6LdFcRV+0oODiRbZtdbe3id8CwpDN+wGZrcZn4K5lDU
         Pfj2TV7xHJlrhfg6FRu1Q3YjGCee68oBVGlswn15zuUKCSIsFsbJZFpCATY1jRkkuHPr
         kRjlSpi0uUH01Lx4hNOjGAeGuNcCnVGsj1bj6AKJyh6VDZ5YKnxMDfwr4kmeD7CJhjST
         gmHw==
X-Forwarded-Encrypted: i=1; AJvYcCVsqGoti60D9uws14fq6wsQhLzDxWI5SmHHnQgCcBX5wddzCpXhq4Tyibiq85/P8XtMe9mleJVUuNbU68k6lJ+p@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp6D2YObvt08JRd6uQ1UoNoVbEDR891oSFE08WsBM4TEtYWGjF
	huL6S1oC1JBlW4uefLyllmP9MIEKVl2cIZwn4je5mKHz4a2v7fUyIbQ7m1j60W7X7DKcIHGJBO+
	j
X-Google-Smtp-Source: AGHT+IHnxE0Z6K4I84qufCSrMPPeisIti4l1d+G0k2zgC2NYBBHsXD8nRxoNhdodGriQA9BfXK7vYA==
X-Received: by 2002:a05:6402:4588:b0:5c0:c223:48a1 with SMTP id 4fb4d7f45d1cf-5c464dbc322mr1735246a12.21.1726836334065;
        Fri, 20 Sep 2024 05:45:34 -0700 (PDT)
Received: from ziepe.ca ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb8a099sm7171675a12.59.2024.09.20.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 05:45:33 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1srd0u-000178-CL;
	Fri, 20 Sep 2024 09:45:32 -0300
Date: Fri, 20 Sep 2024 09:45:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Doug Miller <doug.miller@cornelisnetworks.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	OFED mailing list <linux-rdma@vger.kernel.org>,
	"Dalessandro, Dennis" <dennis.dalessandro@cornelisnetworks.com>
Subject: Re: How to create/use RPMSG-over-VIRTIO devices in Linux
Message-ID: <Zu1ubAO8e8vNpC3A@ziepe.ca>
References: <70cf5f00-c4bf-483a-829e-c34362ba8a70@cornelisnetworks.com>
 <ZuBiLgxv6Axis3F/@p14s>
 <aff4e2e3-0cb9-4ca3-84f7-2ae1b62715e4@cornelisnetworks.com>
 <CANLsYkyuB=BsswRmbSbjDNMqz0iGHrviLMGfNJLx-HJ60JeEMA@mail.gmail.com>
 <591e01eb-a05b-43e6-a00a-8f6007e77930@cornelisnetworks.com>
 <ZuMEW9T2qSTIkqrp@p14s>
 <d8a4001c-d8c7-457a-a926-1d03e4f772fe@cornelisnetworks.com>
 <CANLsYkw-5i_4=UXwtG_SfR7rkjKEz3ieSOP2s4SOCozkWMct7w@mail.gmail.com>
 <20240915165800.GF869260@ziepe.ca>
 <0dda0411-22a3-4805-807b-0471f10c6468@cornelisnetworks.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dda0411-22a3-4805-807b-0471f10c6468@cornelisnetworks.com>

On Mon, Sep 16, 2024 at 08:38:42AM -0500, Doug Miller wrote:
> On 9/15/2024 11:58 AM, Jason Gunthorpe wrote:
> > On Fri, Sep 13, 2024 at 08:39:26AM -0600, Mathieu Poirier wrote:
> > > KVM has nothing to do with this.  The life of a virtio device starts
> > > in the VMM (Virtual Machine Manager) where a backend device is created
> > > and a virtio MMIO entry for that device is added to the device tree
> > > that is fed to the VM kernel.  When the VM kernel boots the virtio
> > > MMIO entry in the DT is parsed as part of the normal device discovery
> > > process and a virtio-device is instantiated, added to the virtio-bus
> > > and a driver is probed.
> > > 
> > > I suggest you start looking at that process using the kvmtool and a
> > > simple virtio device such as virtio-rng.
> > I would repeat again, I think trying to create a companion virtio
> > device to go along with a real vPCI device and then logically
> > associating both of them with a single driver is going to cause so
> > much pain you should not do it.
> > 
> > Find a way to send your RPCs through your own vPCI device.
> 
> When you say "your own vPCI device", are you referring to the virtual
> functions that are created by the adapter? Those are defined by the
> hardware specification and we don't have the ability to extend them.

Yes you do the VMM can extend them. You need some qemu code or a
vfio-cornelis or something like that.

> What we're investigating is using RPMSG-over-VIRTIO, not using virtio
> devices directly. 

I understand, and that will be very painful.

Jason
