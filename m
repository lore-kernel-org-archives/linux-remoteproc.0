Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70D433DF;
	Wed,  4 Jun 2025 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749041642; cv=none; b=Rj6LO06/q+ZOOYZi5dj0sAFz92WZGGud+4GblMUGdo2vMuCM3bKvXwAcfMFxS1Co1o6DoV2g7A0Rkw5XsZlrGdHLxIPr05XsxRYZp3L4tAZVkGZt/kPyNICotrvvxTuAr6dZYwoMmbbuPIsXOy4M1l9SRe/7jhGj0e59abEdTv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749041642; c=relaxed/simple;
	bh=OZD7WcCyUzuzO15vKiLDI+M51i40/S5ipWMFGVsv91s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfQm1P1IaWHfTDfV9wbZKaji4vDnmhhiK6sM2Hf1pVIqpZZnHDuo3E/llF7us7rpNqn+kmHapxx4/EuG+Sj3+l2pOb5n+ilrEV/3/dWzFK268Zmfz23eJqxjIrD9PRN6hSQWllS6Na4PBMpNGIQi5PE1o8IxQmTl2NFv/dKoihA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHFbq4D+; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHFbq4D+"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso5152273a12.3;
        Wed, 04 Jun 2025 05:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749041639; x=1749646439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjvlidjGUQC4SxdMsrlPY8e5lq5D3hS45/TeUXFKOwY=;
        b=NHFbq4D+W5xsXctSChJ77ZSsMofdK3Qcpnhg+q6CGCOhhhhoZ5Z61ptjnX70ww0Ih8
         J0JAjoG4o8I4NdD8CdDzv1goiMTB/iWOx9rSYzhEVVcYtXxLYS9BEDFmC3uWeZKoPHTd
         dMLIYk/f7ZVUKO2qvG2lWZ7+pTaff9tnprAf56RtikUatuVlD7FLH0Ah4qucTlq8Po/t
         1k55Fwl4TenVAMoQrTkYdunr8xjpvme+l0wLJlSECJwbZJeKXLaAWUoI8xdoErgT7c6V
         Q7RCsWa8CyVPjibQVnDqT7ASsCsltQHAcR0o7GcgVYnUhMV4kom/FCdBtaABkzP2+oJu
         Y0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749041639; x=1749646439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjvlidjGUQC4SxdMsrlPY8e5lq5D3hS45/TeUXFKOwY=;
        b=NDnfXOAaoDr05OBCveK5je4WjXpFxXBsn1xLdLZ7dVHFyuA7X/M4AAg5qrHa7iOnKP
         q6SWbcEyaEzopzpY6i7hDUsR1DtHZ9WChnE5nlI9jEtCH3MgwW2kXrRsR+zx/M3yjGKf
         u3lQhnmX1pVfRyVcrZUqSC1Ku6atqmOGEoixDBiVckhAzWmBRoKQDrv8RdFtpxaDQkyV
         2wIJhZ/cXZf1uHutBKJuyHq2Pll8TFhLyj1s7MU8UUL2ClAJYtoH3hrZ0ugHt9Q8nced
         rpXoCw7ngSJAWG8fVsyAAmO9RV4y2OKJtc5X+flz9A1nCKJ6/W8IwTaDUiemmbj6qWSb
         a2gw==
X-Forwarded-Encrypted: i=1; AJvYcCUBH5WmiHKez6naSUQwNOWrxeRoyNb7e/7k7YE5nZkWFEpj5kUdX+Uo5i2E4U81oKWXdDkr+BJ2H4QmCg7IpXf/6Q==@vger.kernel.org, AJvYcCVRI9O681Zsn6T7SjHUWB3HOVCSLKnFzgoUKP99qyNY8mcNI28HisUQ0ir+VIsjWZkQ7Y4IhM0MLcPG@vger.kernel.org, AJvYcCWPozl9uNmem+5SZczJJy72C04Msx6K0DiUEGN/Xsw3bLUZJvj971mj4gmi1fVAlZg+PuwYEGN/f//kUvI7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp0Cbyhlsjff2HlZNhwoz0548v7U2dGUgE7EZy8HdPvmN0GlwK
	l0SHpOwGgozp81h3myNc6ri0y3cA8/i2tbIChNLMoqUb7+cyWcBYVmUC+pO6QRS+f6/u0ekbWVN
	0hXDu70hvfHzti2Bk1F/l/KTjvN6xqSw=
