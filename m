Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3D33081AC
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Sep 2025 11:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758281045; cv=none; b=e+4LbIE6H1FKYZiyyUIzVvyTVkUz2zlrEU27G9NuEyeoG2cQ3AmQd+1iCnZfjqNuHPv4m07alfIY9ZhsI186uolSLMCx8ULAvAtsk9QY52bhHe+icUOXYs1NbgLU/Cka82b9eNqa8JtQj3KKw6ldC78J4Uc+5YydfZq9kzf6xTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758281045; c=relaxed/simple;
	bh=He+6sdn61LRVIxrBafIW06DcfRvltNAdv31TV0CKGnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srcD6pdh6zv//m74w6sjhSpu4zyTz0Z+j4620DG5wNoMztOwTcov9hBxa1uwzmGmTIfxe/bdFTddRR5Me1spcYp0aEFc2kDlWc7YTR6WhUNKhKs17ZzVyU/Kv/JCBwCMHdX8xaOwHg8z091mgNrnTA067wwQvU7UghNy9coVB+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bih4EQiz; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bih4EQiz"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-32eb45ab7a0so1885932a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 19 Sep 2025 04:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758281043; x=1758885843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=He+6sdn61LRVIxrBafIW06DcfRvltNAdv31TV0CKGnQ=;
        b=bih4EQiztO9Bx7dPpi0b/+bttlK/cYJMr60EjRy4o9oqmfyWpXw2W65hYKyVh5oI6E
         nDAev63pT/tY8qfgwe06to3Y0yBm/KnFVEiPxJDNZQjU8zscE8yNamoEftuLhAnvyaNo
         JG4VNYKygdfn54iv6B33C/xEHGmZ97XQWTKjiRcJgofolEQoGaoGLNhe3kFsQCtyF1kS
         7dG5m+EGiTHm3YjgXXfN3i83rXIkxCt/Q8ZP4IFwdY4V4BHWJKnYbWqklAmearmws29K
         /ewzVUXa1Y/r8H5JHIa+QW6AYYTYF6LYeqry5y7UrhovRxm5L2CzYrt3Zk5jizIYorwu
         06Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758281043; x=1758885843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=He+6sdn61LRVIxrBafIW06DcfRvltNAdv31TV0CKGnQ=;
        b=jj6WLgm1r1pX1K5v2g0b6hVWWLzq6n1OAc0H5pHXGnoQO2yk1JM7oylf6WEaR+zVfP
         VCkU+hu+VVPhK5wkKFP50YooeuPKH9gKBrP7FMYuVG/2MrAGVqhLquvxtP4NDs0G+qVp
         +lsKR4SK71/4vYjDXCh2B8tP5qe4benc4cHwpVkjO8KtAJ92nhPeljKjBU9e2hUWPQuO
         9oJ+BPbcyXSPZqtMr+rfw8I+FoT5e1XmlRG3Q5rCNB8bIFh7wrIt5AVy3Wt5XHOe2fCf
         n4jzMXtNWn6SfNFcoi2+nIZAEAJZR8bOpV3B/0z5RJFLI0R8mZdz1mwtFGnAwM/EeuU4
         dlvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/HMT+7nwBJZanZ+q+vrnbFPeJp5ONT20uLpCThOpd6jqnGZrZ7IzpnzWILiAJJmI110LadfHnYGPLiWkTIfl2@vger.kernel.org
X-Gm-Message-State: AOJu0YxLWZnmqKGpyLR6rbP0nltN5XUp7WE/G8jgNlJzkmjDyg0otfyb
	FGY2Khtcu8owxihp82KZaOVqoTPObtYLv1N+eozuPYSC3yS5R+WJKw8Hi+OCtFDlqMD6Gns+COj
	O5XPbuJolbeDr3lxCr4Izpf/vCKkI1uI=
X-Gm-Gg: ASbGnctajivAIQSs5Ln8d3TmqWklyCk4ZfynM5BAZjrsUkPaOpVQ81D+C27w65wnj8N
	id97lTjO09PM93o2QxF8JoBjaToo93PEbnh7AWOVsQa+7Pl5PDnYZBqEAMI+7YTXnwqSb7mq9b/
	3tUppVvfvZkfOL8bKgF8WawlkEH88QU3mC77/03MIuT3Ph3hqBrA9RimaClIK74rBMJLpyxd1EN
	s6N0++YGFdRi16OCT+2dPvgC8UT8zDtK+Oc
X-Google-Smtp-Source: AGHT+IGR+j53MtR7Ycbzac1nvh8/Xsimed1/N5Ir4au4nEDEE6nsTs+zulbhVQrxaMtQaq9Cc1ET2UPKXkixOlwNUv4=
X-Received: by 2002:a17:90b:3a4f:b0:32b:d089:5c12 with SMTP id
 98e67ed59e1d1-3309838e042mr3853941a91.33.1758281042999; Fri, 19 Sep 2025
 04:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com> <20250918-imx_rproc_c2-v1-4-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-4-deec8183185f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 19 Sep 2025 14:26:19 +0300
X-Gm-Features: AS18NWCk1Oc5eecL3-ZExUWvIBIypCHeXmF72jHYDkEXM6phwnZTdZT1871xqCc
Message-ID: <CAEnQRZCByoFeuH0KyPbrt8T4pPyPwG1DBvrFQq82mD3KGPTuZQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] remoteproc: imx_rproc: Remove the assignement to method
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 2:53=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> There is no referring to the field method, it could be removed now.
>
> No functional changes.

Please mention that you are no longer require to provide .method with
imx_rproc. We are still not
removing the filed in imx_rproc_dcfg struct because is used with imx_dsp_rp=
roc.

With that,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
