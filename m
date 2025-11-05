Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F402FD68E
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Nov 2025 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334965; cv=none; b=GOf+mXGTovJF4d8XDR+9jtAs9J4k1tHW4d+t7Lpgmue1L7De7VBUNFCha373X+HbXISkLq0vLMSm2zgNJ8heVxAumScEacGjxJm/pARzLLJr2GuvNwjQXb72/uDmnSIzBKpidSdb3Q6g9eK+PXBYI/PxBK94FPAOqOq044wNGX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334965; c=relaxed/simple;
	bh=0XgQsaPK8SkvjG5BCRqme8oV5Z9wnVFe1B2vfhJEqDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwL3qOne5Fm9xJIrdxk146kYZDEPFOguzHDxxV7t/sZgnqo78x8xatpuebZT0TfQCgFjVQ2upkX8hr5H58++zzBPPLGatzUFxBmMEz3oLMkSGLvHY7WfnDn0phql1R/7f9EP83qYX8HqYq2/fTJGLulolCBsY0KWuoLIoYE6Av4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJqI7A8L; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJqI7A8L"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so468103a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Nov 2025 01:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762334962; x=1762939762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txxoHQsD9SBr+0uAjaOafgKfJPgFXKi5Q4JCWLCgjxk=;
        b=nJqI7A8LPzJlSbQA29EphnNUto43lCTj51ndnNIF1NN/I6hrJogOdP9hdNM1weaWDD
         6jh6VUh7oJ9hrC7br6J8eCpPdLqb4J5036zW7kwCAQ9incIaayQ9+QsnsaS8hrjDxayq
         bdV6kUiR31hidRXMrftwZcGlMlwk75xqAlquUQ5XzJDJyZ/hm7Bi9Fx1wviv933BrRxD
         i6wV3p24RemznNZy5BppEiMUQfvrc0icGBcl88Jj2nERxX+f0PcOHM7Fg8b8Bp8Ys6An
         6DUu31QP4wTbF7RCVBCnoxhifgX6OgbOoxxMTx9xJQ50IYcyvDpoU1r6SaiShdltZTWv
         1bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334962; x=1762939762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txxoHQsD9SBr+0uAjaOafgKfJPgFXKi5Q4JCWLCgjxk=;
        b=REcanwXUWCgQRUy1oiygED4SFlrYX1htz0Pb1V173KsbvUFLBvXi8NHJK17huoDVsH
         Vhy3ZvhEIqOyogX02xV0jjL8zkIYcOU7EjpnEn3kurSuMmlvvcNGfNFYthUkav/uDfUM
         CxzZ7iCTDzXDRfSPTY3070CHoGbeoDJzniG/ORs6ACESLZpi8Xyu6AIBVtAPzzL94+KA
         2iiQichSiPXZORbhLChWuBmmWGFTWir2mYJvBR6Rl6PcadyfHpO5JBtVdlcCKZwWnFmN
         rA40o6MbkeEsBldsYmsBHrbcE/azKSSjstrJniVkf78pumCHzx7ZJAExXeaCaoKwYcPj
         DpWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbZEuiTTYxAXktHk7F1g+UP/MOyjqOkNY7OwpN7lX+9TDRxns1uaFYlvoUKPLJczzK4cqcm+mmKilDddd/6pIU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy24K6qDvc/x9bsTd3TKRAY25cGT82SxvpsLGGGVhttS++N5m7U
	+2ftkrDy0TutmDbMxZXGbgDcHdv8mLUjIPQ1WcmS0CCOJXEAklxTOpbj1A53TsIkKhddpz9F0xv
	aspvi0VQ+CYAFVc+dtsVkWVZBN0cq920=
X-Gm-Gg: ASbGncsqtsFH3c4VfJwj0RSHJhlPlus+eqIHCAY+xGj/o3wakCYiQ/g3LOusOMkqwK8
	U0P6ZL4qWgd5h7PEgHHHExSFf5ipSwNhjrrbf3ugtJFpw2hGYPdDsJGvYLmtSwLYK0UqKPLgPVn
	YQZzhRveM5+bAaN2hzvlQAAnecNi92bDvP/ZDheQR1+pkDkfDXob9tmmu8jfeCbGoBhyVZBHe9L
	PPxTP7QXynYME70Y+oGB6i7BMNLkQ9g051xLvH0XifbEqEKS9bYfHEY5w==
X-Google-Smtp-Source: AGHT+IGkCxRvJh3fC5yidm37chqdIHgljJdYABqu7mHMgdmlemqRQI0lkZmwfrypszqAHRlZ8j+gATWb4FCpIOGaggI=
X-Received: by 2002:a05:6a21:999f:b0:334:7e78:7030 with SMTP id
 adf61e73a8af0-34e278f99b1mr8298964637.8.1762334962544; Wed, 05 Nov 2025
 01:29:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Nov 2025 11:31:49 +0200
X-Gm-Features: AWmQ_bkrt0ospuWqleJ6w_sx1LCaBE7SCRpsPmV7R0cWe73tR0hYLHwUvfH1Zeg
Message-ID: <CAEnQRZAOTFw=sBppHTYQAdfDBuNqkqk6gVO4FyP0EBsva3Oi+Q@mail.gmail.com>
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

On Fri, Oct 31, 2025 at 11:20=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
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

Thanks Peng patchseries looks good to me.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
