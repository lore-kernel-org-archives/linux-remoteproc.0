Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DD2211A3C
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Jun 2025 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955933; cv=none; b=egc3ppmNxKOqJSGd3raSuRoDjiMkgAhAiQfQc3glsn5VG7Hsjf8i3M6aWEoUCst0G9qFmA2v2Qq8Gc/pO8tKRCwlMXqwQYjMpyFcaUo9CWIwIxucFX6r2mhPR7EM3emvbNKNHj5AU6zy8+bnJ417fG9JXuyF++z49bgqBe23y6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955933; c=relaxed/simple;
	bh=4tM+osFLm95F10wmg1hWXVqNZ33jb/n9KzTYrLGnO40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFsjC+FzRFkr//4jjcgEN0vH4pRHBS9zZJkXr5c5OL9hWNkMPIOep1sQef1gPhKAJGWaHSafQNVVG1i3CTeS9iaulWXDOhmWFFswWZqpKjizAhm3JohByb1K34dL8G3fU1e6+9uNiTjTsorOFF/Pri3CzyLjfpWUwhobuxXAriI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zyJeW8fC; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zyJeW8fC"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-747e41d5469so1410452b3a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Jun 2025 09:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750955931; x=1751560731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tvhr4Hd42xq744xGvgbZzLcER/F+YlE4VE7BOc+9sLU=;
        b=zyJeW8fCkW1IexiVQQVsiddOsKr3fmmRlZ/gw+LxuiWqhubFRWmnnC4/wLAQRW1/cA
         GFaPvN+a/us2HCzjJz6aa2fRMJ7WR+cYyRsJfEY2Nf1ATGWA6SKw1InMC1q4u/mgENh9
         sknM/mb8GhpSJ0gQ+67APRkS8z1QinSB0TZemgNicj5ZkWcv8lE7TuBw52rbcjRqwA4d
         d6aTdh9VNjDWewHjV/ILBU3Rs+/sikp0eV7Dz3/7J+zs+PmKlPy+ktukkoN2rtfEngp8
         A/BlBEz+ouOU1SgpD3W5MQP5GGJLKDoamyjtNTShhSBU4Sj/9ephb6tr8x+0z/7SWz3s
         omHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750955931; x=1751560731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvhr4Hd42xq744xGvgbZzLcER/F+YlE4VE7BOc+9sLU=;
        b=AxWBh23YBMBkswFf8CwWoeXQvItrDmsBTtirxkoupbd3Mo6iz3RdvFoEw109OGGJFD
         TWM1twkhjeXhloRa/+spL3R46KjRpIyRMP0DurouDS+r7cx6CVRxZh//HgNuORNyKAqO
         32XSjp8q3J3LabMCVwS+ocQ0DWykMUtTZIY1wXsyNsVnk7mYCO+1oYz75Ha5AAWLrzNp
         VrTSz1Tv/HVhL5UnMcg9c7A6uVwI8nuBtXhI9JEWsO8HCuar1aiW8MKj9dKZYggKDp3s
         qVPWRa9eLyPEe6Igqg6zPoQEgXV/sqx/09slmeFSqjEUWkAYbBb5fyqHd1Dm5w2+V+wS
         qtig==
X-Forwarded-Encrypted: i=1; AJvYcCUiN5lhnLn69cJMUvwZ0fSuCm2aaqFCEXsNRYTKteouaWewAfW9YorGhDUnSoLerq58bboiFVxRAUJrvQmw6oUz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6b+V9c4lKqW4+lIT+/OGhdkIfwfoX+hxyVQcI2VNkRUb6vqzi
	jmS4iS75Vk1tzlGde6JD5/kw7yiRRWXBPOvFl6czDKpvGXUrceafL9itzLDy1Xw2X2VeqBtQCZu
	uGW9AwAI=
X-Gm-Gg: ASbGncuE1YRju4MDC+a/O7BwR7tm3Q0/YYhZoTQ62tEBO5P2//JCqiqZlZIkmLh0QQ+
	DYVro1k+MAwSSXN3Ev0FETudj6XXuwrQOHcDwUXHlRVB1hBpqQ6j6pnsH+ULZQlsAVrOOY3ii38
	5PvmmcFfNTw/gyXzEW8pc/wFcNoo0B4hAGC6RSd7Qf6/a2PXm44Cg7ekiH1Rzt1ZqDvWLn8Uy9n
	qvn+G4YBgixuPyWtuf44GjA2P+SfW7UmQtDewjpP98GNO0RJeu5cDDme+AonHKZm8FzglBbhK57
	DaQ5iVUshx0NhwbIRKiJFc5GgmYNiUmxGgpV+T3/ysYjPB9DQg/H9oquu8UY47QSpA==
X-Google-Smtp-Source: AGHT+IEjuEd/+4xRMbzboGHemRO7m2WnkSGGA6KZ1DSWu6K0FQ5qJhdZ8YASpAcYjCqHtKB3BtTM2w==
X-Received: by 2002:a05:6a00:1141:b0:742:b3a6:db16 with SMTP id d2e1a72fcca58-74ad45b0013mr12097671b3a.20.1750955931088;
        Thu, 26 Jun 2025 09:38:51 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8327:3d7d:46f2:c531])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34c44460c4sm2094220a12.45.2025.06.26.09.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:38:50 -0700 (PDT)
