Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875501C8631
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Nov 2025 08:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762329879; cv=none; b=MuDQqtKbQvV3HuPH7uVkfyy7N3+q7f/RyXPIFSi7/tiTihgmaE8+zKhYg+bD2LcAa2s2acx4YSOENzYSOSMXfbKchUg26yA7J+BgrcL2t184bG36V7CYQDKpU9/RhNrupl5HxdJdcrn62EORZqWqhDDQU3gviRvAw0WRndMF37M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762329879; c=relaxed/simple;
	bh=LsTjAm09M/yGM5svcRs8AIkfB2f/URAn2Y/ln47haPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BzUQgr3aLvsKJfxBgB0SH83LDmhIr4Hqk7RH75B/oTWYmb7Z8adBJ+FkuSOLD1TY4XUbL6k52+nlDLKyHxqUVydhiNC0x43avd0E+zF3tiwL0vTKdjF4rwwEbKzj4vrIuOMF00xuUvNr77ZkM4gf4onLZnOTy5jzRfjjKi/NnTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQTA1yDQ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQTA1yDQ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3418ac74bffso976087a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Nov 2025 00:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762329877; x=1762934677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDe6kRSygVEphf3RSRGt9HkF/eyEhvziT45X27VBXsM=;
        b=SQTA1yDQURc4KmPIgZSpUjvkM/w8kK/AL+NAd3a+3FyoHZ7MG4JHelmoMB3lzar3Rs
         slXHx9aLOYeu927i8hsKL8gLgT3Q9+53k/B4Z8zdDGYQNpvm3ueG89r+OeQFtH4AkCMb
         LLNnsTNAiK/34gqKGoVLBEQ+hj02mlqmgD4XK/RoR+QoqqQ1GQ9CvbYG3PJkphKuw6R0
         2piOgVOjg8gXcWaHpxemgl0jHh/29DVweisrn5FbTIjxeLymJK0/UwPpKgYNQpKNolqe
         O94iL/zVwkTjaFzEfjMv5frjtn2ubkh89p+QFaRG5ZiO1shJqt+TfQRP/lbC+NE3hXQc
         gaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762329877; x=1762934677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDe6kRSygVEphf3RSRGt9HkF/eyEhvziT45X27VBXsM=;
        b=uhqS0Pv6dJt2wYSIV5LHAGRKoui0rrax4jLegOsV5LU3TD16jctfoeCPKjdC96lL/G
         Moiz6cpgOLZW6RaKNRDeiLULMHczRg6JM0KjXRlN93n5xD74fEFg40jqxOzZWZI0YTtj
         WDzhXAKn07oZQgmrCAft1CGWOgIMQTlQsARkyjG20JvwbWKTfCyeHPvq+oLxxYMkJ/Yo
         PF16v2Kqp9/yUNUdCpwbg8JU/E0/pstPO+/AyDv7aKPcLSq1hjGnLU7KuwXWAeznRCdY
         On819q1g2WVedHxPAS4MphWwIQ/j6Ve3TMEpSFZT/cKGsBn2olh4QlHGRUZSXpzoGEa8
         u3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUpCgobu570s6bg9TONWJSEHU1UPr8TZ+/yV4nah5swxNHWtSwYbM02VTyRrfImPITsoipYhVPfpU4kGmWzUfbM@vger.kernel.org
X-Gm-Message-State: AOJu0YygslSuXXd5+NreAIU0uLUCdD2FcF8/HoQDMyDbUrsQ4F2Tw6vS
	kFD4tb49WEbI2n61aU5br3CxtVBHyUSqRtAZrJLGvhe8qhWrRWY8crS31TZSbbZW6xEhsbml/gz
	kB3jtUBhaHzb/5Td9tQtLm8U+owt8k24=
X-Gm-Gg: ASbGncvzFoufoJSKlVJetlTtqS/8QNyPdB+yfopMXEkzG5hotZFvm58tbdG7sKa9YMe
	tGllWlvu0c5Gi3kH+yvbjpVcRmMu0DWGeiRmHtpulM83CD0PvmjktCpkQrDGhdDYWDwU4zH0tev
	UX28iOerXXpUBPuAPW5kAt4JNhrFkEa9ZvktqcBzYAORT1PVhzFUrfLI1Fy81u330CEU69FtJhm
	IsQSZe4Q0cQxY5fA8O2ijl/nvbFQb9ZnH6bB3TJyDpxDaA2qhosSsZ8PM98C8JteZ++4vw=
X-Google-Smtp-Source: AGHT+IE3kiYdO6A81tH3ocwujCNPCljvOzypJY9CyERGKSeoHzPi5nZ+xfnpKr+voNC9lIaFIPYuRWd+eHWQF6ZoNDQ=
X-Received: by 2002:a17:90b:582e:b0:32e:6fae:ba52 with SMTP id
 98e67ed59e1d1-341a6c1e406mr2591161a91.6.1762329876771; Wed, 05 Nov 2025
 00:04:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 5 Nov 2025 16:04:23 +0800
X-Gm-Features: AWmQ_bka9Xr4B-LvpKHRbIbtt5BkAdNQKoTwEnWv8Ppu3FZE5Ou4N-m9M6c5JNE
Message-ID: <CAA+D8AMgXCcQuH3SWh2UU5ib0h3EqdJOdXTkwyFx4duv7qL2Ug@mail.gmail.com>
Subject: Re: [PATCH 00/11] remoteproc: imx_dsp_rproc: Refactor to use new ops
 and remove switch-case logic
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 5:14=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> This patchset aligns imx_dsp_rproc with the cleanup and modernization
> previously applied to imx_rproc.c. The goal is to simplify the driver by
> transitioning to the new ops-based method, eliminating the legacy
> switch-case logic for a cleaner and more maintainable design.
>
> Patches 1=E2=80=935: General cleanup, including code simplification and a=
doption
>              of the devres API.
> Patches 6=E2=80=9310: Transition to the new ops-based approach, removing =
the
>               switch-case structure.
> Patch 11: Remove the obsolete enum imx_rproc_method.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Best regards
Shengjiu wang
> ---
> Peng Fan (11):
>       remoteproc: imx_dsp_rproc: simplify power domain attach and error h=
andling
>       remoteproc: imx_dsp_rproc: Use devm_rproc_add() helper
>       remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable() helper
>       remoteproc: imx_dsp_rproc: Use dev_err_probe() for firmware and mod=
e errors
>       remoteproc: imx_dsp_rproc: Drop extra space
>       remoteproc: imx_dsp_rproc: Use start/stop/detect_mode ops from imx_=
rproc_dcfg
>       remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg closer to imx_ds=
p_rproc_of_match
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO switch case
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_SCU_API switch case
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_RESET_CONTROLLER swit=
ch case
>       remoteproc: imx_rproc: Remove enum imx_rproc_method
>
>  drivers/remoteproc/imx_dsp_rproc.c | 344 ++++++++++++++++++++-----------=
------
>  drivers/remoteproc/imx_rproc.h     |  14 --
>  2 files changed, 184 insertions(+), 174 deletions(-)
> ---
> base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
> change-id: 20251031-imx-dsp-2025-10-31-260b2b979258
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
>