X-Gm-Gg: ASbGncsTLkG2osdg7hJrkb4lB3TzGu2L/n109LjUfgTmre+Jj7tN6QYPTRCU+6SaKss
	26uORTSso5fWYLbSXRTEPlIIOK3849s9vaRl4OnnU0ni90xVKhVBSAZBCwgPPR4j2r6PsyTd0Ak
	XkwOYTDA1gX8z74V/c0fZ5NtN5HzOnbA==
X-Google-Smtp-Source: AGHT+IF8BahbWPg3PJ0D16BlqIY1qWwOW5iNYKdNrQkdBaMB8hXbKb0RJuekC/SLvpfEpMn9z+5vwKt1GFfdaEoA8s0=
X-Received: by 2002:a17:90b:35c5:b0:311:be51:bdf8 with SMTP id
 98e67ed59e1d1-3130cd6d85emr4203307a91.3.1749041638951; Wed, 04 Jun 2025
 05:53:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com> <20250604-imx95-rproc-1-v1-2-a6e5f512731c@nxp.com>
In-Reply-To: <20250604-imx95-rproc-1-v1-2-a6e5f512731c@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 4 Jun 2025 15:55:55 +0300
X-Gm-Features: AX0GCFuQSVALoqDz8lEd52R5b_qpD5ZIb0xjVNRy7BAJHJd7nx_8wHvUzvLriIg
Message-ID: <CAEnQRZByPkxojykJ3w-Mxko08Nc5txsOCL4vy+P76HuTy3YTaA@mail.gmail.com>
Subject: Re: [PATCH 2/3] remoteproc: imx_rproc: Add support for System Manager API
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

Hi Peng,

Thanks a lot for the patches. Comments inline:

On Wed, Jun 4, 2025 at 5:36=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
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
>  (1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
couldn't -> can't

>  (2) M7 in a separate Logical Machine that Linux could control it using
>      LMM protocol
could -> can

>  (3) M7 runs in same Logical Machine as A55, so Linux could control it
>      using CPU protocol
could -> can

>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Add IMX_RPROC_SM to indicate the remotecores runs on a SoC that
>    has System Manager.

remotecores -> remote core

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
> ---
>  drivers/remoteproc/imx_rproc.c | 139 +++++++++++++++++++++++++++++++++++=
+++++-
>  drivers/remoteproc/imx_rproc.h |   2 +
>  2 files changed, 139 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 74299af1d7f10a0db794de494c52304b2323b89f..0649faa98725db99366946c65=
edf5b7daff78316 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> +#include <linux/firmware/imx/sm.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> @@ -21,6 +22,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/scmi_imx_protocol.h>
>  #include <linux/workqueue.h>
>
>  #include "imx_rproc.h"
> @@ -91,6 +93,11 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>
> +/* Logical Machine Operation */
> +#define IMX_RPROC_FLAGS_SM_LMM_OP      BIT(0)
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL   BIT(1)
> +
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(struct rproc *rproc);
>
> @@ -115,6 +122,22 @@ struct imx_rproc {
>         u32                             entry;          /* cpu start addr=
ess */
>         u32                             core_index;
>         struct dev_pm_domain_list       *pd_list;
> +       /* For i.MX System Manager based systems */
> +       u32                             cpuid;
> +       u32                             lmid;
> +       u32                             flags;
> +};
> +
> +static const struct imx_rproc_att imx_rproc_att_imx95_m7[] =3D {
> +       /* dev addr , sys addr  , size      , flags */
> +       /* TCM CODE NON-SECURE */
> +       { 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +       /* TCM SYS NON-SECURE*/
> +       { 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +       /* DDR */
> +       { 0x80000000, 0x80000000, 0x50000000, 0 },
>  };

^ this belongs to patch 3/3

Otherwise, patch looks good to me.