Date: Thu, 26 Jun 2025 10:38:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rpmsg: char: Export alias for RPMSG ID rpmsg-raw from
 table
Message-ID: <aF13mM9PSvTnKQ1k@p14s>
References: <20250619205722.133827-1-afd@ti.com>
 <aFwgQJ8B7EcjM1q7@p14s>
 <a6d77856-cf9a-48f4-a66c-d124752b5f64@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6d77856-cf9a-48f4-a66c-d124752b5f64@ti.com>

On Wed, Jun 25, 2025 at 12:12:03PM -0500, Andrew Davis wrote:
> On 6/25/25 11:13 AM, Mathieu Poirier wrote:
> > Good day,
> > 
> > On Thu, Jun 19, 2025 at 03:57:22PM -0500, Andrew Davis wrote:
> > > Module aliases are used by userspace to identify the correct module to
> > > load for a detected hardware. The currently supported RPMSG device IDs for
> > > this module include "rpmsg-raw", but the module alias is "rpmsg_chrdev".
> > > 
> > > Use the helper macro MODULE_DEVICE_TABLE(rpmsg) to export the correct
> > > supported IDs. And while here, to keep backwards compatibility we also add
> > > the other ID "rpmsg_chrdev" so that it is also still exported as an alias.
> > > 
> > > This has the side benefit of adding support for some legacy firmware
> > > which still uses the original "rpmsg_chrdev" ID. This was the ID used for
> > > this driver before it was upstreamed (as reflected by the module alias).
> > 
> > I was surprised to receive this patch - my question from almost a year back is
> > still pending.
> > 
> 
> I answered[0] your question and never received any follow up questions so I had
> assumed the answer was satisfactory.
>

Ah!  I never saw your reply, apologies for that.
 
> > > 
> > > Signed-off-by: Andrew Davis <afd@ti.com>
> > > Acked-by: Hari Nagalla <hnagalla@ti.com>
> > > Tested-by: Hari Nagalla <hnagalla@ti.com>
> > > ---
> > > 
> > > Changes for v2:
> > >   - Rebased on v6.16-rc1
> > >   - Added Acked/Tested-by
> > > 
> > > [v1] https://www.spinics.net/lists/linux-remoteproc/msg18959.html
> > > 
> > >   drivers/rpmsg/rpmsg_char.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > > index eec7642d26863..96fcdd2d7093c 100644
> > > --- a/drivers/rpmsg/rpmsg_char.c
> > > +++ b/drivers/rpmsg/rpmsg_char.c
> > > @@ -522,8 +522,10 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> > >   static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
> > >   	{ .name	= "rpmsg-raw" },
> > > +	{ .name	= "rpmsg_chrdev" },
> > >   	{ },
> > >   };
> > > +MODULE_DEVICE_TABLE(rpmsg, rpmsg_chrdev_id_table);
> > 
> > ... and I still don't understand why this patch is needed.  What is broken that
> > this patch fixes?
> > 
> 
> Today when this driver is built as a module it does not automatically load
> when a matching firmware is started. You can see examples of documentation
> working around this by manually loading it[1] and even applications
> attempting the same in code[2]. This should not be needed. Here is why
> this happens and how this patch fixes it:
> 
> A given firmware that makes use of this driver will have one of two
> RPMSG device IDs: "rpmsg-raw" or "rpmsg_chrdev". Let's look at each in
> turn:
> 
> If the ID is "rpmsg_chrdev" then this driver module will be loaded into
> the kernel (that is what the MODULE_ALIAS line below did). But it will
> not cause the driver module to probe, as probe is triggered by a match
> in the above rpmsg_device_id table.
> 
> If the ID is "rpmsg-raw" then this driver module will probe with the
> firmware, but only if this driver module was already loaded into the
> kernel, or was built-in to the kernel.
> 
> By adding "rpmsg_chrdev" to the table we make this driver probe for
> firmware with that ID. And by adding MODULE_DEVICE_TABLE we make both
> IDs trigger the module to be loaded if it has not been already.
> 
> This patch makes it so both IDs do both needed actions. Where before
> each ID would only do one action, but not the other.

The part I was missing is the call to add_uevent_var() that uses @rpdev->id.name
in rpmsg_uevent() - with that in mind it makes sense.  I have applied your
patch.

Thanks,
Mathieu

> 
> Andrew
> 
> [0] https://www.spinics.net/lists/linux-remoteproc/msg19814.html
> [1] https://github.com/OpenAMP/openamp-system-reference/blob/main/examples/linux/rpmsg-mat-mul/README.md?plain=1#L42
> [2] https://github.com/Xilinx/meta-openamp/blob/master/recipes-openamp/rpmsg-examples/rpmsg-mat-mul/mat_mul_demo.c#L306
> 
> > Thanks,
> > Mathieu
> > 
> > >   static struct rpmsg_driver rpmsg_chrdev_driver = {
> > >   	.probe = rpmsg_chrdev_probe,
> > > @@ -565,6 +567,5 @@ static void rpmsg_chrdev_exit(void)
> > >   }
> > >   module_exit(rpmsg_chrdev_exit);
> > > -MODULE_ALIAS("rpmsg:rpmsg_chrdev");
> > >   MODULE_DESCRIPTION("RPMSG device interface");
> > >   MODULE_LICENSE("GPL v2");
> > > -- 
> > > 2.39.2
> > > 
