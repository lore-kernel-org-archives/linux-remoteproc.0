Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406FA217705;
	Tue,  8 Jul 2025 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751995805; cv=none; b=TRl/NQUYsCkeDvqmpWk3CudGfKKTZksnke+bouKD5l4xgmx6fGteE+l8N12ULYpfeScyZMODItPXLskt18yN6LvQoNtR9F+jeGDwMR/gBuKMSeiv7qGR9/URv0mEagbBH90anYHQVWCjY7v1N7k5n62Dk/IKt+FK1crWiTTEfc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751995805; c=relaxed/simple;
	bh=vlMsyk8PePj05/Qp9smxa7jsagrQmzRpKk6M8DQUZX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyNPGf2aTIR6afVdRnLjKl4DXU1/jBuAmPvmHk0xZxB3Gi9NSYIlySUHlYAYKtEKTR9YBXhMvHsKkUbYIqo0HqgSgcsfQJXTrALwH/kcsUKtxIZgRmgkBSqUZVBIlC/VukjVYrCQLEADHQJinJlpEQKO0DG1rM01QJlHp3ZhBAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOciArRV; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOciArRV"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d5d0ea6c8dso347976585a.1;
        Tue, 08 Jul 2025 10:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751995803; x=1752600603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KDWmvBi+xrTnEZOGiVtOCiEcPvDY+R/VmkacimBElWU=;
        b=LOciArRVWcni1ULkFZ484L/P9YFPVAEiqDmpJJEg0yM8u7s0WF7AkabF3jPzgQyped
         jsJY5xbgCrHalb06vYFjlt9QQsPyjlgQPeHaHsGgH/DDdOn7VtoMOwBvWJanH94jOb3w
         5hVfjByvhlZxWWEWm019o/DnCkpTbNNbWOAxxFnf8tacrYIbF3IPy9NYpbYzfJRHPL35
         Ojob1YSqzO/i0TVst1CktA6EJIamBgtNXL+o5dlyfmux36l7MSVL2A6B3CE3tQb34cw/
         5PST312z8lOcfdBRREq2mur3a6sMUnHE49CqoR1yvkhhb/R5EOmf8VMgkKG03v9cWQEv
         j1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995803; x=1752600603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDWmvBi+xrTnEZOGiVtOCiEcPvDY+R/VmkacimBElWU=;
        b=Jml+SSQWofglYXttcjfYIuRA7lJO9ZPVbBOA1XnfRTs2mE+a9daCBVQNCazo6czLq6
         5yVNRqIS3V6qgcXxHH7aWW0pagp2yXeC95HFzAYlMh7EAEJefd/gHCoKZ/zZJ2yQxWSt
         IwysmxfIcnnTyzw/g4tyWy4EhPLRoftwm1uKD/iGkkVbx5nLAc8LqC/OtSe3bnbUE9uH
         Sgb5PmBck//ZiP0ldVWFkBVrB9f895Kx7L9WqKCbLhgRlfhnpl5CVWrrZmwm1eNTA6vg
         9YP9pHiDNI9EohdQb81WX+g3j8PZJhM4q+UkOggvhUD1SHa2vGB7yJ8449fk1mliZenP
         oOuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVYBII5FoUbbw22s3hxHp8E0EdPQdxweinr3vAmCDdw4D67/A6w4hZz6xdH4nKbfr/TFbzJAIEdfaxlfY=@vger.kernel.org, AJvYcCXbdQMPBLj5crq+OJvQrP8M4XELOnTdtZyxMwrcB/lQLw2a3eZGDJ9u31KldMmRT8xpAPM3Sum0I3q8TWKG6Y9tfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7FA2h5j84gglnFA3y9ofQmlWYKlJY/hDGZug21wgmBhQa2o0
	h3q8d+F5eG1pqxGmt7GpJIIP+LR50uQfyyldEgfmvatS8T3Cy8bv2Woo
X-Gm-Gg: ASbGncvydNTeRNVhDsft8mxlm37g3+CCXrAlPLbwmkXFlOcgxWuDCg8kYAUANw13YW6
	jfqFTnQWBDnEEYYHcCWJmAQUOLifPW9UqMMxRud/bVnVjqKJ9TIZs+t0VqLm0xsF+4NuhTpEC0K
	vSkiDad55Ug1Y4dfBAnPTzU8KpnetU/pmcI7Ynt/llUcuFUq7vmC+BLVhBLZYQzuQBMMQSkMvdp
	kP9CcB68LHKz3T+5uEpe+4CHCOmOzudXSLNWuz4FBBNb6iVDhVzsQhmi8OXZRgqYhdYRZ2d5MN9
	htoofVkSpUlFGhLyeqNOD92sewkyxCKGBJUsU4Yhvn542SK0LKMehsrPqsE=
