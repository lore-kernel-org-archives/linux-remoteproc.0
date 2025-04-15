Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7552563
	for <linux-remoteproc@vger.kernel.org>; Tue, 15 Apr 2025 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724108; cv=none; b=S/jDxTN7pfLc5HX1Niaehgxr1lSGvmg5h8Qv87VvtOw1rWRJR1CWhpmVW8qZsA9ntHaNOa6xE0dJpSVyxILmCK4KkLVU4bwpwA6pXs3xLdgIOCYuNZhahioBMoMgv9YX0HiwG3/EKRhLOf76xMCgedVv28OnXHXSoA6utxedr5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724108; c=relaxed/simple;
	bh=m0xfAS8QK+GM0ddqcKkgH7JaMDCagUiMUdtp3obSN4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NO1spdI2jF1I0wDmYc0gntzOre8o2SJGh/GOr9cB1K3MzhbR1LRLiugbnYSIZEyyFebsJsnc0Y19c78ePSDxjJ0dwnXh5eiPWbS3PJhdELce59mYswy9AREkhp0KMEnYmX1Q/6V/IC09Q4xronp4dwHzza9BFSQb4tDp6ysI0Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ok1L0+c4; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ok1L0+c4"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so9108145a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Apr 2025 06:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724104; x=1745328904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PGZ9B42C0yWg7Qpk0chgVgDrU0joNg71F+OhP9lllNY=;
        b=Ok1L0+c4LDhurErTMbt5LwXAnpZch32QF7h9gD5tkw6/AkbDG1gtTGLYtaq4lukbOH
         NEai5EYSH2AtExNiVQC79KEl1dPTLssMjNNWSoaosyEEo95mJiaqz7KLdKS/JrDE7XDB
         SX2Lgppf5XY4apEXwL/ayD9WlEDqLGfm8TxC3bL6ykfkJXBmH8kr3/Ereta/Th8TqTu+
         V4dQv3aUn5y+89qgXufIzZuI1iYhnfPvNoN7+qGOP0cSH8bCmHQibq6Z4AXnubCZRoqF
         l7uB2hpdCSjELygg3bOZmGRjKYwSbTaLlaWU6Ba9BkjauLz5yWLB+QjfDSEZZhMzRxbu
         Q/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724104; x=1745328904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGZ9B42C0yWg7Qpk0chgVgDrU0joNg71F+OhP9lllNY=;
        b=dtVOfoJiE1TivtFYeilY1itCf29jABeDDndz/YMgSZ2Ko+pCyARw7ABYCHxeBJz0CP
         xbvG2H4eqWeZWAACkdI08sQXVdz3aBnmyVcVcz3i9qp448Fx3EZc3g1JSNCuy79FPCz7
         mAL6UaEV3TitL4X28TTJv2cpRcfv5gDD4bLufvI742qnXW2s9iVZrxhxjB4PkN0lSWMP
         1iwVkL5lwb+Zs6uK9wK2K9y61YPG3bQ+1nsVwHaU0F6/9wLDPKo0jSHeCn7VQ9T0rXGW
         Zh2gxJvNbxZLz684DuM2Ue6/zizKVhYeJNgJvyPQCW7/rK4fB67K+3V7cuA4w/q26Zif
         6LaA==
X-Forwarded-Encrypted: i=1; AJvYcCXRBSYZHLstu+623s9b89xRo4wC6Yh3S4AF1f4yINPewU1xU9ZSXDBaPH3oFzknKLcYBnzoXdEjJgBMS/AdD/U5@vger.kernel.org
X-Gm-Message-State: AOJu0YxSz83W9AIfNhj7J/MlfXJM/8uwcVa+Ku9uh9kXN2ZtybURxgv9
	M+G9BOAWxA59pvh2YP1msla66ySx7Y/jb19/GZ9zPQhcFwQlb+bj1zUXdKP3mIriQYMAqL5fKTU
	uzX83z7txJwUSy32GFhwrI2PBKvjYq/THd6HBoA==
