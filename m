Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D216D3EF0C0
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Feb 2026 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385279; cv=none; b=TDdgMDBDr0vHeCJx6ZjDq/IlRSmclDzPNp6RrHn0algxgrLZdFeUcYK+9ZEFa9dHa6V+bLBBnn2dNJdZp9YI4JgmUdZD046fYGyRxnFvwcSxG9fPQ9vjNkZOaEolSdZ7I86u8LEcKVC4/3rMm0YgNsK9c7K54gwpklig/BLKINk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385279; c=relaxed/simple;
	bh=cgQMbDqYfT71b9lkPLaFsRUiAtSX9sd1HsEdDuF2BwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TnT+vwSC3OOK+MfGPszyP/GJ/HoOPSI3hJm9NnaZwUxtUlL+70J/ems/TYAhKhGrHrusm1tOaA+esR0KQspCud6shKuNHBAHkK3iyXIXRbaOOYJ+eHvgeJoYo+DGd5xanwoQy0nQwtKB2Xxl09sh/sKwaWPHvwxnHqcwp5j5yTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lG5R/6mQ; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lG5R/6mQ"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-4362aadaf09so643904f8f.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Feb 2026 05:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385277; x=1770990077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QC0qEoIgNdVzf+DU7HTFpZWfSSy5BNhr3750S1v0f68=;
        b=lG5R/6mQC5dizOpg+xc4ycfssOhvxnel/HgB7Kqslk4Pq4E5VDK+Dqf+5r8Em7z6dZ
         CmV+JZf6FbEM43v2xbeutSLqlv5+GQmwBk9L6I9J6B1iTOWcDxnxT82nFtP6tGWTyZwB
         H+Y89NldGy0Ey/m3CtjzL5+bNvWawuGUEeNby+SjRTThQbwZ4lVQnnSLHI0MBWcbHW/Q
         0KSa5wMfBOR7EkMFm/uRDr522xKEYafgk/oXsrgEYOvzllZgGAE0Cufho8ZQrQyyAAlH
         SUl5kxCKMISeJ3si7t/ynnFwQYlWG/feexTJ2xlgliRJ1dPTZ9Rf7VMR0rWwt21/W067
         4K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385277; x=1770990077;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QC0qEoIgNdVzf+DU7HTFpZWfSSy5BNhr3750S1v0f68=;
        b=ngCTlz7RHGnlsdl1zff1Tnk9StdNUdokhWJgoYHtclwf/3wWCz7/3KGW09hh80HOWK
         JyyTHqwn87ZZevHMkOvu150CvgMN2lJV2G979cWedpDMwSr2shCza/aQI9VNOiNs5yj1
         5HY0Ja1X8YWpFfPPvi7U7zTO7tecqfKV37xrDU0PNAUd/ZuROzgQU8O4l66nxvX2Fvgm
         8xXMSey7etYS7KxvGC+H8tMXMxgZUxNDUGB/cAELzqE0ODq7qucRgN4wZV5zNzTZRrrJ
         iNb+J9yPXFcwvzSA5T9b75bgFhdTjzj4NH6w9vWqJiA04x4cES0slN8FsFYhqPtpaUSG
         2sMw==
X-Forwarded-Encrypted: i=1; AJvYcCV60xWdkiScQPN1ro8KsqH11IUKacmSoQuRvwmwied/Eg6vDYIIjzrlrXvUsqfJEsllNPR/gpRnu+4Jncwv8Kus@vger.kernel.org
X-Gm-Message-State: AOJu0YwKWbSTf4XrS4azGWJNqLXf+JcaAuflhCL8OlBltV0UunKdf7VX
	Q5Flm20FLzLOChvLjxXeUiO4U+Ky4CqA6Qbp1K5UdoPs2hzTzYGijibPv/J3nfyjsiY=
X-Gm-Gg: AZuq6aI0z8pnzu7gGU3jK7XyGyHKITo2jWRyvlw8Br3XANZOtPF6UPZLEct/CziztKA
	FZ0qSJolN4Nj4YYwCyHIGZhGUfa9515nq9XOVux+u5WK14dYt84rBfZ6c08/BlbbT/YNjPS4nTQ
	PciwVVBn2q1lUhFLIlTnnvr3L7S73BiT11dPZZh/oihGxNL9ZhuIwLh1ivPRtGFfIonWD6jQg8u
	KCBz/fRajeoAiAFl7KpFbIrFIAisaxxXLa+7ylp8PyGZNBLQelVw4Ux5aUuuq1DVG7D1/0ufmqH
	T06Dy9fH20bwPxF6tvSH3DU9oo+6xfOQ8LMKBIHjjgYm4mZDY6HMdpnhuuWk3MWbwOSHknlBujc
	4XfDzr/wobDYMwzaPKKuFGQdleSPRpImxxxmNh8WIiaHu6Gj4AFjRl0/nXjzQjVg2zXtvyl7d4S
	hCBiRj1KIWWXXWmRoK
X-Received: by 2002:a05:6000:616:b0:431:369:e7b with SMTP id ffacd0b85a97d-43629341e83mr4341944f8f.18.1770385277209;
        Fri, 06 Feb 2026 05:41:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b25casm6297355f8f.4.2026.02.06.05.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:41:16 -0800 (PST)
Date: Fri, 6 Feb 2026 16:41:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Message-ID: <aYXveV_Y1gT73JoK@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Peng Fan,

Commit edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops
for imx_rproc_dcfg") from Jan 9, 2026 (linux-next), leads to the
following Smatch static checker warning:

	drivers/remoteproc/imx_rproc.c:648 imx_rproc_prepare()
	warn: ignoring unreachable code.

drivers/remoteproc/imx_rproc.c
    605 static int imx_rproc_prepare(struct rproc *rproc)
    606 {
    607         struct imx_rproc *priv = rproc->priv;
    608         struct device_node *np = priv->dev->of_node;
    609         struct rproc_mem_entry *mem;
    610         int i = 0;
    611         u32 da;
    612 
    613         /* Register associated reserved memory regions */
    614         while (1) {
    615                 int err;
    616                 struct resource res;
    617 
    618                 err = of_reserved_mem_region_to_resource(np, i++, &res);
    619                 if (err)
    620                         return 0;
    621 
    622                 /*
    623                  * Ignore the first memory region which will be used vdev buffer.
    624                  * No need to do extra handlings, rproc_add_virtio_dev will handle it.
    625                  */
    626                 if (strstarts(res.name, "vdev0buffer"))
    627                         continue;
    628 
    629                 if (strstarts(res.name, "rsc-table"))
    630                         continue;
    631 
    632                 /* No need to translate pa to da, i.MX use same map */
    633                 da = res.start;
    634 
    635                 /* Register memory region */
    636                 mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
    637                                            resource_size(&res), da,
    638                                            imx_rproc_mem_alloc, imx_rproc_mem_release,
    639                                            "%.*s", strchrnul(res.name, '@') - res.name,
    640                                            res.name);
    641                 if (!mem)
    642                         return -ENOMEM;
    643 
    644                 rproc_coredump_add_segment(rproc, da, resource_size(&res));
    645                 rproc_add_carveout(rproc, mem);
    646         }
    647 
--> 648         if (priv->ops && priv->ops->prepare)
    649                 return priv->ops->prepare(rproc);

This is unreachable code.

    650 
    651         return 0;
    652 }

regards,
dan carpenter
