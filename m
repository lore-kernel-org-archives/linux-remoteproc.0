Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8065E090
	for <linux-remoteproc@vger.kernel.org>; Wed, 28 Feb 2024 20:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709150640; cv=none; b=TW/GHw++htocHvE+HVarvzwp916Qja5Oa72PsSD99Yb/wfCLQ+woT3yEBNHzwe0ANg3tP7V9baCf/n/0tQ/2qtOZjgzPE/lxTfCUeCIKSPxNLDjGdP/CN6EHOJQFVt2ecE85Bm+R4gnASL+p8haEgHm6sNwx5egdCjTqIUjVLyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709150640; c=relaxed/simple;
	bh=mzumyoSZI+LhVCrFoBFecC1MJbho77njtjXQwC1xJGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlsCLHoERMLVbMHZYYGYHQpC26E9TTxnA/gWAQVCRAwR4UoKgIkXeTezJEoyX/TQuZc0L5HUnu9FQe+1xwWTuUEP2jh7PUHjMErpfOsTBk2U8WKfVf7cVBTWnd6r2F7eiJgpyeswjh+5J/iNK4EVjPgG5nMq26yQbIzJNFyRLbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yBwsEkNn; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yBwsEkNn"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-565d1656c12so242586a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Feb 2024 12:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709150635; x=1709755435; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cA8CXi05oqG2RKo5TjCvAal1T8T9TcbzOEEwwnkxX20=;
        b=yBwsEkNnrM27ah4NWjuA+5hbvkqoG5EZKckZoX0enxBlfdC9JVBevFU3JHgYzzU5l/
         tHKynHl4NnIpx+bP/UYpv/d4C8HQTMb9oodGp25gwtwUjFmm/FcuzJiTo/h+2pG8Erre
         8mqzvLcau1i9swJOoXOaIN/ZTF3X6RF5ZTAoaFpXehrDyal+O4+k8l+54Bqrh+hMp9p7
         G+MdiAqbApJUSpM/2R3cp/jbEH4nfN2a941OJYfVEyMm1Z77BHMlRMpeblZnniOl0C9W
         OnIb8/3ZxUUuBdImZoIQOf3+vz9s8h3EikvrS4vPm4/DTmF5chFp4nPVgDxY9/xrwqTy
         7omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709150635; x=1709755435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cA8CXi05oqG2RKo5TjCvAal1T8T9TcbzOEEwwnkxX20=;
        b=fDlOprSkQRYZbn9ibYKA1pTtntvlACGmrWjibFNOeBOav4ilfBWX6hEImnp8hO7AYm
         YTr7bVPBQmMD1uI8q4XxSgT4rP2HQWiRDrIasfU8Wmqn1iA4GGABCsyLautWgxatus+7
         +/rTKCQqNWNxwU3lfKHvusroeufOvYqOkmIrB45i9s4Rj4A6W0JBHY4R03oU5US6RtZ+
         GdQ/DKbnNA9/Dhq1oCwkrrrCB3xPEWSTpvYSE0gNNQAJ45CCR9IT1BMR1WHD0huPIRzI
         9HG4/yj43LyAmu19VeL9Lao84PgMo5pcLEHUBNJ9HOtFgj72kyvP9f7BA31obiI5riVF
         2Yyw==
X-Forwarded-Encrypted: i=1; AJvYcCXtyOFOpbRmY0XMy5Q399N0O5dNYlft7LcZMJzdC7k9xt2XU8an/XVWnLt61JuR4yQ7vg8d04VUKl4nesH/96IJdIXrmZvEBy9rrOsMV3qFJQ==
X-Gm-Message-State: AOJu0YzvAqLT7M0Y9b9EL7uTwp4h9bl+MNusF+JuDZQa6ICe9vmYp+2f
	+FZ8suW+OvExCULtTRLQnjlzuHLAc2eySau/puNaDNwAx8S5eER7d3wKlkNsGnz+5b4A6acKSXJ
	SgQFCmtlNBuuy8BqD2/2DQL/QVcCOuAuzDZlFIQ==