X-Gm-Gg: ASbGncuvDHAGvPepw1zYkjx6wk9r+I7A9Qu/ht58DZfmktVFW21qXq+v20aoHIpnnN9
	9DTE+/Ut7S/6LbY0z8SjkHRJcpsBjaqiBw6pojZEfevNUJriPN+6TY47Ymi9g+Z1+hAbW2dOelu
	VPtTwb75c0nqxTvv3b01c8HQzqNNazWUOJ84heZbTSHe5YELxW7hkQGtxy
X-Google-Smtp-Source: AGHT+IFeWYl7QrxdNMXm+KJ0xt4slhUexWmapLP1aBEJ5DfrmKAWMNsZFlYEzQq89QgGem5AgCQoBcOQpxhvkd68zAk=
X-Received: by 2002:a05:6402:1e96:b0:5f0:9eb3:8e76 with SMTP id
 4fb4d7f45d1cf-5f3702b02eamr14469259a12.34.1744724103928; Tue, 15 Apr 2025
 06:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409213030.3489481-1-iuliana.prodan@oss.nxp.com>
 <Z_0snwzpkPTJqjWX@p14s> <8116ac27-4c2e-41a4-9e05-7d20a7c6a361@nxp.com>
In-Reply-To: <8116ac27-4c2e-41a4-9e05-7d20a7c6a361@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 15 Apr 2025 07:34:52 -0600
X-Gm-Features: ATxdqUGSQ5S_l_W8BKKUHjnxrDXxD3sYIeidnBz7Dp1f6y94_0PqsAy6EwgwgCw
Message-ID: <CANLsYkzehT=ghX0XCNEp7Dod1Jc1YCm33B3ByDrfMoKvbssHag@mail.gmail.com>
Subject: Re: [PATCH v4] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
To: Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, "S.J. Wang" <shengjiu.wang@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Mpuaudiosw <Mpuaudiosw@nxp.com>, imx@lists.linux.dev, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Apr 2025 at 05:04, Iuliana Prodan <iuliana.prodan@nxp.com> wrote:
>
> On 4/14/2025 6:41 PM, Mathieu Poirier wrote:
> > On Thu, Apr 10, 2025 at 12:30:30AM +0300, Iuliana Prodan (OSS) wrote:
> >> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> >>
> >> Some DSP firmware requires a FW_READY signal before proceeding, while
> >> others do not.
> >> Therefore, add support to handle i.MX DSP-specific features.
> >>
> >> Implement handle_rsc callback to handle resource table parsing and to
> >> process DSP-specific resource, to determine if waiting is needed.
> >>
> >> Update imx_dsp_rproc_start() to handle this condition accordingly.
> >>
> >> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> >> ---
> >> Changes in v4:
> >> - Reviews from Mathieu Poirier:
> >>    - Adjusted len to include the size of struct fw_rsc_imx_dsp.
> >>    - Updated len validation checks.
> >> - Review from Frank Li:
> >>    - In imx_dsp_rproc_handle_rsc(), removed the goto ignored statement.
> >> - In probe(), set flags to WAIT_FW_READY to ensure the host waits
> >> for fw_ready when no vendor-specific resource is defined.
> >> - Link to v3: https://lore.kernel.org/all/20250403100124.637889-1-iuliana.prodan@oss.nxp.com/
> >>
> >> Changes in v3:
> >> - Reviews from Mathieu Poirier:
> >>    - Added version and magic number to vendor-specific resource table entry.
> >>    - Updated defines to maintain backward compatibility with a resource table that doesn't have a vendor-specific resource.
> >>      - By default, wait for `fw_ready`, unless specified otherwise.
> >> - Link to v2: https://lore.kernel.org/all/20250318215007.2109726-1-iuliana.prodan@oss.nxp.com
> >>
> >> Changes in v2:
> >> - Reviews from Mathieu Poirier:
> >>    - Use vendor-specific resource table entry.
> >>    - Implement resource handler specific to the i.MX DSP.
> >> - Revise commit message to include recent updates.
> >> - Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/
> >>
> >>   drivers/remoteproc/imx_dsp_rproc.c | 98 +++++++++++++++++++++++++++++-
> >>   1 file changed, 96 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> >> index b9bb15970966..e4212e624a91 100644
> >> --- a/drivers/remoteproc/imx_dsp_rproc.c
> >> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> >> @@ -35,9 +35,18 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
> >>   MODULE_PARM_DESC(no_mailboxes,
> >>               "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
> >>
> >> +/* Flag indicating that the remote is up and running */
> >>   #define REMOTE_IS_READY                            BIT(0)
> >> +/* Flag indicating that the host should wait for a firmware-ready response */
> >> +#define WAIT_FW_READY                               BIT(1)
> >>   #define REMOTE_READY_WAIT_MAX_RETRIES              500
> >>
> >> +/*
> >> + * This flag is set in the DSP resource table's features field to indicate
> >> + * that the firmware requires the host NOT to wait for a FW_READY response.
> >> + */
> >> +#define FEATURE_DONT_WAIT_FW_READY          BIT(0)
> >> +
> >>   /* att flags */
> >>   /* DSP own area */
> >>   #define ATT_OWN                                    BIT(31)
> >> @@ -72,6 +81,10 @@ MODULE_PARM_DESC(no_mailboxes,
> >>
> >>   #define IMX8ULP_SIP_HIFI_XRDC                      0xc200000e
> >>
> >> +#define FW_RSC_NXP_S_MAGIC                  ((uint32_t)'n' << 24 |  \
> >> +                                             (uint32_t)'x' << 16 |  \
> >> +                                             (uint32_t)'p' << 8 |   \
> >> +                                             (uint32_t)'s')
> >>   /*
> >>    * enum - Predefined Mailbox Messages
> >>    *
> >> @@ -136,6 +149,24 @@ struct imx_dsp_rproc_dcfg {
> >>      int (*reset)(struct imx_dsp_rproc *priv);
> >>   };
> >>
> >> +/**
> >> + * struct fw_rsc_imx_dsp - i.MX DSP specific info
> >> + *
> >> + * @len: length of the resource entry
> >> + * @magic_num: 32-bit magic number
> >> + * @version: version of data structure
> >> + * @features: feature flags supported by the i.MX DSP firmware
> >> + *
> >> + * This represents a DSP-specific resource in the firmware's
> >> + * resource table, providing information on supported features.
> >> + */
> >> +struct fw_rsc_imx_dsp {
> >> +    uint32_t len;
> >> +    uint32_t magic_num;
> >> +    uint32_t version;
> >> +    uint32_t features;
> >> +} __packed;
> >> +
> >>   static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
> >>      /* dev addr , sys addr  , size      , flags */
> >>      { 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
> >> @@ -300,6 +331,66 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
> >>      return -ETIMEDOUT;
> >>   }
> >>
> >> +/**
> >> + * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
> >> + * @rproc: remote processor instance
> >> + * @rsc_type: resource type identifier
> >> + * @rsc: pointer to the resource entry
> >> + * @offset: offset of the resource entry
> >> + * @avail: available space in the resource table
> >> + *
> >> + * Parse the DSP-specific resource entry and update flags accordingly.
> >> + * If the WAIT_FW_READY feature is set, the host must wait for the firmware
> >> + * to signal readiness before proceeding with execution.
> >> + *
> >> + * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
> >> + */
> >> +static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
> >> +                                void *rsc, int offset, int avail)
> >> +{
> >> +    struct imx_dsp_rproc *priv = rproc->priv;
> >> +    struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
> >> +    struct device *dev = rproc->dev.parent;
> >> +
> >> +    if (!imx_dsp_rsc) {
> >> +            dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
> >> +            return RSC_IGNORED;
> >> +    }
> >> +
> >> +    /* Make sure resource isn't truncated */
> >> +    if (sizeof(struct fw_rsc_imx_dsp) > avail ||
> > We agree on that part.
> >
> >> +        sizeof(struct fw_rsc_imx_dsp) < imx_dsp_rsc->len) {
> >  From the above, "sizeof(struct fw_rsc_imx_dsp) > imx_dsp_rsc->len" would be a
> > valid condition when it clearly isn't.  I am still convinced the only
> > valid option is:
> >
> >              sizeof(struct fw_rsc_imx_dsp) != imx_dsp_rsc->len)
> >
> > I am happy to change my mind but would need more information.
>
> You're right, it should be sizeof(struct fw_rsc_imx_dsp) > imx_dsp_rsc->len.
> The ->len comes from the remote size, while in Linux we need to check if
> the length is at least sizeof(struct fw_rsc_imx_dsp).

To be clear, I think it should _not_ be sizeof(struct fw_rsc_imx_dsp)
> imx_dsp_rsc->len, this is an error condition.

> This is for backwards compatibility - if someone changes the structure
> on the remote side and increases the length, in Linux we can still load
> that firmware, but probably not all features will be checked.

And nothing good can come out of that situation.

>
> If you agree with this, I'll send a v5 with this fix - s/</>.

To me, the only valid condition is:

sizeof(struct fw_rsc_imx_dsp) != imx_dsp_rsc->len)

