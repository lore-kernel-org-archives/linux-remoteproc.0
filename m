Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EBF1F37C5;
	Tue, 29 Jul 2025 01:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753752818; cv=none; b=C7NDsxCO8m7MrPE9oEEOy/STbCQVLUB+uiyOHymhMs+0X+HJF2lruwDe+G8lPtDUz5okdEy3Lq2KIrT6a+bSL2OOe5yR9KVOZdbUD3Zy4+6IHMS7ncQzxqh5X8kvsYyLX2Tdzt/xjC2e9H6GRh6RICZ/8d9PKTWzf5XBkKoaFLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753752818; c=relaxed/simple;
	bh=/TqJuizcbbo/0YNA3onz15Bhq23txZ18oISRfzO54go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RNlHDifQTd7nUcHnHGy87J1YJwZBlzq1b60X+fXD5dN//3ygNV7hGudClICfMpasvOOj04qdaenMsSuNE4/hGj5tOU7d0XfLkkCD0UvC6XxKpHra9Q2dKw702LucjdqevFsy5uRJUBPfo9x1J26fIA61OvDv+Ow96yyATPMHLb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6RyUvUh; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6RyUvUh"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-87c0bb1ee4eso101258939f.2;
        Mon, 28 Jul 2025 18:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753752816; x=1754357616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S23qOVMAAKB7qgLVeWulkQC0C/F5u4i6UjQVVe6TXAI=;
        b=J6RyUvUhHKKOidtwnNPwkRsDWGweBho2hsmjbc5ZolSlb6d7rcMLpdYypqDZ1plrWR
         ZrUHbAretw1a75YegA+wbv4pDop32BC4PFk/Re8kIvRozQ/ZFrgB1+V2Qr7szqVwtbzN
         82wb9XGa4irw9Wkc1JZQx2MbS1tIli7dPYDXGD65RjjRbRCn56ieqnpupYw7Wpe1neLg
         T3ouebgmEZUjHzfOQ+IPCfTrCmOQUKM/7aNaP+jXD6Hv7rD/ZIEBsdBtKJoa3/Gq785a
         87/BGXo/hX3ZZBd/VMXd/CdHh2Apl/Mmr++mo8suR/6PpYcxfV2NLHH9msnsWfPbljeY
         qRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753752816; x=1754357616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S23qOVMAAKB7qgLVeWulkQC0C/F5u4i6UjQVVe6TXAI=;
        b=GicjVqTL0W7k6bzsymt55+zqY3+jqQ1MhMvYQzJpVY3x4jho6739eV4R25Ofy1MC0w
         dbHsRkbMmv/1cnGWgf8R8JmeWbWaRME5wXE89kt7D3j3HXn4zKJkf2XJ+A9mxjg4abNL
         OerjuRz0Dv8x0PRzuAQveXoMIvA39oKJysFH1bFdCE05nDTznMa7UWiYADmjPXEsIZgR
         eH/eq006/5qNW6mFs+zDJpksTpJWARjpz8he/1tpEffpNFDJt0DRZC+CjIt6toAtXb3p
         aNSbro/6gCkn0DpcyAbuCdndaEK0GDR5LwiKFzknwkQsAWGbE3nKMoJZwLQ9/Thnzi15
         3dhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2/+BLM8TX7COvfJpDWTiebhpJAF864UECGBZ5OxsXYTlWAj+tbs0jmIlBnr8n2E2x4hBV3/aQ6itgAIx1fRCXIA==@vger.kernel.org, AJvYcCXSkwesH5+4PCyizuVGmczDk+tw6p9F8tg8oV/OWKqL+aM8RWz+yIF16pBn2iwddWXUCAfnUi3ypoZgEU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgXopH66H+ir+Kv8YSiypWhxJXUt1m0AV0Lpyg0UBNqj0ikMeX
	3HY2PxAszYyANaQD2vRlAj6vLO05evhu5IY+h759vo+PJQqFtVvtYoDACZdKFHrJA8dnGVme4EK
	ExhFukWyBNtFTIcYTWzN4ZI9H7PExXL8=
X-Gm-Gg: ASbGncsTHYe8zi8YfPmYmrxmpAZhOLOM38+Ez56mUouC39sEZMIqXdJMjEV71uHBBwT
	VEj2TmF13XoB5Up/dd1uOOiQygJ5yqYm7JrVC3qS3iAVhycTAE6PnFD0bJ2YmBPYRFrbssHI7ZH
	Cjyg8d60xNYL0dvhxpMoqHz0oDACFrwyfHAjHUaWfuYs7kBvDxwoOFj1viC9Oy7qG+N1UyVrQay
	cAsC3o=
