Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8489B21ADAE
	for <linux-remoteproc@vger.kernel.org>; Mon,  7 Jul 2025 16:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751904789; cv=none; b=HTWYTUQ1EAN9otYU4zuvaGgpfFl3GMolFdST5tYByfnLLYbA2NhAUAAlQ0wmrNvyBuNSum3iSDsMp6WxFdODNFlkMyAtrBs8O7TjmAEAwnJ8gjmk8JYVBeTw00T3xIO8I0H8hgoHEihHZOrjmdlc/6Uz5oTm8+6jV9aVdHQtAPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751904789; c=relaxed/simple;
	bh=0h2aJlmPnSWDsdCU/F4A5RMFeDhbcjsspm212YRtJYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnHsb3iGsL8LKWSaRkm/FyI4T1yUZZHQmQndfsIXVyy6BO/jzxqEqUDgI5mhwa1iYqs62Ig8JKOJ9X71l2cZqwdRoJD8WOlJOWWYTANV4OuuP7Ms1lBA9IL5mB7ihPIr1GwuY1Vh4BR3EgXsejSNfdKhmuVibHZsHWW/RDn9gac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zKLr/UlW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zKLr/UlW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23526264386so31908815ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Jul 2025 09:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751904786; x=1752509586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rTB9AhUzbXze0SvlJXhNv6ywJb1Le3/qXDwCwOY7m50=;
        b=zKLr/UlWJwuskqYq7hPRwBppAXf5ZQ5CtyG1cc+EiIomGunmRQJMPE72jlED3iBXqb
         9Yp33pgKrOVLzniBfepJ5WSW0PY4eQD9ubNCYw3vaKljNh+xoaUW9z/QOCj7F09obFC2
         qVfF88yp4Z5EeQNqqblEP/YXp4lxxNaoyPcoYk2Sxs3xm/VcdV7ollGPrZc+37M1JX9r
         8G6/JlJ9k07u1xkUwVM5/iBqVBQHgXLyB7GzB1jTUr7CcgsmBQHIocxYBNLUNols4ng8
         PqthJcN0RFHx6oPLsyioj3RgWEUOxCJQvKVgLFlMsTaYRwF0d21/696K/zE1G36/cYbL
         oWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751904786; x=1752509586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTB9AhUzbXze0SvlJXhNv6ywJb1Le3/qXDwCwOY7m50=;
        b=IWRav/hIhftEzlOpz+l3MzB3ggoyJYjkasJboJ12HTcX1tZAhcg7fulRl+5XHLalVa
         KH6EGEfeocU+x5Sfj/3khBDeNDmoQYsRnT3Vusg+PyrW6iExOQEEprPvf9ks2zVrZjcR
         RyE7FRzfLdL/wP+a5XEGOi+xB1h2WwqSme8+XTk3ebt1Epu0Gat++CJffg+Yllny594W
         eg9HcPfOj6Tu6M7fWUocIsbIXqI97y6Oz1ZZDqPA3KfZpwkyo7VeytO48hDy2BTP0Rma
         HFneMzLi0Gt5UUpHNB4MdcxkznuXlHL6RjP9sp8kwvlo+pRAVKIMmLCJwpbxVtiWUfDg
         HyOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV75HqQMPSUr4EQ954Q2jdFllnEo28iKuEc7IzsZLwV/TZPd1b0cOmM5uHfXYUggVjPmux6p78Iz6u4LTBGAkkd@vger.kernel.org
X-Gm-Message-State: AOJu0YybY12ZuMfspbgxJ35jQI5OI9Oh0kWEfE7FKZXLtCL6/FZGuJsG
	fenR9AEGpsq0exJZq9PpJpT1+bxWi6DMcISFn1Pvnsj6vHBRhO65vWv6UIMjwkdxPwk=
X-Gm-Gg: ASbGncs//LwTdIWzekvTAgEuk+OSyz6tNviIl6PuCMxm+7ufp2H+Ntg61M1TK9sgd1F
	cOB8XUws8heMx7xJOUMJn2bM1euTGzK/BvzpVt+Ra8nR6ESMTmh2rAh5kOobN7zy2rwtc0F9fHk
	T6mQKczADz+Ni+hpxIdX1gxzjEgsRFyHRKpkU4pQOKzvOs1NwJ/zgAFcD8OH14ra3CSNkbb00Bj
	w/qKKWva1v65NjlqVTTz5kHdFwRApTGr3ZkK/Qj5Xk3bAHkZ08IYzLNtcVNhblc6Hs5ipsZheC8
	3PtokXT78J62plI+fZfUCX3i+CgDKToJ0DobuTr+jEoXEHs21SBk1SQifcgHzraCCg==
