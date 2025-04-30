Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C0A2798EA;
	Wed, 30 Apr 2025 17:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035573; cv=none; b=Uro2vJyZ46RZJZKtzEJlV/6B4PqXlYDOheGVOo8fQkcpQlvMwQ91XbyLeCEoC0PXaRrfJblaWDpo5fXcgZz4SxzP1uFYvZGa6O5mqbOkcxir3z9gfccLXFtz+y3ow5ET0NMlU8LzF3eNE9qkS/FonTo2ek3/9mN+XGTPdPubqTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035573; c=relaxed/simple;
	bh=zYw/s5vnoNifPWPELFEdxD8cn9LSC0nK+AUWE/Y7jNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=US29SL1u3TlwKeSXxjlOXSJ1riQQPcVyEKmiU4PWUB8FH6Vu42Ra9ZFQCfiCfoDGMxXwRRBzbTGyHF3ODE9ZNCvEXUeUHaUec+8pMyUurO1aRi1XRED5p4NK3ur980lYduQO7eCsLe/CTyjCieZsD3moT8kHiLxTKBhjdBzwbVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2w8U5Sb; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2w8U5Sb"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso245022b3a.2;
        Wed, 30 Apr 2025 10:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746035570; x=1746640370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2nhmZSwtgikjWBSYNUyofWdCpk4ZqQ2gv/cEQTRW/cY=;
        b=I2w8U5SbsoQwtJwlZ4sUCd3jkO0Lfs/h0eLQDbYwhwAAmyFYbX3QbvJ9mA1g6xkaML
         oXeB6NXxVYwbIRxmoXftup4TsK7ONwpSJQ9brDeNOuuVB5ojCcSnHpI/lrLzklknjzh0
         10zkDjgup2rT1AxuFxNoAPyCl7dnwF/yaaFxwOFhn9B3TImA3BsqhQw7dWa/jd6UmhOG
         ZmBlJMGudkbf/UiO0bkRnDOVdEN9isjDc0mHge06OjJlI7OlwT8vURdc91dAvfsf61c3
         JpF5Rl2OEwy7q1Od3H4Ie0ryb/kQMOv3tB2J5Xm6JzkJ55rVrqyfFhc5Fzz2qY2JGO+D
         1XlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035570; x=1746640370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nhmZSwtgikjWBSYNUyofWdCpk4ZqQ2gv/cEQTRW/cY=;
        b=OfVTX4k4m9gMnQSOsfeH2BzYY/hw64nWYrfwfzjNkdBPQi/ZX3NOdYmg+Jexw4M7t5
         rPm28DVpSbcdGfKpwIRNUhDlMkK1lBiqjzci2e5kNYD5O0dZWsmRnvBhImaH1mnLshAH
         jv4Vp6fzOqgwW7hhvC+EHi75zrYxwL19u7i5Mhm8ScBnOhyIq9+i1xsqImzFlDxmKxvx
         X2spOlKdflniINg7a5y9+23QObrcGbmcVjiFqvm8RgI0DRUPaWyGrkpQCkbZ1FIR1N6u
         A7qQtz5sYx3iCIhzAXppTEWxMawF0iesZQPA34RPlE1Yzbb8ReVohVfxu97eQDGZfmc5
         HdCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMo1uO09G4ZF/oAQy8Zmt0dp7UTxN0Xsr6cip3H0uyYKTA+7JbLHXPktEV8tmmNZgqY4iBhvhy0G0Se7p36xmkIg==@vger.kernel.org, AJvYcCXh+AL+XMO1mjcKyok5lM4Hkrtjkuy9/k4kYYadHSod+toNA3SMrFysknOo8DnX4TO9xR27GCc4CLj53Js=@vger.kernel.org
X-Gm-Message-State: AOJu0YySK1r2JeICEy+uo7gPYggfFnDrYNOs2JgH3rBvp3iOMCJujuVs
	o75NhQ0rtzPUd5FdgrbKGnE0yvHAnoYRdI0ZidC2iYdLN70pT5jq
X-Gm-Gg: ASbGncvcqoLr+fPkXqFUvO8P/Ql+6k7MMwCXWnzyBsPjen0eC7HXnvzGRP7ov3+51Ew
	tqPPJ3HWSxgBKeYLAXKgm7GUCdTLZiSQ7sIRT+Ux18Ex+4qaqt+aoUniVteXCqonKAbVse89VYk
	I9Dtm4lhRLkIO+XRKbquhUBGz3OExaHC54aeaLwnpqhLW9L3eWIBeR0OiRtgUr1m66ViUD+BWo3
	FOca2591RGV6vkCpC1vUVeAhh0+o9s3dwX2DSRRX78n+RR3wOw152xpEkJgxXFga5HyFDtihKmO
	N9hcSVF7NECo+YjYcisAS1Z2IK8wdWaaZp5kpwM=