X-Google-Smtp-Source: AGHT+IHpicuys1It3Yx8+rY+BPbIsN6Cyx0b4XZQ3+D2q9CPqUCHLJrwgcMoTXm4g+kFQQ5etcBEyA==
X-Received: by 2002:a05:620a:4304:b0:7c5:a463:397b with SMTP id af79cd13be357-7d5df11dcbamr2094173085a.20.1751995802972;
        Tue, 08 Jul 2025 10:30:02 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7baedsm809718785a.57.2025.07.08.10.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:29:59 -0700 (PDT)
Date: Tue, 8 Jul 2025 14:29:53 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Message-ID: <20250708172953.rbsvk6gy4xuxo42l@hiagonb>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
 <aGgAbwToGhsc5VV9@p14s>
 <20250704190816.kth7bdf34ufc2ht6@hiagonb>
 <aGvyDp36iWv5UQ19@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGvyDp36iWv5UQ19@p14s>

Hi Peng, Mathieu,

On Mon, Jul 07, 2025 at 10:13:02AM -0600, Mathieu Poirier wrote:
> On Fri, Jul 04, 2025 at 04:08:16PM -0300, Hiago De Franco wrote:
> > Hi Mathieu,
> > 
> > On Fri, Jul 04, 2025 at 10:25:19AM -0600, Mathieu Poirier wrote:
> > > Good morning,
> > > 
> > > On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > 
> > > > Merge the contiguous ITCM and DTCM regions into a single region to
> > > > prevent failures when loading ELF files with large sections:
> > > > 
> > > > remoteproc remoteproc0: powering up imx-rproc
> > > > remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> > > > imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
> > > > remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> > > > remoteproc remoteproc0: Failed to load program segments: -22
> > > > remoteproc remoteproc0: Boot failed: -22
> > > > 
> > > > This approach is the same as commit 8749919defb8 ("remoteproc:
> > > > imx_rproc: Merge TCML/U").
> > > > 
> > > > Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > ---
> > > > Hi,
> > > > 
> > > > The ELF I tested had the following data section:
> > > > 
> > > > Memory region         Used Size  Region Size  %age Used
> > > >     m_interrupts:         680 B         1 KB     66.41%
> > > >           m_text:        6984 B       127 KB      5.37%
> > > >           m_data:      130224 B       128 KB     99.35%
> > > >          m_data2:          0 GB        16 MB      0.00%
> > > > [100%] Built target hello_world_cm7.elf
> > > > 
> > > > Which triggered the error. After this patch, remoteproc was able to boot
> > > > and work fine. Thanks!
> > > > ---
> > > >  drivers/remoteproc/imx_rproc.c | 6 ++----
> > > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > index 74299af1d7f1..bbf089ef48ee 100644
> > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
> > > >  
> > > >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> > > >  	/* dev addr , sys addr  , size	    , flags */
> > > > -	/* ITCM   */
> > > > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > > > +	/* D/ITCM */
> > > > +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> > > >  	/* OCRAM_S */
> > > >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> > > >  	/* OCRAM */
> > > > @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> > > >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> > > >  	/* DDR (Code) - alias */
> > > >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> > > > -	/* DTCM */
> > > > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > > 
> > > In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
> > > this patch "dev addr" is not.  How will this work with new kernel that use old
> > > FW images?  Am I missing something?
> > 
> > No, you are correct, I think the use case I tested was not good enough.
> > 
> > If I understand correctly, this will break older firmware expecting
> > .data at 0x20000000 because dev_addr is no longer mapped for DTCM entry.
> > 
> 
> Correct.  Older firmware would still expect DTCM at 0x20000000.
> 
> 
> > Do you think it is possible (or reccomend) another approach to fix this
> > issue? In this case to keep using the TCM, instead of going to OCRAM or
> > DDR.
> >
> 
> To me the best way to proceed is understand why using the current mapping is a
> problem.  The changelog describes a failure condition when dealing with large
> sections but does not indicate _why_ that is happening.  I think that's what
> needs to be fixed rather than trying to move mappings around.

Thanks for the information you both provided, sorry for the noise, so
please Mathieu ignore this patch. I will work around this in a different
way.

By the way, Peng, I noticed the DDR linker from MCUXpresso does not work
if the firmware is larger than 128KB, since the .data is placed right
after .text and loaded later to DDR. The imx_rproc driver should instead
have a way to do the other way around: starting from the firwmare inside
DDR, we could set PC and stack from M7 to point to DDR and start the
execution. Probably will be slower, but it would make the DDR case
possible.

Correct me if I am wrong, but as my current understanding the DDR linker
is broken without this change to the driver. Anyway, maybe something for
a future patch.

Thanks,
Hiago.

>  
> > Thanks,
> > Hiago.
> > 
> > > 
> > > Thanks,
> > > Mathieu
> > > 
> > > >  	/* OCRAM_S - alias */
> > > >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> > > >  	/* OCRAM */
> > > > -- 
> > > > 2.39.5
> > > > 
