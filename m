Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDE343AD7
	for <linux-remoteproc@vger.kernel.org>; Sun, 15 Sep 2024 16:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726419484; cv=none; b=WUYxaEsUA2s2wFXam8Htl6n0Mew7f8x4akzuQJEhTXDhIXv1/B5ZL/jW/kp7iwvu0qxrne4u8yooCY0Af5xnc0jv8OAQgiBYQhYdgFy3Df9OPoSZUsA6KBZJqJCsCvRzV0xL6rsHWs7De+K0j0Oz4H3lEU6XZUJN4L7bLuOQ/ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726419484; c=relaxed/simple;
	bh=DEOE+c/5Yj2X4BT30OJN/4V7lagMOvtCGne9m+6n9cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyGCiTycezHQVYY4kH9jPWWU/tfn8EsT/CYF5cI3Yvg+DiRsOn7Uxf03RKjPIouvkxumoSzypcFdKUIIM5/czPhIcgkzY+4eAHSw4ybO74n4frJgyD054n0b4tSDz+mMu3Uhua0+XylPc8Y/nT7fNgdeU/tpKaLmYVxyCdhTtwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=k6LlRAfK; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="k6LlRAfK"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6c34dd6c21aso28900126d6.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 15 Sep 2024 09:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1726419481; x=1727024281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NTbruotwszHnvvfnfsdqsxUCVjUd7c73298ZnrrHjMM=;
        b=k6LlRAfKiB83oUumihcLz7OCt/53uH94ICn00MR+xsyaxRZIm4JX6xTpUDKqvIQaqS
         7899+mDsElaJlHiGlsjMfomNNRTpYqNMUMU5kDZgdwHMZHcPfQJJI0ZWVLw15jsf5eKx
         CUUoK5AjKBSb1EEwVd7z6T+jRANM6wHqrlMktBNmqm2A/+7LyG96ReQNaoNQdB7ppRJW
         7YEPFq+/0iQFqgN8DQDxsh1HCWEswptSCcMV113SNznp3SxvqNQvT+lwyaIxWXVQfOgc
         VfnXJyuahNu6Ur66aJtTanUU8Fo4bNFt6mVdj9iIwrrQR69BuEZeF+peu7+OkMm5hDKQ
         q8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726419481; x=1727024281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTbruotwszHnvvfnfsdqsxUCVjUd7c73298ZnrrHjMM=;
        b=ESKSHvlCutSlB7saRAnyhbiEhXFZCya4OqjNYR3tUK//F2h7hk4u6NlD08mthIjHfK
         YkcJwot2ZwwbKUklAqiO682KLtq0GIJ+u7rgI4AsarP8eV58UdWBqdP3tuhKUwk0CE7Z
         6g+JeKaLsoOj3W83csyJlhlK8z3sbmHV7/84dELtQk+hhqJ52Gyfh7cKzrJX2yIFEE41
         vpIAzuuilrDkLxOfDBFAYV1wSzyleTGZxbTm+lV+JbKp2d6f0kVvhWC92PMAWQrpGDby
         PtUIiegd/zT+p2bsSL3xwqMq8LEBhpC0kmD3p3NRmriAyv2r+h9wkkZZN8QeMFZede72
         Icaw==
X-Forwarded-Encrypted: i=1; AJvYcCVLgvB2cXlOT28/WoAoTNutKArJSymTzu6AqwzvY9v5q6zbv6mRWnXJO2N8BAlykM6ZIdFwgFaqIFLnlv/z4g8V@vger.kernel.org
X-Gm-Message-State: AOJu0YzxaPDw7TOagliXI5EAD36dvXzq1MOin8Gwg74JxOB7N9lxu3A9
	j3m5IAGTuhXFW9cBZwYLjg81VQKYoz3WB/N23kFTB9trFSygSVSDO+6tdxudu1Q=
X-Google-Smtp-Source: AGHT+IHC1Q3z6stYEf2BIXg4I/XnTsQu+xr5Rfapi9J4AEaw+0oQS/WICRIzAM+DeKOJcA2oTAIOVQ==
X-Received: by 2002:a05:6214:2f93:b0:6c5:9bc6:8962 with SMTP id 6a1803df08f44-6c59bc68c4bmr49158756d6.30.1726419481255;
        Sun, 15 Sep 2024 09:58:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c7af259sm16975176d6.122.2024.09.15.09.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 09:58:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1spsZU-008C4W-0O;
	Sun, 15 Sep 2024 13:58:00 -0300
Date: Sun, 15 Sep 2024 13:58:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Doug Miller <doug.miller@cornelisnetworks.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	OFED mailing list <linux-rdma@vger.kernel.org>,
	"Dalessandro, Dennis" <dennis.dalessandro@cornelisnetworks.com>
Subject: Re: How to create/use RPMSG-over-VIRTIO devices in Linux
Message-ID: <20240915165800.GF869260@ziepe.ca>
References: <cff37523-d400-4a40-8fd1-b041a9b550b5@cornelisnetworks.com>
 <70cf5f00-c4bf-483a-829e-c34362ba8a70@cornelisnetworks.com>
 <ZuBiLgxv6Axis3F/@p14s>
 <aff4e2e3-0cb9-4ca3-84f7-2ae1b62715e4@cornelisnetworks.com>
 <CANLsYkyuB=BsswRmbSbjDNMqz0iGHrviLMGfNJLx-HJ60JeEMA@mail.gmail.com>
 <591e01eb-a05b-43e6-a00a-8f6007e77930@cornelisnetworks.com>
 <ZuMEW9T2qSTIkqrp@p14s>
 <d8a4001c-d8c7-457a-a926-1d03e4f772fe@cornelisnetworks.com>
 <CANLsYkw-5i_4=UXwtG_SfR7rkjKEz3ieSOP2s4SOCozkWMct7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkw-5i_4=UXwtG_SfR7rkjKEz3ieSOP2s4SOCozkWMct7w@mail.gmail.com>

On Fri, Sep 13, 2024 at 08:39:26AM -0600, Mathieu Poirier wrote:
> KVM has nothing to do with this.  The life of a virtio device starts
> in the VMM (Virtual Machine Manager) where a backend device is created
> and a virtio MMIO entry for that device is added to the device tree
> that is fed to the VM kernel.  When the VM kernel boots the virtio
> MMIO entry in the DT is parsed as part of the normal device discovery
> process and a virtio-device is instantiated, added to the virtio-bus
> and a driver is probed.
> 
> I suggest you start looking at that process using the kvmtool and a
> simple virtio device such as virtio-rng.

I would repeat again, I think trying to create a companion virtio
device to go along with a real vPCI device and then logically
associating both of them with a single driver is going to cause so
much pain you should not do it.

Find a way to send your RPCs through your own vPCI device.

Jason
