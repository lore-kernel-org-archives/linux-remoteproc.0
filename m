Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB00623D28B;
	Tue,  9 Sep 2025 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419576; cv=none; b=mM9lTnUILP/ya9xP4WggzrpVcbYqXwykkUCAHa7Hi7KxiS66S5z8puOw47vxwrGpS1EkGHrxKH7HeKkgzjs0c4AEweyeSy3/Cf0jiNi7uZDjOwdvez+erB8TYQHp8XqtU5VbaPMPgIx4in5QXuCA7cQmNuwsBpXpGQBic4UhJ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419576; c=relaxed/simple;
	bh=Xr731uKqvVgyQ0JBxGdH48L+AwHB4RFNteh0epE5Tj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdyM2xwgABq/JDn+aDPTM7ex/buCiUnnGzFEDaqLizJbVXTlUdgvUxTAi8YsNkyqce9/B03VRDp08rHRj7ZMmURt2XE+P9DCPHmiE+PhOSyvV94dAmhZcNoG4/x258xDo9P7vGxh+dRtjbrv1ApLfPpImrISvZ3oK8ru6Prsgy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeAp/uUF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeAp/uUF"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24c89867a17so54201605ad.1;
        Tue, 09 Sep 2025 05:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757419574; x=1758024374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0Dr+zkj3mEIxzfhKQFQoELzzbl4Q3IPyXE5eMtiFKo=;
        b=jeAp/uUFOV0BpdV5rSjC48NmmaN5rhuAuRF1GL+WU1Ba3fLpFrvS12xqdlfIO4yZk9
         1MwRiLpnP9s051GK3+z1DAeqf5mFfN/GpPOZoToCWZw0r0NBIez8i+zRTPHGSd88DzkR
         G+CAQTFTGRzcK0TEycC7K/F5rCHLoC0sP8WTra7PSbmOqk0eL/+ijX+OtnZvmIExYG06
         0uXDXLUE4+O++lQsE5+WRQXJ1AHs+UmDy1UXXIwWvjuQgw2pFfb+mkq6ds6M8gjio2yo
         8phofb5xtFhImbUkaCCa3Lx/icGWBXF47S7el5ACZ0kaF1miQupThrg1bl9bHeBiZ4Tg
         I97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757419574; x=1758024374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0Dr+zkj3mEIxzfhKQFQoELzzbl4Q3IPyXE5eMtiFKo=;
        b=Z7JTr2IoqL97JdlYSqVFBfAK0zC3ZTo/YAHBPXJUFg6RAPC36qwGkNc8cDBahJrN5l
         BcMZHgPVJMATBgc+iJS/0BDlqsL/G2cb4NK7me4ZYzF2FXwjMXn7MZjdUq6xDC0SSz7r
         dFlZmreI5SyDLagtIaMcNBzqRPzrUX3TAHdeHxqP4SjBt+NMRk1wKtqJzC0mnqRQdlom
         cQNBrPEFWSBOITRr3GLzn6X2lv4/vLl5aPO5Bcf2Wuf/ba7vkAuVBwjbp7IiKithLi94
         rdcBh4wrwhLAep6oMa7BhVxCSqBmALfkrQ/IDxOG/FyfREs6msseVv5kEbQo28ckC+JL
         BY1g==
X-Forwarded-Encrypted: i=1; AJvYcCWxixmX4H4x7OUUL9l22GKHbkKg217rY9w5JpQxGxTXb9XOejiYWQjwqGdkG+bTN1wNN39Ft3tgtAekd04=@vger.kernel.org, AJvYcCXvJnNQUvtL847dIu4vWzQo583vqCpoc+7wden+DJEJyQ3yMCzLov96O8mHGYwHC4dbG/Cg1P48msYqgaK9we3IaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq3izLV5aMjqOSbFGmE7ndYpXc57wp1Hx6ubnePfA2jcgcDvw+
	qn2Q9HaMupdQ+a5eV2QrsZiKtj0x/nFrlUZ01SUBJEiHMhvgVMmbaNwHDrSL2X+t60QUjmM+lN1
	jnjb5xa6h15+g/gYX8A1zRFoPFDKFjio=
X-Gm-Gg: ASbGncs5YUHF/1a0Wj65vsdLZZ8zHdOk/XU3xTwLjTGlCooyNWw1EVBuapLsl5IUKX0
	vDX0snOo0UT3T8kSmz8AcxkmilPNxGLV+xEYmaFnp7D+0fbLmVFTlNXRehBzHvfK71CRAIREcC2
	4mMksgEJ6Ztub1qEh4NwuJp8I/sZHrJjxQcAPFvM7qSdgr1HU7y277b6lCzX1m30A4cH7pmp2+L
	zvdUpCVYdLth12zOlgL99H5tQHHDj2jWkIC+fWXBl0m0Mc=
X-Google-Smtp-Source: AGHT+IF0E23UFEub2CKYrBfDrjLIfLkU4iafJArDl/DfkMDOfmcBH9AaefT4iAXaXjXQyR5D9SnfU06+PwSFYyE7+Ks=
X-Received: by 2002:a17:902:f684:b0:24c:be1f:c1f9 with SMTP id
 d9443c01a7336-2516d33d2demr127944945ad.8.1757419573988; Tue, 09 Sep 2025
 05:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
In-Reply-To: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Sep 2025 15:08:24 +0300
X-Gm-Features: Ac12FXygHbi9xw84Hag5OJCVb5BcG8TXx4Q-7E41-mn1lRl_A0XLq_HSPq3mWfk
Message-ID: <CAEnQRZBW1vfKx8DqV9iJEb6vhWPZ3=szxV0NDwW5h6+LTYLpvQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] remoteproc: imx_proc: Simplify driver by removing the switch-case
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 4:08=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> This patchset serves as a preparing patchset for i.MX95 support.
>
> The current code logic is complicated, with mix the usage of switch-case
> and if-else.
>
> To simplify the code logic:
>  Introduce struct imx_rproc_plat_ops to wrap platform start,stop,detect_m=
ode.
>  Each imx_rproc_dcfg data structure is assigned a ops pointer.
>  The common imx_rproc_{start,stop}() directly invokes the plat ops, no
>  need the switch-case.
>  mmio/smc/scu_api ops are included.
>  No functional changes.
>
> Thanks to Daniel and Frank for the help.
>
> Test on i.MX8MM for MMIO ops, i.MX8MP for SMC ops. For SCU-API ops,
> I currently not have a setup at hand, I will give a setup and test
> later, but everything should be fine, no functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>


Thanks a lot Peng. Entire series looks good to me.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
