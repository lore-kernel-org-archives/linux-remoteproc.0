Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6862D1914
	for <linux-remoteproc@vger.kernel.org>; Wed,  9 Jul 2025 14:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071513; cv=none; b=ZpFllYeBGf5PBpg4uFOT7cTyZfLq2fkkEbhQsKjYMChbe3h5GWO0ze7EUaB7+SiKlqjHn8bJaNOtJFFfRZ5PBoxY+fIZ8Y2nY8klg3IeRQaN6Oki5iqgtUtSptDBuidYmQsRfYTRX8LB/b55yMdT4k1PkNZaPa2oPKENXOTujpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071513; c=relaxed/simple;
	bh=7BtyFzEqdQqk9noBz1kWPn+TluwkrsvSZ+NX6r1NPy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAlatyMJJFm9AXG8q9gREZQy+EiLuui5qvT+QRt0SfymEFjRn2rXXpzSl10usWcE0gGpIWHzYqP+YuJaDNXfLsVVBu7Z9BTjQEVPXCWQopzG/BmPUM9r/6Kw7DsNE9MiwmIIaEXTLl7mXxz9FNGbKRrCAYcCZPHJFH9tpzxP6qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QRucI/3W; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QRucI/3W"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2363616a1a6so53744865ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Jul 2025 07:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752071511; x=1752676311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ob8aeY+0rAZIUvRDNkYhpVzGwYIQJmUrDC32TtGUBQ=;
        b=QRucI/3WBEtNj1PSIQIauasDHPn2O4fo8LLJjA+XPGhGt+ImNgcEbisP/qnnkr0Exj
         u+9buuKv5qJSvhF52m8zrjDddUFtQ6ZS8E+ocITf0m1FJNWJ5NirmtZOifjyn12zwQcj
         QLE5OG+K56uose3LsboeCIZsptZ4Yt7P6DLjcdnEGP1rB+FfCyLQ9E/O0s1IbXu0io42
         QazjadAeYA4ZOCx3ijUxAN9ejuDW4gArXMfQ7XneFXJQzGIvTR7R/l5PozeKNMLT3j93
         PMB1tryl2ylR+gNeooe38SmImDRQT9NOB+/hisLh9w8zlhy85maDJzLFPTz4L084Ee4Z
         fkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071511; x=1752676311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ob8aeY+0rAZIUvRDNkYhpVzGwYIQJmUrDC32TtGUBQ=;
        b=XWhLbm/eFQzAEUpsV7RHfP7U3pUAMHn9+nLHiiPqOoty/1R7OLeqXbVaMZxsPH34wi
         AjewuxgEd4Hd43pr1s322BnDzqhz3ow6EVsKsf+LikHhvxSnc/EoskeFa3/YdXkp6b6Q
         Qdj/rgxV9wUOMuDu9Oo7TA6Plo57ZT3S6gFO+bfStuyZOT2cUM3fI2bARqFd8BugHJbu
         HaFEm2FruGXeI8uTdTOSLW5coxGZlyB9WlLD3XQHfffVNYC16TOMTXv+N29kYwX0Q3dA
         d5dSNn5GqAWQfg4nYYGNCpTelGHZwE763O0anGYfenHzo+85AZB4XEzjVfOpnwYyZWy8
         U0yg==
X-Forwarded-Encrypted: i=1; AJvYcCUo9kHT8+4rSGR8IYOu3EWmHA0T926z34JzqZnCWMng+RoXr316t0JQgHC7ONVCTHcg+Xs647oRbNHsz6lVaYGq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8HgVzFrWwb9nO2TRoFL9JZX2JvstXd/EUIiupqwMG4uvTw2P/
	xLO84zt2FVO0RtWDdhTFul6ZAl62ITUfhawSCQl0ZchxE5sLJ9tOtv4eK3hrdpCpJjk=
X-Gm-Gg: ASbGnculqR3tDarpv63oMZTmH490s38n/n9pk4mtt5DFinqxlQ4B2F1VcR9fOrfHWyj
	q43CnlouqzjwI3yWEP9CGd/lym1ReASJKu9WQwd7zuBufr7VJ5WqRI2kjrJ0KLjB/jSZ9zy+Jzn
	2rHaNDQ5dj00u3WibunSRtz0OnrNjlfdZYYMp1xDkbSZTujvGcUEaKHMr11u8oC+ziZnfvQgPef
	pcxbwNnLoJcY7p71HNKPYDVlaV44e5fbfe2jikd8o3fEFwJTfYBJPSExH4ApuoXNCcRFawM46J+
	y/lagN15HOLNxEs8XpxeUzjptkzgfd1yURru5HONBESapt+zZw6XsDaIfY7svT+r
X-Google-Smtp-Source: AGHT+IEXpbvwTdHDHQUcQtVRwNjYawEjvuYkoQ5Xje633BngDr3uR9fCxc8nAve+MqnqlBJ1YgrlwQ==
X-Received: by 2002:a17:902:e80d:b0:234:adce:3ece with SMTP id d9443c01a7336-23ddb199277mr35277255ad.11.1752071511405;
        Wed, 09 Jul 2025 07:31:51 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:433:ec07:c2cb:e3e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845bcf0fsm136242895ad.249.2025.07.09.07.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:31:50 -0700 (PDT)
Date: Wed, 9 Jul 2025 08:31:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Add support for i.MX95
Message-ID: <aG59VPhYY5deFo_h@p14s>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-3-699031f5926d@nxp.com>
 <aG1J2_nK-LkLQVRj@p14s>
 <20250709074940.GA14535@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709074940.GA14535@nxa18884-linux>

On Wed, Jul 09, 2025 at 03:49:40PM +0800, Peng Fan wrote:
> Hi Mathieu,
> 
> On Tue, Jul 08, 2025 at 10:39:55AM -0600, Mathieu Poirier wrote:
> >On Wed, Jun 25, 2025 at 10:23:29AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
> >> Add i.MX95 of_device_id entry.
> >> 
> >> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++++++++++
> >>  1 file changed, 25 insertions(+)
> >> 
> >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> index b1a117ca5e5795554b67eb7092db2a25fc7de13b..c226f78c84ad180c69804116d6cfcab19db6aaa5 100644
> >> --- a/drivers/remoteproc/imx_rproc.c
> >> +++ b/drivers/remoteproc/imx_rproc.c
> >> @@ -73,6 +73,10 @@
> >>  
> >>  #define IMX_SC_IRQ_GROUP_REBOOTED	5
> >>  
> >> +/* Must align with System Manager Firmware */
> >> +#define IMX95_M7_CPUID			1
> >> +#define IMX95_M7_LMID			1
> >
> >Any reason those aren't set in the device tree?
> 
> Krzysztof rejected to introduce the IDs to devicetree.
> 
> From IRC:
> "To me this makes no sense in current explanayton - you have 8 cores, but only
> one can be put there, so what happens with the rest?
> And I don't think we care about something like remote and local ID - it is
> the same. CPUs have single number. So this looks like copy paste downstream
> and thus solve it internally first"
> 
> 
> In System Manager Firmware, CPUID is fixed and will not change.
> LMID is also fixed as of now, we not expect customer to change LMID.
> 
> So with "fsl,imx95-m7", we could know the CPUID and LMID for M7, so 
> it does not make sense to introduce new property saying "fsl,imx95-lmid"
> and "fsl,imx95-cpuid". This should be the main concern that DT maintainers
> reject to add properties for the IDs.
>

Ok
 
> Thanks,
> Peng
> 
> >
> >Thanks,
> >Mathieu
> >
