Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143FD2882CD
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Dec 2025 14:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289269; cv=none; b=ZGVOeZHQAK99Hzq8CAJ/hdClDbrIvLiStbTWM46nkmj1llrsKq1SQZp+ugxoNUaiZzyX+staVxMEpBPFIkaWwGRXUbpTraOuASAbxLcNj/Y3jaxgJ7gpZOQ8AqDNrBCUPGXn8s8ngrntJ1vA5tUqaSbherFNs3mIV+j5XnZ56KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289269; c=relaxed/simple;
	bh=Dmc9rdVFoScFVpQrBHs8ADdcFVIv2yXnxYpPhE8hk44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4cIM181TPYGpiKzewALpcZ+2lBwjtUJfS/kGfq7MVgI8tJpJ6Valf1ZSYBiWh5Oa5b3ZNl+eW1jYt8JH76w8DEZTZHlIjSHCg8JYdEnZQwwZyDN+DWX7OJ8/MR6D1BYxly1yDxpr6q45orPHbEdClFmavns+wsDwNfSdTNsNxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jp+cdQuU; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jp+cdQuU"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso6168555b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 06:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289267; x=1765894067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dmc9rdVFoScFVpQrBHs8ADdcFVIv2yXnxYpPhE8hk44=;
        b=Jp+cdQuUL/HoGM7mJxEPFPbpUP1Ksls2Eb3XFInYbovBXfbg1j9lyZUzg5grZh1VyV
         QUpeFUVI+p5XyxS8KjJaOV27dsJUZ8ffcHp69PMLV4ZNAmPodynU+OK7MDpUnTaasPTo
         tJg0Sx7XWsoF8n43JqCkhyk46DVldZ3q9rQ5696i4Mqz/wsz2u8LrLwdY+e073tKK4f3
         k8Bz5cB+iizV5d2JkYiLeQQ+nvw4BsSgy1LhOXYaBtsx/TqT2VCgqd9rvtM35S5mJWSM
         /TOgLlYAxUH03vQv1hVxaZ15GRGMGK7pPf40nbVm/w8Nk5zL8peMJuu6h9iUZuDEh/No
         wzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289267; x=1765894067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dmc9rdVFoScFVpQrBHs8ADdcFVIv2yXnxYpPhE8hk44=;
        b=hCnT4/urkHdHrWD1NzPWph5HVvZj0QleUoAJcH/xwWIADBpK5qyj2IoxRRnmFblCXw
         N9NvmP1lIiXC7s/jzaE/bn7rbhUsHx/3dxD+luAC7mW3RFNweSEM7IE+vRHnaYdpzmY7
         apZNdX1AI/QgWlsr2Wgg+rvfs443W7Nin+R3gp3IIEe0JUPXSieWzL7lmLmLn4ncb7MM
         vZ9iwYyOBTrdWqpx1vQs7Pb4JqQ5uNrrmmH3nqfSu84EVgVTQeL368HvdMX9nu0W1HTL
         IEZ5t8eVeX0H50KNhz8uMMTeC9vo9xJYkxYi6DndqMH3dwl+eYUgn8H/gkmagcK3FyVz
         EgrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD2g7Ri7Xro30plAX31jqlSuzPRaZgu9MYm05XIhO8nT7Y3bxyrjDLxxCOEwKcE/0KbO9V+jUQqoCUT1Z+sAlw@vger.kernel.org
X-Gm-Message-State: AOJu0YxnRm2EfkfcnasNG1aqqmLbQqyhfoe7aDGUtioCxM8GpFApfbZf
	xaSNKrsZiSmlLGiOEl3eIgN1hGiozEAKM3L7r5cdPUzupYxP2RORQeRhCUvxFEpihBuK7hmLUSK
	KsQqoy4qnQ8RVzbrKKfN5W+99Uvnj7eM=
X-Gm-Gg: ASbGncvhPtI3BBVcF9q59eX/wtCMOG/+lOZnMWKreXv1/PtCR4ouC4H+SInXeQKBzLI
	Ph5BHi/Vv+FcIOmJMouUPtdrgHsLv6aeNudFgwfgAh09Ry/ySNxU5vWDbpuHfcOfbbCzsFQ5xas
	74/C4Gd7gykUJu19ORKoJPAOIsJ3NUfK+hWU1hs8dGiFE5UUsaesC68ulHHCV3wW1YScsPZPwST
	wI6eGWvsEw7/GhCTIvli5LjoSwcUMu+ewJ3p0zuzcwHg991JsHh9X4dOHPKU/fryeqE6TThsPKl
	nAM/101rac5KOSoBR4dDPv+Fw9dtm1pf/nJb/iSP/Zyt60bHkntW0qECYMYKlD3n/rqjRoi9WgP
	RDA8of6V6rg==
X-Google-Smtp-Source: AGHT+IE/MNNz7wtG6bh2UZGMnD/oVNJ1TejvyJsrOq0p5iLxtYXVZCkZRmEenluo/ZYsAAS0ErkexZjLZxTzyvUOaTk=
X-Received: by 2002:a05:7022:a92:b0:11b:9386:a3ca with SMTP id
 a92af1059eb24-11e032d8b05mr7860628c88.43.1765289267225; Tue, 09 Dec 2025
 06:07:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com> <20251204122825.756106-2-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20251204122825.756106-2-iuliana.prodan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:10:13 +0200
X-Gm-Features: AQt7F2pD3HTByIx6cmrNP1lp33kbo_jsvfA1vDQn-Zm1XLkckJBpR0yk-Ns6YM0
Message-ID: <CAEnQRZAWAJ03u9LP33MXizJB6Rso+nL2FvRSKZE0Hx4o9ak+Uw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_dsp_rproc: Rename macro to reflect
 multiple contexts
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 2:29=E2=80=AFPM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> Rename WAIT_FW_READY to WAIT_FW_CONFIRMATION and FEATURE_DONT_WAIT_FW_REA=
DY
> to FEATURE_SKIP_FW_CONFIRMATION. This way, the term CONFIRMATION covers:
> - waiting for firmware to confirm it is ready to start;
> - waiting for any other confirmation from firmware.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