X-Google-Smtp-Source: AGHT+IEQezXaHRglxK6u+wE7BwHS5SdjM0yKB0UdNJiBREdoJn93Iqgm0TzBfL2Hm1mR3xJxK3359A==
X-Received: by 2002:a17:903:41c1:b0:235:c781:c305 with SMTP id d9443c01a7336-23c8755c92amr199352805ad.24.1751904785665;
        Mon, 07 Jul 2025 09:13:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1746:c463:9d35:6eed])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee475a3asm9236671a12.17.2025.07.07.09.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:13:05 -0700 (PDT)
Date: Mon, 7 Jul 2025 10:13:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Message-ID: <aGvyDp36iWv5UQ19@p14s>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
 <aGgAbwToGhsc5VV9@p14s>
 <20250704190816.kth7bdf34ufc2ht6@hiagonb>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704190816.kth7bdf34ufc2ht6@hiagonb>

On Fri, Jul 04, 2025 at 04:08:16PM -0300, Hiago De Franco wrote:
> Hi Mathieu,
> 
> On Fri, Jul 04, 2025 at 10:25:19AM -0600, Mathieu Poirier wrote:
> > Good morning,
> > 
> > On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > 
> > > Merge the contiguous ITCM and DTCM regions into a single region to
> > > prevent failures when loading ELF files with large sections:
> > > 
> > > remoteproc remoteproc0: powering up imx-rproc
> > > remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> > > imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
> > > remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> > > remoteproc remoteproc0: Failed to load program segments: -22
> > > remoteproc remoteproc0: Boot failed: -22
> > > 
> > > This approach is the same as commit 8749919defb8 ("remoteproc:
> > > imx_rproc: Merge TCML/U").
> > > 
> > > Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > Hi,
> > > 
> > > The ELF I tested had the following data section:
> > > 
> > > Memory region         Used Size  Region Size  %age Used
> > >     m_interrupts:         680 B         1 KB     66.41%
> > >           m_text:        6984 B       127 KB      5.37%
> > >           m_data:      130224 B       128 KB     99.35%
> > >          m_data2:          0 GB        16 MB      0.00%
> > > [100%] Built target hello_world_cm7.elf
> > > 
> > > Which triggered the error. After this patch, remoteproc was able to boot
> > > and work fine. Thanks!
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 74299af1d7f1..bbf089ef48ee 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
> > >  
> > >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> > >  	/* dev addr , sys addr  , size	    , flags */
> > > -	/* ITCM   */
> > > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > > +	/* D/ITCM */
> > > +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> > >  	/* OCRAM_S */
> > >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> > >  	/* OCRAM */
> > > @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> > >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> > >  	/* DDR (Code) - alias */
> > >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> > > -	/* DTCM */
> > > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > 
> > In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
> > this patch "dev addr" is not.  How will this work with new kernel that use old
> > FW images?  Am I missing something?
> 
> No, you are correct, I think the use case I tested was not good enough.
> 
> If I understand correctly, this will break older firmware expecting
> .data at 0x20000000 because dev_addr is no longer mapped for DTCM entry.
> 

Correct.  Older firmware would still expect DTCM at 0x20000000.


> Do you think it is possible (or reccomend) another approach to fix this
> issue? In this case to keep using the TCM, instead of going to OCRAM or
> DDR.
>

To me the best way to proceed is understand why using the current mapping is a
problem.  The changelog describes a failure condition when dealing with large
sections but does not indicate _why_ that is happening.  I think that's what
needs to be fixed rather than trying to move mappings around.
 
> Thanks,
> Hiago.
> 
> > 
> > Thanks,
> > Mathieu
> > 
> > >  	/* OCRAM_S - alias */
> > >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> > >  	/* OCRAM */
> > > -- 
> > > 2.39.5
> > > 
