Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FC02D9794;
	Wed,  3 Sep 2025 07:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884002; cv=none; b=ocLa7aWFgcU3TLwrV8N6gmHppCbIkQ1JzP9hSil1X+pb9k90xZkjcsqpQ1ATvDxknknzDqe6DXlzGMj1JEtqkqZAJ2hoOL3T0WaTPvVxqvBnCKyMfjJdB85+qGOtZLmSE1+rTH10VhdBH5roms9r7env+M5gm+Z9sYDoUQBgca0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884002; c=relaxed/simple;
	bh=En2W+hPUiVIc0l1BQLH8vAPb/+q7zcp7yOavO//Np4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J53mxx17ZCr/fubP31d8X29wc+8Z27QqalVcLt7BmVdAn/Ku+dWMvxnAJdtlojSvlvqdOUB/6DrekTnI96Ew2clHPzcdIhj3hj7b1YgHtmd9zVMeJFcAFlfF7qd+OKD0t40o1+6UGA2m84MPRLsIlUft/J5aS87YW++H/147cE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=addAQqvI; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="addAQqvI"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32326e2f0b3so4812982a91.2;
        Wed, 03 Sep 2025 00:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756884000; x=1757488800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=En2W+hPUiVIc0l1BQLH8vAPb/+q7zcp7yOavO//Np4Q=;
        b=addAQqvIsti92eEBnTB1vTy62JfEQsBaWuWYCY+Gkv+uYO1/THDo3AC0t9kBaVggy4
         ISiFk3ltXEhol7OEyYgYSC76FWg+e2XBniNGGrHJO35A6AvKVIBimeYaDMSDkeEnUbB6
         0GYZLLqXmNBx+f2IOR2Tknk4613ANG0BVqO/jDoBI+nPrM3hmyYtOZiVBAmWTERlcbkp
         jSzsZQ196irF73wB5nKHRqobb9fVXHPAu76D8YiExh/DpKtEbvuB8h5bFaryrT2LpLlj
         itp5d+qBZY7dZD2nGzdysRunk7qVNaUnvHXmzVqmuBXz0OiNizt1tLGvlrl2zS4co6X/
         rt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884000; x=1757488800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=En2W+hPUiVIc0l1BQLH8vAPb/+q7zcp7yOavO//Np4Q=;
        b=YRoc7hyChXY4gdx/sCk7/IW38xdKyfwehwYiz0SGXeoQGXYlrU+obxPITLXzq9iIsK
         EHj7FnNrfqrWQa6RFa8Q8eh7is+5ZBR6BHNQf1EWXSRzCWBhBN11Y++ICsQt4J6kKD4s
         6Cq+Cm9Vc330F5XW6FNqQUiJVZL7VYkkMpP6OZHlSKBS3/r/Uyx+LREgMgTaRIaJUeZf
         E43D4pMEWicZVaeagfbg9CfAoKT63jDdgIckV0wvOkQ4S/VvgmBCx/mE4YhQ6Aw4208x
         L5N9daTaBYyoiAwZMDCUAHnbad2JguaoUqZnWtPFATpe0P2gjLnM8aLsujduu0RRoBQ4
         InPA==
X-Forwarded-Encrypted: i=1; AJvYcCUMDtv5T+S6zHaFWyY8LuGrna5JM1XNPRcGDNWNiwYRiKyL2WoSRyl27NDCEWxToC9H1XliF3lPU2ls3UWa@vger.kernel.org, AJvYcCWsln1FqEY3xGTYIJNrJFWDRCYiHcusnZsDE/Ec3ZSO30IQp2DUwIOt2gNcEBE3ZKydzGtcfIAlPTk25HYh6o0Jew==@vger.kernel.org, AJvYcCXBr37cfB2+vFFZpXNFPJPBDEZmA39q6TJ/KT8KYbIAE/MBYLn94za94YO2CAoawGqjcq04s9dD/UpI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn0kEeMlUT5snLR7LgHfF1Mxl6u71LObUio85C4UBrd/HD3otQ
	HFpiOeE5NcixQKFqQ43IQSDol2K9+wzGcUQDtJf1XWbQGsTVPyBf9OJlD0JLAcwOFq0OnPbDfQo
	zL+8bKDBWfbpvE9WeJGRg2J7gpUg5Ssw=
X-Gm-Gg: ASbGncvXFEg7vOqnpa+6u/LgBaBV3kPW0qgPw2HBHyelWUIbCtlMQgyApPjwyJxetO9
	YxQ4qPEwQmLnjKBKlwPCVJH4btkZeuP0gJhJBMC6RSSYnv4hWjsRFWUZMmOZxlQO50x8jLhDl+Q
	78qByFcOWFPVPw06bf/mtvzL3SWJe0035p5d/IGOCyWVfqEKabOKAADrnkj6m9fC3r4MOoc6wBc
	0xECx051CgAwf95/w0/w4t/5wVyLTdsPe4o
X-Google-Smtp-Source: AGHT+IFgXEs9NteFHdZr1OCmOw5SCukuxyKq+mxKrX1PC589u8zK1b13OsCdHiT3Ob0jVHFeDF/+Ra11+ZAP+EwLTBM=
X-Received: by 2002:a17:90b:5190:b0:324:ece9:6afb with SMTP id
 98e67ed59e1d1-3281541225emr18498018a91.3.1756884000281; Wed, 03 Sep 2025
 00:20:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com> <aLHOhKpAQbVCC76-@p14s>
 <20250830125208.GA22718@nxa18884-linux.ap.freescale.net> <aLcdmY-gqd5cFOYc@p14s>
 <20250903045611.GA8860@nxa18884-linux.ap.freescale.net> <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 3 Sep 2025 10:22:14 +0300
X-Gm-Features: Ac12FXxuv1frbjT6JpqFVSJ0lAsIa-N1aZl19LOvbbQz194JtJV08sWoT5Y27zE
Message-ID: <CAEnQRZBCxp4rT=es3fDh2w1Ut=i4u3GCnyoOFjqJEMj3CLWPWA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Peng Fan <peng.fan@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<snip>

> >Please give detailed suggestions, but not a general comment.
>
>
> @Daniel, @Frank =E2=80=94 since you've reviewed and R-b'd this patchset, =
do you
> have thoughts on the latest feedback from Mathieu? Would you agree that
> further simplification is needed, or is the current structure acceptable?=
=E2=80=9D

Peng, please trim the message when replying so that you keep only
relevant part of the text.

I think you are both right here. I understand your frustration :)
but also Mathieu's point of view is reasonable.

For a person who doesn't know the internals of IMX remoteproc the code
is a little
bit hard to understand. Peng I've given you my R-b because even if the
feels like
it is getting complicated it is still manageable and you are the
maintainer for it.

Allow me a few days to see if we can simplify the logic.

thanks,
Daniel.