X-Google-Smtp-Source: AGHT+IHhbcCIjBi7iFnCxL3DiWqnSbAEzy9Sfa0X7wds0chJjXqvd603Hv2MKXxKJFOkI3s7JLGVtHOhxJKVoh2vX+c=
X-Received: by 2002:a50:cb88:0:b0:566:59a2:7a10 with SMTP id
 k8-20020a50cb88000000b0056659a27a10mr208018edi.1.1709150634952; Wed, 28 Feb
 2024 12:03:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219174437.3722620-1-tanmay.shah@amd.com> <20240219174437.3722620-7-tanmay.shah@amd.com>
 <Zd9omCbc3UqjT7Lr@p14s> <71dcc0f8-a59a-4aee-9349-09334b8e75f7@amd.com>
In-Reply-To: <71dcc0f8-a59a-4aee-9349-09334b8e75f7@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 28 Feb 2024 13:03:43 -0700
Message-ID: <CANLsYkzSP=A-d91Zz_H6gqd70iUnk18kDDPkn+g+B=LUovOQKw@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] remoteproc: zynqmp: fix lockstep mode memory region
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, michal.simek@amd.com, 
	ben.levinsky@amd.com, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Feb 2024 at 12:24, Tanmay Shah <tanmay.shah@amd.com> wrote:
>
>
> On 2/28/24 11:08 AM, Mathieu Poirier wrote:
> > On Mon, Feb 19, 2024 at 09:44:34AM -0800, Tanmay Shah wrote:
> > > In lockstep mode, r5 core0 uses TCM of R5 core1. Following is lockstep
> > > mode memory region as per hardware reference manual.
> > >
> > >     |      *TCM*         |   *R5 View* | *Linux view* |
> > >     | R5_0 ATCM (128 KB) | 0x0000_0000 | 0xFFE0_0000  |
> > >     | R5_0 BTCM (128 KB) | 0x0002_0000 | 0xFFE2_0000  |
> > >
> > > However, driver shouldn't model it as above because R5 core0 TCM and core1
> > > TCM has different power-domains mapped to it.
> > > Hence, TCM address space in lockstep mode should be modeled as 64KB
> > > regions only where each region has its own power-domain as following:
> > >
> > >     |      *TCM*         |   *R5 View* | *Linux view* |
> > >     | R5_0 ATCM0 (64 KB) | 0x0000_0000 | 0xFFE0_0000  |
> > >     | R5_0 BTCM0 (64 KB) | 0x0002_0000 | 0xFFE2_0000  |
> > >     | R5_0 ATCM1 (64 KB) | 0x0001_0000 | 0xFFE1_0000  |
> > >     | R5_0 BTCM1 (64 KB) | 0x0003_0000 | 0xFFE3_0000  |
> > >
> > > This makes driver maintanance easy and makes design robust for future
> > > platorms as well.
> > >
> > > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >
> > Now that I have a clearer picture of where things are going, I am adding this
> > patch to rproc-next.
> >
> > I'll wait for the DT crew for the rest of this set.
>
> Hi Mathieu,
>
> Is it okay if we wait for DT crew to clear new bindings as well before taking this one to rproc-next ?
>
> Just in case any modifications needed further?
>

Sure, we can do that too.