>
> Thanks,
> Iulia
>
> > Thanks,
> > Mathieu
> >
> >> +            dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
> >> +            return RSC_IGNORED;
> >> +    }
> >> +
> >> +    /*
> >> +     * If FW_RSC_NXP_S_MAGIC number is not found then
> >> +     * wait for fw_ready reply (default work flow)
> >> +     */
> >> +    if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
> >> +            dev_dbg(dev, "Invalid resource table magic number.\n");
> >> +            return RSC_IGNORED;
> >> +    }
> >> +
> >> +    /*
> >> +     * For now, in struct fw_rsc_imx_dsp, version 0,
> >> +     * only FEATURE_DONT_WAIT_FW_READY is valid.
> >> +     *
> >> +     * When adding new features, please upgrade version.
> >> +     */
> >> +    if (imx_dsp_rsc->version > 0) {
> >> +            dev_warn(dev, "Unexpected fw_rsc_imx_dsp version %d.\n",
> >> +                     imx_dsp_rsc->version);
> >> +            return RSC_IGNORED;
> >> +    }
> >> +
> >> +    if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
> >> +            priv->flags &= ~WAIT_FW_READY;
> >> +
> >> +    return RSC_HANDLED;
> >> +}
> >> +
> >>   /*
> >>    * Start function for rproc_ops
> >>    *
> >> @@ -335,8 +426,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
> >>
> >>      if (ret)
> >>              dev_err(dev, "Failed to enable remote core!\n");
> >> -    else
> >> -            ret = imx_dsp_rproc_ready(rproc);
> >> +    else if (priv->flags & WAIT_FW_READY)
> >> +            return imx_dsp_rproc_ready(rproc);
> >>
> >>      return ret;
> >>   }
> >> @@ -936,6 +1027,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
> >>      .kick           = imx_dsp_rproc_kick,
> >>      .load           = imx_dsp_rproc_elf_load_segments,
> >>      .parse_fw       = imx_dsp_rproc_parse_fw,
> >> +    .handle_rsc     = imx_dsp_rproc_handle_rsc,
> >>      .find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> >>      .sanity_check   = rproc_elf_sanity_check,
> >>      .get_boot_addr  = rproc_elf_get_boot_addr,
> >> @@ -1053,6 +1145,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
> >>      priv = rproc->priv;
> >>      priv->rproc = rproc;
> >>      priv->dsp_dcfg = dsp_dcfg;
> >> +    /* By default, host waits for fw_ready reply */
> >> +    priv->flags |= WAIT_FW_READY;
> >>
> >>      if (no_mailboxes)
> >>              imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_no_alloc;
> >> --
> >> 2.25.1
> >>
