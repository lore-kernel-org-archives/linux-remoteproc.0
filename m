Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A39718A6A7
	for <linux-remoteproc@vger.kernel.org>; Fri,  4 Jul 2025 16:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646324; cv=none; b=qaL1n6Z9WnvEOPxY3UDAr/BXrij7HPOGDROmauj4o7IkUdyC9gtCgwtZAhpVw9/7XBuvnzlNqX3i8eX86uCMu/5M7KEP2OceDIraAaV3SllrxnHjwTzinND9QuS0KspA6HfrYrHA0UvEqse2VAbl5zCKl5FNvIEDUjnTi7pumAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646324; c=relaxed/simple;
	bh=DmkuvrNR0VSL04LmD9dkfnMwSx/b2+d/LUqM5NHqjpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5h9ybQciXoHrRkLL/PXN1bpAIlXq1nzH2de6nvQfR5LcxKVlGXPWI6lPk+VYCJt+lsXJsheNeUNIsV+2O858WgsBbAB+qr4XjpaTcxsaaWUiRrogT6vZkoFr1dkRzv/KW6muM9py35hlhSeTcfZZ+Lpg+ydNPY5GAsegAfOwk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PlhDmt7a; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PlhDmt7a"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74931666cbcso971337b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Jul 2025 09:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751646322; x=1752251122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gLPE6u9pVE9mFKhORQsoD2PjZ8/6f/PPPShr0ovcjeY=;
        b=PlhDmt7aPu/LZuKLhMJ42e9QfE8veWcIEC9k3mqjC84gjQ4utCIHtQzz6HEsipoEaI
         HL/aagFlhr9ZHLLNqk23tK91ammD6PXjRuMwHCTtZvb7R2SjVEJV9JuyOl3HtshVHqH9
         hzIP3sDW6uAC9pU0WKseO6Y0idsHhdZi77URJ8l3Fbzt/PuhrFCeaMgJre7GgANtycLh
         JoliVFrmM33lhP4WnbG3i806JP7ih/6N6zN3VcgjyOakjOE6Es41OudmAWP1jgcrpJ0E
         lR1DXsr0y6xB2zKF4aMucMmusH4tmHgyzZBX7pu7+g12dPGoVmoJD6rAmvx71FcS3b7S
         i2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646322; x=1752251122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLPE6u9pVE9mFKhORQsoD2PjZ8/6f/PPPShr0ovcjeY=;
        b=AyK+a59l6IqFtAW5Cn0EP92rA2QdapQ9MEtmNrC5o5eCXqhNGlyvYiMRHowNg27wvo
         CfVMiL9er47cCEygPVz4mlwmR1JK1teH3u7mggn4yVNKgjAnsDuiUYIc4gsaimtPwgRH
         65d+8BRGKVwZLAlDm6EURSp+pY7KbVsJwvYI064n9dXStBTCppiDgbG59xloUwhC2dkU
         BWvDmtL1u1w+4kZHYiKiI5CVD3y8P9vP1eFUno2TGIePWNqm127WH1mQiMJewR5Z5mA/
         imOMaHSzoRm5ZwacHe1INSISQHVtZbEvPyQ3FgzaRWFXZLywvfo04b2CXIasC08FExgS
         6Y/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxIi8SZFC67/QL1SV9qDZ59mP1lfNCvM/nJIvzQkYTBuRbEbGHMSroCpfJYhfGEsWlZzACluJWWR0gF4LGqKHs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Y0FpeT9n/LlrQM7dWIe+3MHhVf9gdqExpwwTkdcku6l6ZJda
	iqQkmz/LWOxtNz9bYQo7GQ47H2dm8nlA/rnuqt++UBcvXwZWF9eQyjVAMZu2pj9ua+E=
X-Gm-Gg: ASbGncuAfAaGTUGy89241STc2ER0l/hheEyZBpBVepjGimS/rqeso5OHhJ2obc65IYz
	HMgFIpj4tIZQekranH8O5LuhvLgiTukWGp5/NPre57x2lC/0mw3BzuSLEQ4NxIuYZ1Mfz60VLSo
	gt2WR4k2gg6gvX3SxGYshlUR4BEpfmj2IZlbKYgqHEElKEYFFf061dLLAFS1kPEkZgKuKurtC0i
	bEXdQTsoEFgHBMKk//HMS/oHfkgBGrqnGmGKYuvY2FrWfVWgE1b9eG2aubltbDYa2z7qiFRQMy+
	nJ36rspxoPac3e5yHET9tO5idjm94Wqh1WdVItdSC51Z3Q9xSRbFohQpo9qls2GKWg==
X-Google-Smtp-Source: AGHT+IFBiad93Pn2/FAtXLpWzkQ49cPn+B6HjvtiH5Apy3jz1Cm6ZSX7XnZ5N4+nL8xIggbIhrfCsA==
X-Received: by 2002:a05:6a20:548d:b0:215:eafc:abda with SMTP id adf61e73a8af0-225be8d93abmr5288088637.18.1751646322493;
        Fri, 04 Jul 2025 09:25:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ebf3:da99:de93:f600])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35cba78sm2572801b3a.57.2025.07.04.09.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:25:22 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:25:19 -0600
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
Message-ID: <aGgAbwToGhsc5VV9@p14s>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703130831.18830-1-hiagofranco@gmail.com>

Good morning,

On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> Merge the contiguous ITCM and DTCM regions into a single region to
> prevent failures when loading ELF files with large sections:
> 
> remoteproc remoteproc0: powering up imx-rproc
> remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
> remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> remoteproc remoteproc0: Failed to load program segments: -22
> remoteproc remoteproc0: Boot failed: -22
> 
> This approach is the same as commit 8749919defb8 ("remoteproc:
> imx_rproc: Merge TCML/U").
> 
> Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
> Hi,
> 
> The ELF I tested had the following data section:
> 
> Memory region         Used Size  Region Size  %age Used
>     m_interrupts:         680 B         1 KB     66.41%
>           m_text:        6984 B       127 KB      5.37%
>           m_data:      130224 B       128 KB     99.35%
>          m_data2:          0 GB        16 MB      0.00%
> [100%] Built target hello_world_cm7.elf
> 
> Which triggered the error. After this patch, remoteproc was able to boot
> and work fine. Thanks!
> ---
>  drivers/remoteproc/imx_rproc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..bbf089ef48ee 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
>  
>  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
>  	/* dev addr , sys addr  , size	    , flags */
> -	/* ITCM   */
> -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> +	/* D/ITCM */
> +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
>  	/* OCRAM_S */
>  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
>  	/* OCRAM */
> @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
>  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
>  	/* DDR (Code) - alias */
>  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> -	/* DTCM */
> -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },

In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
this patch "dev addr" is not.  How will this work with new kernel that use old
FW images?  Am I missing something?

Thanks,
Mathieu

>  	/* OCRAM_S - alias */
>  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
>  	/* OCRAM */
> -- 
> 2.39.5
> 