>
> Tanmay
>
>
> >
> > Thanks,
> > Mathieu
> >
> > > ---
> > >  drivers/remoteproc/xlnx_r5_remoteproc.c | 145 ++----------------------
> > >  1 file changed, 12 insertions(+), 133 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > > index 4395edea9a64..42b0384d34f2 100644
> > > --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> > > +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > > @@ -84,12 +84,12 @@ static const struct mem_bank_data zynqmp_tcm_banks_split[] = {
> > >     {0xffeb0000UL, 0x20000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
> > >  };
> > >
> > > -/* In lockstep mode cluster combines each 64KB TCM and makes 128KB TCM */
> > > +/* In lockstep mode cluster uses each 64KB TCM from second core as well */
> > >  static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
> > > -   {0xffe00000UL, 0x0, 0x20000UL, PD_R5_0_ATCM, "atcm0"}, /* TCM 128KB each */
> > > -   {0xffe20000UL, 0x20000, 0x20000UL, PD_R5_0_BTCM, "btcm0"},
> > > -   {0, 0, 0, PD_R5_1_ATCM, ""},
> > > -   {0, 0, 0, PD_R5_1_BTCM, ""},
> > > +   {0xffe00000UL, 0x0, 0x10000UL, PD_R5_0_ATCM, "atcm0"}, /* TCM 64KB each */
> > > +   {0xffe20000UL, 0x20000, 0x10000UL, PD_R5_0_BTCM, "btcm0"},
> > > +   {0xffe10000UL, 0x10000, 0x10000UL, PD_R5_1_ATCM, "atcm1"},
> > > +   {0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
> > >  };
> > >
> > >  /**
> > > @@ -540,14 +540,14 @@ static int tcm_mem_map(struct rproc *rproc,
> > >  }
> > >
> > >  /*
> > > - * add_tcm_carveout_split_mode()
> > > + * add_tcm_banks()
> > >   * @rproc: single R5 core's corresponding rproc instance
> > >   *
> > > - * allocate and add remoteproc carveout for TCM memory in split mode
> > > + * allocate and add remoteproc carveout for TCM memory
> > >   *
> > >   * return 0 on success, otherwise non-zero value on failure
> > >   */
> > > -static int add_tcm_carveout_split_mode(struct rproc *rproc)
> > > +static int add_tcm_banks(struct rproc *rproc)
> > >  {
> > >     struct rproc_mem_entry *rproc_mem;
> > >     struct zynqmp_r5_core *r5_core;
> > > @@ -580,10 +580,10 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
> > >                                          ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > >             if (ret < 0) {
> > >                     dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
> > > -                   goto release_tcm_split;
> > > +                   goto release_tcm;
> > >             }
> > >
> > > -           dev_dbg(dev, "TCM carveout split mode %s addr=%llx, da=0x%x, size=0x%lx",
> > > +           dev_dbg(dev, "TCM carveout %s addr=%llx, da=0x%x, size=0x%lx",
> > >                     bank_name, bank_addr, da, bank_size);
> > >
> > >             rproc_mem = rproc_mem_entry_init(dev, NULL, bank_addr,
> > > @@ -593,7 +593,7 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
> > >             if (!rproc_mem) {
> > >                     ret = -ENOMEM;
> > >                     zynqmp_pm_release_node(pm_domain_id);
> > > -                   goto release_tcm_split;
> > > +                   goto release_tcm;
> > >             }
> > >
> > >             rproc_add_carveout(rproc, rproc_mem);
> > > @@ -601,7 +601,7 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
> > >
> > >     return 0;
> > >
> > > -release_tcm_split:
> > > +release_tcm:
> > >     /* If failed, Turn off all TCM banks turned on before */
> > >     for (i--; i >= 0; i--) {
> > >             pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
> > > @@ -610,127 +610,6 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
> > >     return ret;
> > >  }
> > >
> > > -/*
> > > - * add_tcm_carveout_lockstep_mode()
> > > - * @rproc: single R5 core's corresponding rproc instance
> > > - *
> > > - * allocate and add remoteproc carveout for TCM memory in lockstep mode
> > > - *
> > > - * return 0 on success, otherwise non-zero value on failure
> > > - */
> > > -static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
> > > -{
> > > -   struct rproc_mem_entry *rproc_mem;
> > > -   struct zynqmp_r5_core *r5_core;
> > > -   int i, num_banks, ret;
> > > -   phys_addr_t bank_addr;
> > > -   size_t bank_size = 0;
> > > -   struct device *dev;
> > > -   u32 pm_domain_id;
> > > -   char *bank_name;
> > > -   u32 da;
> > > -
> > > -   r5_core = rproc->priv;
> > > -   dev = r5_core->dev;
> > > -
> > > -   /* Go through zynqmp banks for r5 node */
> > > -   num_banks = r5_core->tcm_bank_count;
> > > -
> > > -   /*
> > > -    * In lockstep mode, TCM is contiguous memory block
> > > -    * However, each TCM block still needs to be enabled individually.
> > > -    * So, Enable each TCM block individually.
> > > -    * Although ATCM and BTCM is contiguous memory block, add two separate
> > > -    * carveouts for both.
> > > -    */
> > > -   for (i = 0; i < num_banks; i++) {
> > > -           pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
> > > -
> > > -           /* Turn on each TCM bank individually */
> > > -           ret = zynqmp_pm_request_node(pm_domain_id,
> > > -                                        ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> > > -                                        ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > > -           if (ret < 0) {
> > > -                   dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
> > > -                   goto release_tcm_lockstep;
> > > -           }
> > > -
> > > -           bank_size = r5_core->tcm_banks[i]->size;
> > > -           if (bank_size == 0)
> > > -                   continue;
> > > -
> > > -           bank_addr = r5_core->tcm_banks[i]->addr;
> > > -           da = r5_core->tcm_banks[i]->da;
> > > -           bank_name = r5_core->tcm_banks[i]->bank_name;
> > > -
> > > -           /* Register TCM address range, TCM map and unmap functions */
> > > -           rproc_mem = rproc_mem_entry_init(dev, NULL, bank_addr,
> > > -                                            bank_size, da,
> > > -                                            tcm_mem_map, tcm_mem_unmap,
> > > -                                            bank_name);
> > > -           if (!rproc_mem) {
> > > -                   ret = -ENOMEM;
> > > -                   zynqmp_pm_release_node(pm_domain_id);
> > > -                   goto release_tcm_lockstep;
> > > -           }
> > > -
> > > -           /* If registration is success, add carveouts */
> > > -           rproc_add_carveout(rproc, rproc_mem);
> > > -
> > > -           dev_dbg(dev, "TCM carveout lockstep mode %s addr=0x%llx, da=0x%x, size=0x%lx",
> > > -                   bank_name, bank_addr, da, bank_size);
> > > -   }
> > > -
> > > -   return 0;
> > > -
> > > -release_tcm_lockstep:
> > > -   /* If failed, Turn off all TCM banks turned on before */
> > > -   for (i--; i >= 0; i--) {
> > > -           pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
> > > -           zynqmp_pm_release_node(pm_domain_id);
> > > -   }
> > > -   return ret;
> > > -}
> > > -
> > > -/*
> > > - * add_tcm_banks()
> > > - * @rproc: single R5 core's corresponding rproc instance
> > > - *
> > > - * allocate and add remoteproc carveouts for TCM memory based on cluster mode
> > > - *
> > > - * return 0 on success, otherwise non-zero value on failure
> > > - */
> > > -static int add_tcm_banks(struct rproc *rproc)
> > > -{
> > > -   struct zynqmp_r5_cluster *cluster;
> > > -   struct zynqmp_r5_core *r5_core;
> > > -   struct device *dev;
> > > -
> > > -   r5_core = rproc->priv;
> > > -   if (!r5_core)
> > > -           return -EINVAL;
> > > -
> > > -   dev = r5_core->dev;
> > > -
> > > -   cluster = dev_get_drvdata(dev->parent);
> > > -   if (!cluster) {
> > > -           dev_err(dev->parent, "Invalid driver data\n");
> > > -           return -EINVAL;
> > > -   }
> > > -
> > > -   /*
> > > -    * In lockstep mode TCM banks are one contiguous memory region of 256Kb
> > > -    * In split mode, each TCM bank is 64Kb and not contiguous.
> > > -    * We add memory carveouts accordingly.
> > > -    */
> > > -   if (cluster->mode == SPLIT_MODE)
> > > -           return add_tcm_carveout_split_mode(rproc);
> > > -   else if (cluster->mode == LOCKSTEP_MODE)
> > > -           return add_tcm_carveout_lockstep_mode(rproc);
> > > -
> > > -   return -EINVAL;
> > > -}
> > > -
> > >  /*
> > >   * zynqmp_r5_parse_fw()
> > >   * @rproc: single R5 core's corresponding rproc instance
> > > --
> > > 2.25.1
> > >
