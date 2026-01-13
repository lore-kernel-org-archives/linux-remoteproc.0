Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CE838946A
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 10:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300051; cv=none; b=f/5LbWnCw3Qc7KoH2onjo6zyEoF4RKSeGxOCMxuBshKIwgnM8T63pWYQZPiHKBRNQivusHfzRKCxT/zw4O4sVZ3SiwjYdiaUzOsPNxH2R6+2X3QNyybQYH8Q5OLYtOU4ef66A/UMOnCy0Uq6FpKA5rJR8xBBVuD+ceCYkccXpP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300051; c=relaxed/simple;
	bh=j9j/FxY93W6EebNy78ig35wmDS4XaSkKhbvzGGptDpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlEpbA70bgXSj5cWvxGFE4+5LzNRdd7f/accx/T2c0nw3ueIiyvloyFFiBnkYJ5oEKL3JaBT6H9Kj2fSCCsyN+sBDJgOjUcl6+A1Bp9ppfmNHQB/RAtSgxArZ2qH1GWMaM4AQMoscetSsrSByaaQvfVFBFDoX7G4gSBu9IGHxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJnlgFyE; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJnlgFyE"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-11df4458a85so9985344c88.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 02:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300049; x=1768904849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW2RV5GZiteOIDgKP3C/DU2CD20lK7usX0CbcTmS+0w=;
        b=SJnlgFyEyVhQEz5chy4pd9YrYFQBsyq/JojEN3qInX9tOQDALwTgDgmLgy2UFaqeFO
         TznNDdAzvcc+zA/cAHRlescexR9sllBMB3k1U1Jk2rc7lO813qXEWJbTHswnuLb51kTS
         yDtLXLnzUB3bOX07tDXAtLjec/fsHtRXryjHrX7GS1oW6/0zjdzvs3s4w3pz2tAlM/6Z
         6ix2+nfnPjQs/nIeKx5YkrdWKiPD612CwwjXrRHvray7nS0HRIyArlna+KPqec1+LPAE
         AyZhdnh5NuO3P5jS/kMK3oSn7q2286KcnTZwf4UPOe/YN8Iyc8lZh3wigpp9BAS84u0G
         nWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300049; x=1768904849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wW2RV5GZiteOIDgKP3C/DU2CD20lK7usX0CbcTmS+0w=;
        b=irK8pzUam+8sbPDx/ONftQ0R/LK9SwKTLdXYopLh7AugPLY9eDvg7yD0X9BETIZeby
         qOlC3I3qJkRzulpVAWFyWsKbFcgt3s97JaeaMKORAKHhg4ntTTxlSIkBK94he9HB22tL
         oAizDQ3gaCve/ghfVBG038P1I/kfWMvCGp+PrmM7GerluTA+8QRFVuDnuyvkd1k68fn6
         OLw2AJv7+ZjHDGY+ex21qF6cNqi5k0T7UUr6z7ci435LVOfw661t/bIDJEWE6kv0ZdAX
         XSTUFhit7Ncbq3DGODIrnGzgUJS5e17uUG98F9HO1J4KQpxCf+jFSAPmm6A04PzuDJ2f
         592A==
X-Forwarded-Encrypted: i=1; AJvYcCVtYucKqN24wCILoOm5bnARX4COuPjhveR5sXpVAatT0FAiWh1yldU54viDPUb43uSunQ+5OzbHHCLZOlg+ckck@vger.kernel.org
X-Gm-Message-State: AOJu0YyM6JElH/IikLcqzmjsGo/edDPeUK87PvmPtbpm25+yJaRpO534
	GG/jYYkwRcmy3jIzWJgX2giu+S9Qmrrdl7q/JNvw1zlWTwSwgMSJlqsNRM1koXoXkiyfX9F229J
	R4u0yFSqjwpp0oVxzdA1UzizBMDTYMuY=
X-Gm-Gg: AY/fxX5MLKJjbfshee1GYewpQ78tuAmOmC+Sx2tARcRArWknTqZD/uw/W/ZewOwbmUe
	RL5Dj6x4ReS2YLb4qWTtMQC5aRvyITLrX74JrcXCnDiyw1is53lFpeysJnVGarGD52eOvkAu1l6
	ptiw4orcJrzZH0d/Zw6OVq4LaEMCuu1hunG0BNAhyOgXMSe1sOuBwMHyqHUsX7KDU7KvN3/G8TN
	S3S2zcm1d/4/so3AyJtHUHO6mIaSm2HOM2+KiwGgwFCpv6wCAVaeYjVrwfPxlmOh/Im547uUblT
	csCMrlTdeg5uurZ3Lf4A8Q3y+eHZD9Gx4DhLuwzexiHtKk22O9+QpanYeFLDQW2nF2HHAyR1XJ2
	oUg/M1OCqke7wSdUgfoSy
X-Google-Smtp-Source: AGHT+IGfZnTOvyA+GnXypmSKKp8ss0rUr7qVhUutqVZTtjEFsV9r1oGBsX3My8UCe04SYXGn8hA8XADTEg/VbdC5KTM=
X-Received: by 2002:a05:7022:621:b0:122:9d:bd43 with SMTP id
 a92af1059eb24-122009dc38cmr17343117c88.19.1768300048919; Tue, 13 Jan 2026
 02:27:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com> <20260109-imx95-rproc-2026-1-8-v6-5-d2fefb36263d@nxp.com>
In-Reply-To: <20260109-imx95-rproc-2026-1-8-v6-5-d2fefb36263d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 12:29:58 +0200
X-Gm-Features: AZwV_Qhqne5fRPBq_W-RkiEIzWVDm8CQPMcCvVpNRV8tzXEGjqNR0mdGDlyatAc
Message-ID: <CAEnQRZDjfyrcMj5ykvAQX1RzTMBCj-EaiM8SSKePb=6FyG+1cg@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] remoteproc: imx_rproc: Add support for System
 Manager CPU API
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 2:16=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> When the System Manager configuration places the M7 core in the same
> Logical Machine(LM) as the A55 cores (M7 LM ID equals A55 LM ID), Linux
> can control M7 using the CPU protocol API. For more details, see the
> previous patch that adds LMM API support.
>
> Changes include:
> - Introduce imx_rproc_ops_sm_cpu for CPU API operations.
> - Reuse imx_rproc_sm_detect_mode to detect shared LM and set priv->ops to
>   imx_rproc_ops_sm_cpu.
> - Implement imx_rproc_sm_cpu_{start,stop} to handle M7 start and stop.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
