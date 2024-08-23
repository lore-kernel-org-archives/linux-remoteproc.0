Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2363142E76;
	Fri, 23 Aug 2024 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724400695; cv=none; b=bUi0jRmzEcpcCPc786INGo+bHlUickUZQ5iRWg92oopoYo93nundg4pu5rRE/oD/eE+P2EzKxRxSrm7RRhyFNM+WFGNMsRheROnMjJnuMxaKrnRuRlv7Jm1JWhZeF0m9QQyRise/IBhGwP6I0jA2YPh8JGO0ERYa892yAdexLTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724400695; c=relaxed/simple;
	bh=VhHPy1791sBAtIkxnc0cQsBzjzb0bd38en4YIw5aT9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZ3II2fTrPDQNr4BOxphzEqvt7WlfUpDxeFvILwjctMcmpfOCtStfMnRSDK6USY6d6Bxtvh1XhUU1n6BOrTMgpM100g8cg8Q54WwPkeWCvez1u3mFmZJOsnAzJkPQnaPSRqWBgj6iU5b3ZllH7yeyyXLI9HogkHn8InndUDZ/bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQ/JGAJD; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQ/JGAJD"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5becfd14353so1991790a12.1;
        Fri, 23 Aug 2024 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724400692; x=1725005492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhHPy1791sBAtIkxnc0cQsBzjzb0bd38en4YIw5aT9o=;
        b=mQ/JGAJDtxFNnBo+6XAW6mAdfZ017A4vfQlECJn0vfMO7lJfHlBd5X6naYpQ8g6ArB
         QQKgsQcTjL4zWtqQy9fixfqllxgjy2U+qjnh4jBRj8RGcZDoFqt08ZtlKh6l8Uby7jqy
         cslKyuYhy82kAxfyZgp0GRhSkyEaFK90eEKvqbOFNOzNZ+/D/u3ET+xTd55Uo1Hd/cx/
         PvHRMGBepWdcI9+rHkoXZXHeB0fxBjHXsLMGOI82v8ypMhF2+M/I1ouSGXRvto3Bm60+
         lcTr2t6Za8QeK8dRxZR1blZ3qcKMf6Pw8Nrgll3iMnrNoIZ8rLGlM61UbaHQC1wjnl78
         VwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724400692; x=1725005492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhHPy1791sBAtIkxnc0cQsBzjzb0bd38en4YIw5aT9o=;
        b=mhbW1FvUrlO7E4KjItjiOnLeYFfIROs8axYjqGcRF4S6JgOqGkUCgSWnPIWs9dl3NM
         CBZy9e6Xpqs0jB2fXoc0tPN6KCH0+8OP8LZs189hzqqm8Qn7Sibb6EPRmQ9Ma7v+9wNZ
         ez6mXpdKV+CtYQaaT0JTFkU/TD4CSWbCTRCgNWtkoJTo0AmrOazankksMNs4GnPEQ0G/
         Nk1a/zmLUfRZ5jVExmSmXbAGnSgjlGH1WRLayGY6o/hy3GAzAh8TdmtUAsOuvg+1WMr5
         ZVyF78HiMhOJPYEMtF/O/CKWO0qdRO2+qQCVshNcWlvx9bvXtiattDR20aY2rvUwR4wG
         esPA==
X-Forwarded-Encrypted: i=1; AJvYcCUmF10vO1htZGV0bcZ7sinJOwuH1Qbx/kVQ6TbmL97sj7vfd81qct0tjPiNBrTSwZ2Vln0D2FS9ZPP7DSQ=@vger.kernel.org, AJvYcCUvXgL/MJ7ry0yVVJDmFfFpPBcPoOAjtkOcjwHW+GiWwvIDP2/IrSb/b+6Ax9KFhrMOmI/S+StsyVfLQTzbBVZp3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys8eW0nJjdmEVUHyR4sf5eomBlLjMqGO4CE+Tqm3murgQ/x+bT
	vrlCdxqt108LtxguM3nEp0jUPGKx66Ee3foAqMggz8Jy3VyEEexmPX/PSNrYbArp4fQJYOSSgWY
	xWKiq6P/h8SVIEQaf08zBCMLUDVzTZg==
X-Google-Smtp-Source: AGHT+IHFfyUv0ZEnCDnC4iFFwHVQ8zCLg2njN2QqtDJKhkZx735DkXAfXdqtX62YUB5hiMm9blrR4h2+RXFEYRQA6SQ=
X-Received: by 2002:a05:6402:2110:b0:5bb:9ae0:4a48 with SMTP id
 4fb4d7f45d1cf-5c089158dabmr854262a12.5.1724400691451; Fri, 23 Aug 2024
 01:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822-imx_rproc-v3-0-6d943723945d@nxp.com> <20240822-imx_rproc-v3-2-6d943723945d@nxp.com>
In-Reply-To: <20240822-imx_rproc-v3-2-6d943723945d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 23 Aug 2024 11:12:20 +0300
Message-ID: <CAEnQRZD8sEAZ94W3qawxgb=31C-XGGg29L9WRKmdzqjYkxT6uQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] remoteproc: imx_rproc: Add support for poweroff
 and reboot
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 4:40=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> On some NXP platforms (e.g i.MX7ULP) the poweroff and reboot operations
> are done via a separate remote core.
>
> Typically Linux needs to send a message to the remote core and requests
> for poweroff or reboot.
>
> By default the communication between Linux core and the remote core is
> is done via a blocking mailbox mechanism but Linux doesn't allow blocking
> operations in the system off (reboot, power off) handlers.
>
> So, we need to make sure the mailbox message send operations do not block
> for this specific operations. Fortunately, Linux allows us to register
> handlers that are called in preparation of the system off operations.
>
> Thus, before carrying the power off or reboot preparations, just destroy
> the existing mailboxes and create them as non-blocking.
>
> Note that power off and restart are totally different operations and are
> not complementary.
>
> We introduce a new flag in the imx remoteproc per device data which tells
> us when a device needs this special setup. For now, only imx7ulp needs it=
.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