X-Google-Smtp-Source: AGHT+IEr/DTMtrde4B2O2jQtp73B0jXdt56IWjZMklggeu9+9ek06vbQzMnKQzsISgrp5QqOpsqfLGJJJJuLC3iPRHo=
X-Received: by 2002:a92:cd82:0:b0:3e2:c350:2e61 with SMTP id
 e9e14a558f8ab-3e3c5312d49mr225067155ab.20.1753752815891; Mon, 28 Jul 2025
 18:33:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722075225.544319-1-shengjiu.wang@nxp.com>
 <CAEnQRZBc2X6Yn0X+RbJ9-OSxovnHvoqJ3NXsJKBkuH82GNSAHA@mail.gmail.com>
 <aIeFqVUp2C6fh4PT@p14s> <12184ce7-e74b-48eb-abee-25f8a10a2423@nxp.com>
In-Reply-To: <12184ce7-e74b-48eb-abee-25f8a10a2423@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 29 Jul 2025 09:33:17 +0800
X-Gm-Features: Ac12FXyQrZyIVbOJ3pLjAv_HaREeHglGrD0Wy22HTBcGicbPxb4TlW_nT6cra8A
Message-ID: <CAA+D8AMpF9Te1+V=o6WQCzHTkKpKvrhP+76fpCZoswOhPiKDjQ@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support of recovery and
 coredump process
To: Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Daniel Baluta <daniel.baluta@gmail.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jassisinghbrar@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 11:09=E2=80=AFPM Iuliana Prodan <iuliana.prodan@nxp=
.com> wrote:
>
> On 7/28/2025 5:14 PM, Mathieu Poirier wrote:
> > On Mon, Jul 28, 2025 at 01:39:38PM +0300, Daniel Baluta wrote:
> >> On Tue, Jul 22, 2025 at 11:16=E2=80=AFAM Shengjiu Wang <shengjiu.wang@=
nxp.com> wrote:
> >>>
> >>> When enabled FW recovery, but is broken because software reset is mis=
sed
> >>> in this recovery flow. So move software reset from
> >>> imx_dsp_runtime_resume() to .load() and clear memory before loading
> >>> firmware to make recovery work.
> >>>
> >>> Add call rproc_coredump_set_elf_info() to initialize the elf info for
> >>> coredump, otherwise coredump will report error "ELF class is not set"=
.
> >>>
> >>> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc drive=
r for DSP on i.MX")
> >>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>
> >> Changes looks good to me:
>
> I agree, but this is not enough.
>
> >>
> >> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> >>
> >> I've tested it with Zephyr synchronization samples inducing a crash
> >> via debugfs interface. App
> >> can recover correctly.
>
>
> The synchronization sample does not utilize the Messaging Unit (MU) for
> communication between the two cores, its behavior is similar to the
> basic hello_world example (no fw_ready reply is expected by host).
>
> I=E2=80=99ve tested this patch with both the synchronization and hello_wo=
rld
> samples, as well as with the default firmware specified in the device
> tree (imx/dsp/hifi4.bin), and everything works as expected.
>
> However, when testing with the openamp_rsc_table sample from Zephyr [1],
> I encountered the following issue:
> ```
> [ 1500.964232] remoteproc remoteproc0: crash detected in imx-dsp-rproc:
> type watchdog
> [ 1500.964595] remoteproc remoteproc0: handling crash #1 in imx-dsp-rproc
> [ 1500.964608] remoteproc remoteproc0: recovering imx-dsp-rproc
> [ 1500.965959] remoteproc remoteproc0: stopped remote processor
> imx-dsp-rproc
> [ 1501.251897] remoteproc remoteproc0: can't start rproc imx-dsp-rproc: -=
110
> ```
> Upon debugging, I discovered that the issue stems from the imx-mailbox
> driver not clearing the General Purpose Interrupt (GPI) bits. This leads
> to the remote processor failing to restart properly.
>
> To ensure compatibility across all firmware variants, including those
> using OpenAMP, the attached patch is required. Both the recovery and
> mailbox patches have been successfully tested on the following
> platforms: i.MX8MP, i.MX8ULP, i.MX8QM and i.MX8QXP.
>
> Shengjiu, do you want to send a new version with both patches?

No.  it is a different issue.
You can send it to the mailbox maintainer for review.

Best regards
Shengjiu Wang

>
> Thanks,
> Iulia
>
> >
> > Very good - I will merge this around 6.17-rc2 when I get back from vaca=
tion.
> >
> > Mathieu
> >
>
> [1]
> https://github.com/zephyrproject-rtos/zephyr/tree/main/samples/subsys/ipc=
/openamp_rsc_table
