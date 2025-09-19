Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8302E7162
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Sep 2025 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758270201; cv=none; b=E03PbnZWc9W0bZsY0w6coVEWT8l6RroqyjCtZLsijmykW5POFvD4kg+izJqhSbRnqVRphj2YAGan3QusZOPXPL9DNLLHNCW+peIyk3bVTlG/dyEBUWN23WgvqCvvy68nMxNB3O8lBFhfCFvjx9bhjhF+uUJK54jOveIrwqL3ssA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758270201; c=relaxed/simple;
	bh=usjY+o/8CLlwfSa4Vymf4+fsSkyqM1VeZm3AMQMgllE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HKFWVe2ChX2GLhiTjtPvSctpGFBedd4BNS09xEZ0MnXj+zVQg77QVfWu8IpIqKgX0PwVnuWz4lf6VKZTAVY1XDBKNalu0IMZRADMpBXp9+andSi4ps3oTtP2KKnRSickw03L2iMVqCKXSplyQbZtUGnLhALsG/qj4tYQOiYgiuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReD1NdMi; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReD1NdMi"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-244582738b5so15815705ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 19 Sep 2025 01:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758270200; x=1758875000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVujP+zprKI6yaucjxQ+AnFkVr/LyLnb8WhpE7+IVts=;
        b=ReD1NdMihbvvhRTb9ehLxOmIBaTXzBb9LYzNbXi5Wv225oDnyHGfyZJYf4I1oZ8K3E
         f/YdE5aBFSG5VM9GVw47ZTZc+p+tJY6unwWgDuI4XAGsBxTI1dqS1rNBaYD1RWaPNFKQ
         W+GaU2h5m9idoA+T1y+1pCmfwpoHhvFJRo3U2rXdvnmZS5f91BiIBPIZJnKIfrTQqMEm
         hB6hn17BikAcyflOtdgO0DxAKLeGwazWm9Yf5tEXm98YvVZ8Rh7X5gYQu8M+NYy/aoor
         mRnvUuAlyh4ncHYC2w7SSvKh9UBEs3BSRafOOu/6rmZSYi4dPVs+uT12pbyholhKqbIO
         Jjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758270200; x=1758875000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVujP+zprKI6yaucjxQ+AnFkVr/LyLnb8WhpE7+IVts=;
        b=pao5S93e4V8gGxoDhnPHwSl8qDYe5+54t9ZfFGGznQwyTWALGQ/gsgProq1djGTW1F
         QRhiBDZUU/f3rdmDg/nA2l+VXA7syyZ4F8Ko1fcnXA0IUYEWxomtgfQCpMIfMywxYNIt
         IVLkP0QBIGM28FBkRCGepjIj3OmKLWWanSJI0+GBx7VEgMgl2a0cCJyr7LFmRWEjwIC/
         yi3ErsfCBOU2QH5VQpXzKEeh1vvT+Kkf6XUN83ggAC87kGmqrmShq2k+Zvk0YWvNTN9w
         yqA6Nhl3TFQ6KcfH2S9O13PNjFN3yv+vRIVoaGlG3wlAkQxl5Lfy2YMBY0K8fjrm1Fp4
         smCA==
X-Forwarded-Encrypted: i=1; AJvYcCUOYRcGlUNpzyb10C3KX24mSt0RyXbi0T20xwrjy9I9UWONMvnpqxBbH1hxhar99wew38K/gmGJhkxm6MaUnxB0@vger.kernel.org
X-Gm-Message-State: AOJu0YyX8GjXfL6Y86pVeYKSOclgXm+pNbxFaz3+ckfzu8d4jk+SGi4N
	1WUFxRVmYtyRRj3IBH+uqGRlIqvAniXVqPQxwnldFB22BnXLJTFEytY/Ai4zkpnpYuPLwi2Qn8e
	OvEKRxwS5nKKSjekcve6Q9XuwUHnPTO4=
X-Gm-Gg: ASbGncun2VjiGRS2a/EXYZJXQqAfd6tmDZvEWXYa3+Fq+SEUQJu4c/a4oE5EPSQFOAf
	3ytNIUsIw3WD9zdeqLIuvAuX2WdHRKRz4tAaXLs/OhQ6Awevhz5kQwqsZEt64cU+oU2fPSi8/2E
	Xsue7StfJQOS2bkb2PtVCXRAJZoYAuTtcNA6aJAs6CMCfxJHbB8eERuxWF+Q04qISDqCjuFeCvt
	stbAhjYdb1+I2nJj+mySRM+lnUvS5eZHSOd
X-Google-Smtp-Source: AGHT+IGkUgFKopsVCvKH/I4NVsJnRweFemKrfKJemNsyC+3rmEF/RNRSqYb65QnzlOCE75UW6MFYdTLXvs3rT8z5p6M=
X-Received: by 2002:a17:903:24e:b0:267:e3af:ae38 with SMTP id
 d9443c01a7336-269ba4643bcmr39630535ad.24.1758270199791; Fri, 19 Sep 2025
 01:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
 <20250918-imx_rproc_c2-v1-1-deec8183185f@nxp.com> <CAEnQRZB2ZkcRirj1SZkfbsPHyyGr5PfnCDfv+ZuMu_Mj6XKBEQ@mail.gmail.com>
 <PAXPR04MB8459216DAA827DB05BF675AA8811A@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459216DAA827DB05BF675AA8811A@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 19 Sep 2025 11:25:38 +0300
X-Gm-Features: AS18NWA2ML_75oP-q69uMA6bYWYFWGOMeEfKy11gSalmyDGfNKtTFsYUY529N_o
Message-ID: <CAEnQRZC34KuJZDcv3TLJQrOcT9NFsYtD9q5Rj6+5MUKSBub6-w@mail.gmail.com>
Subject: Re: [PATCH 1/5] remoteproc: imx_rproc: Simplify clock enable logic
 using dcfg flags
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 5:02=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi Daniel,
>
> > Subject: Re: [PATCH 1/5] remoteproc: imx_rproc: Simplify clock enable
> > logic using dcfg flags
> > > +       /* Remote core is under control of Linux or clock is not
> > > + managed by firmware */
> >
> > I see that you negate the comment from imx_rproc_clk_enable but
> > with the negation OR becomes AND.
> >
> > So, the comment should be:
> >
> > /* Handle clocks when remote core is under control of Linux AND the
> > clocks are not managed by remote side  FW */
>
> I thought this flag is clear that clk should be managed by driver.
> I will update the comment.
>
> >
> > Also, do we really need this flag?
> > Shouldn't we just make a decision based on the fact that clk is in the
> > device tree or not?
>
> From hardware perspective, there is always clk for the remote cores.
> So DT describe hardware, a clk property should be there.
>
> But NXP system firmware manages the CLK automatically, no need
> driver to do that.  So this flag is required here.


OK, makes sense. Thanks. With comment changed you can add my

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


thanks,
Daniel.