X-Google-Smtp-Source: AGHT+IHSsmjIHujeop0GPrFKZEE8a20ERgK4zOqvjWbsrPxVz4likdeGOhNqZUGu8tAYNJ9jJV6fcQ==
X-Received: by 2002:a05:6a00:4b06:b0:736:eb7e:df39 with SMTP id d2e1a72fcca58-74038ac9bd3mr7160058b3a.24.1746035570279;
        Wed, 30 Apr 2025 10:52:50 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c0:d901:78f8:210a:bdd7:104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a60081sm2008732b3a.139.2025.04.30.10.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:52:49 -0700 (PDT)
Date: Wed, 30 Apr 2025 14:52:43 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with
 devm_clk_get_optional()
Message-ID: <20250430175243.mszwmrd4iefjjs67@hiago-nb>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s>
 <20250423192156.b44wobzcgwgojzk3@hiago-nb>
 <20250426134958.GB13806@nxa18884-linux>
 <20250428171257.276bqhaupe4ksu5l@hiago-nb>
 <20250430060835.GA31028@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430060835.GA31028@nxa18884-linux>

On Wed, Apr 30, 2025 at 02:08:35PM +0800, Peng Fan wrote:
> On Mon, Apr 28, 2025 at 02:12:57PM -0300, Hiago De Franco wrote:
> >On Sat, Apr 26, 2025 at 09:49:58PM +0800, Peng Fan wrote:
> >> On Wed, Apr 23, 2025 at 04:21:56PM -0300, Hiago De Franco wrote:
> >> >Hi Mathieu,
> >> >
> >> >On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
> >> >> Good morning,
> >> >> 
> >> >> On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> >> >> > From: Hiago De Franco <hiago.franco@toradex.com>
> >> >> > 
> >> >> > The "clocks" device tree property is not mandatory, and if not provided
> >> >> > Linux will shut down the remote processor power domain during boot if it
> >> >> > is not present, even if it is running (e.g. it was started by U-Boot's
> >> >> > bootaux command).
> >> >> 
> >> >> If a clock is not present imx_rproc_probe() will fail, the clock will remain
> >> >> unused and Linux will switch it off.  I think that is description of what is
> >> >> happening.
> >> >> 
> >> >> > 
> >> >> > Use the optional devm_clk_get instead.
> >> >> > 
> >> >> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >> >> > ---
> >> >> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >> > 
> >> >> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> >> > index 74299af1d7f1..45b5b23980ec 100644
> >> >> > --- a/drivers/remoteproc/imx_rproc.c
> >> >> > +++ b/drivers/remoteproc/imx_rproc.c
> >> >> > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >> >> >  	if (dcfg->method == IMX_RPROC_NONE)
> >> >> >  		return 0;
> >> >> >  
> >> >> > -	priv->clk = devm_clk_get(dev, NULL);
> >> >> > +	priv->clk = devm_clk_get_optional(dev, NULL);
> >> >> 
> >> >> If my understanding of the problem is correct (see above), I think the real fix
> >> >> for this is to make the "clocks" property mandatory in the bindings.
> >> >
> >> >Thanks for the information, from my understanding this was coming from
> >> >the power domain, I had a small discussion about this with Peng [1],
> >> >where I was able to bisect the issue into a scu-pd commit. But I see
> >> >your point for this commit, I can update the commit description.
> >> >
> >> >About the change itself, I was not able to find a defined clock to use
> >> >into the device tree node for the i.MX8QXP/DX, maybe I am missing
> >> >something? I saw some downstream device trees from NXP using a dummy
> >> >clock, which I tested and it works, however this would not be the
> >> >correct solution.
> >> 
> >> The clock should be "clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;" for
> >> i.MX8QX. This should be added into device tree to reflect the hardware truth.
> >
> >Is this correct? I added this clock entry and also updated the clk
> >drivers to handle this option:
> >
> >diff --git a/drivers/clk/imx/clk-imx8qxp-rsrc.c b/drivers/clk/imx/clk-imx8qxp-rsrc.c
> >index 585c425524a4..69c6f1711667 100644
> >--- a/drivers/clk/imx/clk-imx8qxp-rsrc.c
> >+++ b/drivers/clk/imx/clk-imx8qxp-rsrc.c
> >@@ -58,6 +58,7 @@ static const u32 imx8qxp_clk_scu_rsrc_table[] = {
> >        IMX_SC_R_NAND,
> >        IMX_SC_R_LVDS_0,
> >        IMX_SC_R_LVDS_1,
> >+       IMX_SC_R_M4_0_PID0,
> >        IMX_SC_R_M4_0_UART,
> >        IMX_SC_R_M4_0_I2C,
> >        IMX_SC_R_ELCDIF_PLL,
> >diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> >index 3ae162625bb1..be6dfe0a5b97 100644
> >--- a/drivers/clk/imx/clk-imx8qxp.c
> >+++ b/drivers/clk/imx/clk-imx8qxp.c
> >@@ -142,6 +142,7 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
> >        imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU);
> >        imx_clk_scu("a53_clk", IMX_SC_R_A53, IMX_SC_PM_CLK_CPU);
> >        imx_clk_scu("a72_clk", IMX_SC_R_A72, IMX_SC_PM_CLK_CPU);
> >+       imx_clk_scu("cm40_clk", IMX_SC_R_M4_0_PID0, IMX_SC_PM_CLK_CPU);
> >
> >        /* LSIO SS */
> >        imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER);
> >
> >
> >However I am seeing a permission denied (-13) from the imx_rproc:
> >
> >root@colibri-imx8x-07308754:~# dmesg | grep rproc
> >[    0.489113] imx-rproc imx8x-cm4: Failed to enable clock
> >[    0.489644] imx-rproc imx8x-cm4: probe with driver imx-rproc failed with error -13
> >[    0.489708] remoteproc remoteproc0: releasing imx-rproc
> >
> >	imx8x-cm4 {
> >		compatible = "fsl,imx8qxp-cm4";
> >		clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;
> 
> From hardware perspective, this is correct. But i.MX8QXP has
> SCFW which manages the system resources. For this clock, when
> M4_0_PID0 is powered up, SCFW will not allow clk_prepare_enable to
> enable the clock, the error return will be LOCKED if user continue
> to send the enable request. When SCFW powers up M4, it will automatically
> configure the clock as I said before.
> 
> Set rate is still allowed by SCFW, even enable API return failure, but I think
> there is no such requirement.
> 
> So,
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..627e57a88db2 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>         struct device *dev = priv->dev;
>         int ret;
> 
> -       /* Remote core is not under control of Linux */
> -       if (dcfg->method == IMX_RPROC_NONE)
> +       /* Remote core is not under control of Linux or it is managed by SCU API */
> +       if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
>                 return 0;
> 
>         priv->clk = devm_clk_get(dev, NULL);

Got it, thanks for the information. I will prepare the V2 with this
change.

> 
> 
> 
> Regards,
> Peng
> 
> >		mbox-names = "tx", "rx", "rxdb";
> >		mboxes = <&lsio_mu5 0 1
> >			  &lsio_mu5 1 1
> >			  &lsio_mu5 3 1>;
> >		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
> >				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> >		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
> >				<&pd IMX_SC_R_M4_0_MU_1A>;
> >		fsl,entry-address = <0x34fe0000>;
> >		fsl,resource-id = <IMX_SC_R_M4_0_PID0>;
> >	};
> >
> >Am I missing something?
> >
> >> 
> >> But there are several working configurations regarding M4 on i.MX8QM/QX/DX/DXL.
> >> 
> >> 1. M4 in a separate SCFW partition, linux has no permission to configure
> >>   anything except building rpmsg connection.
> >> 2. M4 in same SCFW partition with Linux, Linux has permission to start/stop M4
> >>    In this scenario, there are two more items:
> >>    -(2.1) M4 is started by bootloader
> >>    -(2.2) M4 is started by Linux remoteproc.
> >> 
> >> 
> >> Current imx_rproc.c only supports 1 and 2.2,
> >> Your case is 2.1.
> >> 
> >> There is a clk_prepare_enable which not work for case 1 if adding a real
> >> clock entry.
> >> 
> >> So need move clk_prepare_enable to imx_rproc_start, not leaving it in probe?
> >> But for case 2.1, without clk_prepare_enable, kernel clk disable unused will
> >> turn off the clk and hang M4. But even leaving clk_prepare_enable in probe,
> >> if imx_rproc.c is built as module, clk_disable_unused will still turn
> >> off the clk and hang M4.
> >> 
> >> So for case 2.1, there is no good way to keep M4 clk not being turned off,
> >> unless pass "clk_ignore_unused" in bootargs.
> >> 
> >> 
> >> For case 2.2, you could use the clock entry to enable the clock, but actually
> >> SCFW will handle the clock automatically when power on M4.
> >> 
> >> If you have concern on the clk here, you may considering the various cases
> >> and choose which to touch the clk, which to ignore the clk, but not 
> >> "clk get and clk prepare" for all cases in current imx_rproc.c implementation.
> >> 
> >> Regards,
> >> Peng
> >> 
> >> 
> >> >
> >> >[1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> >> >
> >> >Cheers,
> >> >Hiago.
> >> >
> >> >> 
> >> >> Daniel and Iuliana, I'd like to have your opinions on this.
> >> >> 
> >> >> Thanks,
> >> >> Mathieu
> >> >> 
> >> >> >  	if (IS_ERR(priv->clk)) {
> >> >> >  		dev_err(dev, "Failed to get clock\n");
> >> >> >  		return PTR_ERR(priv->clk);
> >> >> > -- 
> >> >> > 2.39.5
> >> >> > 

Cheers,
Hiago.
