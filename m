Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28AB2877F1;
	Mon, 16 Jun 2025 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080628; cv=none; b=tV0sAw9MFKoCyiBWhHI3nG10pJKcJIz7MapgCAt+tXM9z16NouP2ZohwKoQ5inZsh0QozCE141NlTt36rYxanCeqWdA7JeNS3Slu1EnIQX9ksVkQrIWVkB178xVVW/kvXhiXkQTGFpsajGfiNDkS/HmAPLETk4SkaCrXhIDu6G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080628; c=relaxed/simple;
	bh=eSGM/kHiThLG0+4KJzd+4iN5W6WU/gNP8I5Ybs3fFmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWSKBFxoPvT01+cKXUNZ2Zt7Fm8fAaPqcAlycJcRISJUsPDLQJy86gxdoTBM0UR2Fvl24an8BFEJlOJ5y3PP/o93OYBCsRHjuNMDrkp9fbFyJJ/5HYMuTCKuAXi2+44BD88FTwJaBYz0rUg0vV6oqoh3XS6HW94EJeoy2JI+WU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd38/hnG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd38/hnG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2351227b098so36000105ad.2;
        Mon, 16 Jun 2025 06:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750080626; x=1750685426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0hEZwGp1ZWclkFU1+i1qSi3AaZ5vIDWkPqR7hw0AQY=;
        b=nd38/hnGbIgXuAnBMzEMtgM3u11yP9WGa1QlDSlfz4Cw0cuewS+eliFIag06GjKWsT
         dWHMxr3LtmnVWSUAD0nzWLeWNLIsYp2aLxeaUJVaLeXbjXMCTnsJAeMQ9Tah8zZgeQAU
         6GFXl9Y4uLhch/+4aVyVoLz1lmNDmmKDqL5UPJJNW4L170V+xWeIsBVt9F5lemAa8Hf7
         eQZDLylC6DRQcVXLbG7Xk7G8QGxR6CHzgcCfZqynh6CQJZjo/ffLCx8W1cbIfKldT6JH
         hddbLdMsN1yO1DClZoXo7INTiHDOpwZuvoa579vlanYvxgXL8BnFwcpQVug6nAQMptqk
         xQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080626; x=1750685426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0hEZwGp1ZWclkFU1+i1qSi3AaZ5vIDWkPqR7hw0AQY=;
        b=WvVHgSeqXzlI5vTO+vUVC7TANnazP8k/oF1Z2zpp99w6uVD0hN2M7lR9KZnwyjxque
         OIcxsJJ2F79lLm7qkxoN8OHjdl9u1v6m6t77jguezvHpvy9zkcyPOdNhuT6RFtUoUG70
         GBOJ3KZFJNkhAnDoxNSBw4UMmeojBS3pDFSGDDkI0PBKu8Ia9QY8GXuLKGc+6wszxIZE
         3+GUyrzDvmtEiWS64vmKtvDjurEImCbxTSY0RXo1EiG1Mj5bw8TTh8tHKFWjbG9Cp/Ho
         2j8GLfb6u5HSsihYWgdmFU/jS2R4H0yZAxgL4RavNTMN6TNcLl10GKoWbPmre+gLhFap
         syDA==
X-Forwarded-Encrypted: i=1; AJvYcCVhCesORbqLDcGrJIP2pzUyvXuDtz9ySD4I0SZyyoS8fQQsumel7udaQBDZPUPzRJWRYMiJztSEw52R@vger.kernel.org, AJvYcCVq9z/LPEUvGrOL/NPCNQtxNoaOE5+KMAYBbPOjs31SaLYRE16e+xTKqHxKy3rHSGF3Q1W8CTLHc9EkAOVh@vger.kernel.org, AJvYcCXSiTXBEKr89ymkBI5y7kUuY6jPmmTl9uvAdc9fUbp0CwD0m6eRwIID9F+T47jpBK5vAr+no4wvVOY9YWBxZvaNvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs+Ks53YpL3QdBXZXLLKU3QN1vHChVQtIGWrhDv5LlmDxR5Fh7
	vQSvBdsmC+oreNsM5SMinxKpcJIRZUYmHBbk7qqQJ2lR5HIgDjZSrMU6pKwTVBI3s2Im/vxT8CY
	78G98i+JF7lSLt6LuMH+U+ZriXrN993Y=
X-Gm-Gg: ASbGncvXjtPksqEqtDo4aSq1aJRbQnQJ9ayserr9Dr+I5TwYbET5UojCJ7grFI0DSeY
	cQuJrhF3R63/P5P89jKjWRPYglCmlQHooMXJTKD64lsUW7eQn0kBeIT0KtZ5027/UPPRIgihpzL
	KyowTGI06hAUxsSICiitQs1nMX/V/IHB1tqZkOH53E
X-Google-Smtp-Source: AGHT+IHrnOe9BgEaf7IB6cKO8/zukFqN2HZ5IAYeo7rZcnUwyz06zgXtx6or4FKsocwZQxMzpq7RhmfRl7nR3WTEeSU=
X-Received: by 2002:a17:903:228a:b0:235:1962:1bf4 with SMTP id
 d9443c01a7336-2366b32ce3amr144470995ad.14.1750080625607; Mon, 16 Jun 2025
 06:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com> <20250606-imx95-rproc-1-v2-2-a2bd64438be9@nxp.com>
In-Reply-To: <20250606-imx95-rproc-1-v2-2-a2bd64438be9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Jun 2025 16:32:27 +0300
X-Gm-Features: AX0GCFsogmtArdg5rIwFR58rkkFYwbGckSH0KHSur5wUDe92Y-KCqAhSavVUQsU
Message-ID: <CAEnQRZCq45wzoDLd=_vPn8cNkiVrbYrg5LJwbZUSdRndRn_U_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 4:57=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> There are three cases for M7:
>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
>  (2) M7 in a separate Logical Machine that Linux can control it using
>      LMM protocol
>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
>      using CPU protocol
>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
>    has System Manager.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(got
>    from DTB), if same, use CPU protocol to start/stop. Otherwise, use
>    LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
>
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
