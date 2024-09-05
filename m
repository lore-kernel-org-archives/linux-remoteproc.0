Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9065A1A01C8
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Sep 2024 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725553807; cv=none; b=DFN6dbyshkzkcjNI1EyYPnVdRote8s8GN8sdgwpTE1bPcHSMRZXFIlcF0RSh2dpBGDesILu1W2ju4X44PXXZ6lPgdZLmJxXsAJb5ucNz23flaxsqvds9RULZeKLvAmTLI1/RtxtXel1UYHic+XdLGDR2O90Yx5PYdd00vU3EUx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725553807; c=relaxed/simple;
	bh=ewW/+HHsrnJnn9N/zylEmn3HSFueMu87odTJ6fPc35s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qN3m0OVonoMREsdyKMiReIZQfgcHWaqSrpiG4T4o2JICFEW2JYCmsq1VIKosBF/y+qi10zG+HSalXKas+J3Xtf50Uw0mHgiXhnzDdKfcnYdjBRiPOXMeybt75LfShRQd9pppuG2EzDzzYqfMBonA5vbaR68cJt6X65UWw8Hy6m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d+0zFL0Q; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d+0zFL0Q"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d889ba25f7so731221a91.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Sep 2024 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725553805; x=1726158605; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fK2tcPvp6z1T0kx7siP1rsu/1SO2djAS6BuLCRKvegs=;
        b=d+0zFL0QkxB7k1sbYpaY++Y8oNL4hTpQvHVynn4mE/8ojOie5uom54Nc0eGg4PakMt
         uEP21cZ6uXzdQm935H+aDDYxWgy+dFU714E1IbhNf7+JJKi/oKmEeoU9tocNcLf1ya3a
         68rK4SI3sDSlmLsah4sJepbYdp2kb9cH75gbiCwE08nh0ZgphxcTnRxQcTA84DXabzQk
         8eNG2PXHsKPZ28VDLAwWgdeeqHN9N4q54p9p7KXlKTwZFonDbDIPgzo/Soa6RDgVlhNh
         voWjPeH8W/uw39506jorc2D7Apchf9I7YitD7/y97e/E1z+4GePl9DkdwKJYd9XEHH+l
         kamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725553805; x=1726158605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fK2tcPvp6z1T0kx7siP1rsu/1SO2djAS6BuLCRKvegs=;
        b=uBNYfXTzdB/0Ro9tOl1sPpEnREUxVE3mYV1LVbIndkHH83oFDzx2Lofzm3/nuBxeHr
         bMMARpN54zg0AI9UsWNT193J7FLjpNmuuXvDpvM2Z4MJ7VpNYJ8oapcr+eBgUUPfVShR
         8TaVLgOO0CUXVrRSaLcMWNU+1TuBgS5fpmSg8l7kfEvFMqPbB9Nf1Z6Oif2SlPkXtyy1
         RP130SmSjWRHXXVfmKsIov2VRdDZ/ksgSddCwYwZLo1wOKBB2gGEJU3//GTcsYRn7j90
         q5R8NkgBpc37CSB1R01uyVHSRRV0polGM3i0Hc11pGT4j1xKFagf7udeZa/rSTFG3sj9
         JGTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDifEFgAm0t5btP5UzULjNIm9BG5YLiFSwik6HDsFYyactpkCw+R+8XRAdKK2xsvY82hVujH3E8SOcF1R5anEw@vger.kernel.org
X-Gm-Message-State: AOJu0YxGDDQGgoTRvs75DYQBxysaBzYR9TY8dzesaOMN5Q8lMZOaOWsd
	IWC0oIFp9ELl/Psdkz/1Qd9CTpJP5FVp6ER8ZzveQLrwyeE8xCEKJNY8vl6mw02b+VUOUsbJ7qo
	y
X-Google-Smtp-Source: AGHT+IGA6vjdBi9Qx+RYP5WPHFmnWYTKVNvEt4HPlXJ8FJcDIitpPw1y27CGeoOVJ9UyruCwyGh4GQ==
X-Received: by 2002:a17:90a:e2c9:b0:2d8:9253:dffc with SMTP id 98e67ed59e1d1-2d8972c0003mr17070801a91.19.1725553804841;
        Thu, 05 Sep 2024 09:30:04 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3b5d:f081:c58f:f7e2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8c7f91919sm9481168a91.53.2024.09.05.09.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 09:30:04 -0700 (PDT)
Date: Thu, 5 Sep 2024 10:30:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Shah, Tanmay" <tanmay.shah@amd.com>
Cc: "andersson@kernel.org" <andersson@kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] remoteproc: xlnx: add sram support
Message-ID: <ZtncieemyQUgXNA+@p14s>
References: <20240830173735.279432-1-tanmay.shah@amd.com>
 <ZtiI98P/ipMkwMh1@p14s>
 <B725BD31-1A34-42A2-ABFD-02828EFE5131@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B725BD31-1A34-42A2-ABFD-02828EFE5131@amd.com>

On Wed, Sep 04, 2024 at 06:16:47PM +0000, Shah, Tanmay wrote:
> Hi Mathieu,
> 
> I agree with your assessment, and I agree with your proposal.
> I appreciate you fixing the patch before applying.
>

I have applied this patch.

> My email client (Thunderbird) has some issues, hence sending email form different email
> client and so not formatted as expected. This will be fixed soon (before sending anymore patches).
> 
> Thanks,
> Tanmay
> 
> ﻿On 9/4/24, 11:21 AM, "Mathieu Poirier" <mathieu.poirier@linaro.org <mailto:mathieu.poirier@linaro.org>> wrote:
> 
> 
> Good morning,
> 
> 
> On Fri, Aug 30, 2024 at 10:37:36AM -0700, Tanmay Shah wrote:
> > AMD-Xilinx zynqmp platform contains on-chip sram memory (OCM).
> > R5 cores can access OCM and access is faster than DDR memory but slower
> > than TCM memories available. Sram region can have optional multiple
> > power-domains. Platform management firmware is responsible
> > to operate these power-domains.
> > 
> > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com <mailto:tanmay.shah@amd.com>>
> > ---
> > 
> > Changes in v5:
> > - remoteproc: xlnx: remove genpool use for OCM sram
> > 
> > Changes in v4:
> > - Free previously allocalted genpool if adding carveouts fail for any
> > sram.
> > - add comment about sram size used in creating carveouts.
> > 
> > Changes in v3:
> > - make @sram an array rather than an array of pointers
> > - fix of_node_put usage to maintain proper refcount of node
> > - s/proprty/property
> > - Use gen pool framework for mapping sram address space.
> > 
> > Changes in v2:
> > - Expand commit message with power-domains related information.
> > 
> > 
> > drivers/remoteproc/xlnx_r5_remoteproc.c | 135 ++++++++++++++++++++++++
> > 1 file changed, 135 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > index 2cea97c746fd..af4e0e53dc9d 100644
> > --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> > +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > @@ -56,6 +56,17 @@ struct mem_bank_data {
> > char *bank_name;
> > };
> > 
> > +/**
> > + * struct zynqmp_sram_bank - sram bank description
> > + *
> > + * @sram_res: sram address region information
> > + * @da: device address of sram
> > + */
> > +struct zynqmp_sram_bank {
> > + struct resource sram_res;
> > + u32 da;
> > +};
> > +
> > /**
> > * struct mbox_info
> > *
> > @@ -120,6 +131,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
> > * struct zynqmp_r5_core
> > *
> > * @rsc_tbl_va: resource table virtual address
> > + * @sram: Array of sram memories assigned to this core
> > + * @num_sram: number of sram for this core
> > * @dev: device of RPU instance
> > * @np: device node of RPU instance
> > * @tcm_bank_count: number TCM banks accessible to this RPU
> > @@ -131,6 +144,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
> > */
> > struct zynqmp_r5_core {
> > void __iomem *rsc_tbl_va;
> > + struct zynqmp_sram_bank *sram;
> > + int num_sram;
> > struct device *dev;
> > struct device_node *np;
> > int tcm_bank_count;
> > @@ -494,6 +509,45 @@ static int add_mem_regions_carveout(struct rproc *rproc)
> > return 0;
> > }
> > 
> > +static int add_sram_carveouts(struct rproc *rproc)
> > +{
> > + struct zynqmp_r5_core *r5_core = rproc->priv;
> > + struct rproc_mem_entry *rproc_mem;
> > + struct zynqmp_sram_bank *sram;
> > + dma_addr_t dma_addr;
> > + size_t len;
> > + int da, i;
> > +
> > + for (i = 0; i < r5_core->num_sram; i++) {
> > + sram = &r5_core->sram[i];
> > +
> > + dma_addr = (dma_addr_t)sram->sram_res.start;
> > +
> > + len = resource_size(&sram->sram_res);
> > + da = sram->da;
> > +
> > + rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
> > + (dma_addr_t)dma_addr,
> 
> 
> @dma_addr is already declared as a dma_addr_t, which is what
> rproc_mem_entry_init() is expecting. As such I do not see a reason for the
> extra casting - do you?
> 
> 
> If you agree with my assessment I am proposing to remove it before applying the
> patch rather than having to send another revision.
> 
> 
> Let me know what you think.
> 
> 
> Thanks,
> Mathieu
> 
> 
> > + len, da,
> > + zynqmp_r5_mem_region_map,
> > + zynqmp_r5_mem_region_unmap,
> > + sram->sram_res.name);
> > + if (!rproc_mem) {
> > + dev_err(&rproc->dev, "failed to add sram %s da=0x%x, size=0x%lx",
> > + sram->sram_res.name, da, len);
> > + return -ENOMEM;
> > + }
> > +
> > + rproc_add_carveout(rproc, rproc_mem);
> > + rproc_coredump_add_segment(rproc, da, len);
> > +
> > + dev_dbg(&rproc->dev, "sram carveout %s addr=%llx, da=0x%x, size=0x%lx",
> > + sram->sram_res.name, dma_addr, da, len);
> > + }
> > +
> > + return 0;
> > +}
> > +
> > /*
> > * tcm_mem_unmap()
> > * @rproc: single R5 core's corresponding rproc instance
> > @@ -669,6 +723,12 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
> > return ret;
> > }
> > 
> > + ret = add_sram_carveouts(rproc);
> > + if (ret) {
> > + dev_err(&rproc->dev, "failed to get sram carveout %d\n", ret);
> > + return ret;
> > + }
> > +
> > return 0;
> > }
> > 
> > @@ -881,6 +941,77 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> > return ERR_PTR(ret);
> > }
> > 
> > +static int zynqmp_r5_get_sram_banks(struct zynqmp_r5_core *r5_core)
> > +{
> > + struct device_node *np = r5_core->np;
> > + struct device *dev = r5_core->dev;
> > + struct zynqmp_sram_bank *sram;
> > + struct device_node *sram_np;
> > + int num_sram, i, ret;
> > + u64 abs_addr, size;
> > +
> > + /* "sram" is optional property. Do not fail, if unavailable. */
> > + if (!of_property_present(r5_core->np, "sram"))
> > + return 0;
> > +
> > + num_sram = of_property_count_elems_of_size(np, "sram", sizeof(phandle));
> > + if (num_sram <= 0) {
> > + dev_err(dev, "Invalid sram property, ret = %d\n",
> > + num_sram);
> > + return -EINVAL;
> > + }
> > +
> > + sram = devm_kcalloc(dev, num_sram,
> > + sizeof(struct zynqmp_sram_bank), GFP_KERNEL);
> > + if (!sram)
> > + return -ENOMEM;
> > +
> > + for (i = 0; i < num_sram; i++) {
> > + sram_np = of_parse_phandle(np, "sram", i);
> > + if (!sram_np) {
> > + dev_err(dev, "failed to get sram %d phandle\n", i);
> > + return -EINVAL;
> > + }
> > +
> > + if (!of_device_is_available(sram_np)) {
> > + dev_err(dev, "sram device not available\n");
> > + ret = -EINVAL;
> > + goto fail_sram_get;
> > + }
> > +
> > + ret = of_address_to_resource(sram_np, 0, &sram[i].sram_res);
> > + if (ret) {
> > + dev_err(dev, "addr to res failed\n");
> > + goto fail_sram_get;
> > + }
> > +
> > + /* Get SRAM device address */
> > + ret = of_property_read_reg(sram_np, i, &abs_addr, &size);
> > + if (ret) {
> > + dev_err(dev, "failed to get reg property\n");
> > + goto fail_sram_get;
> > + }
> > +
> > + sram[i].da = (u32)abs_addr;
> > +
> > + of_node_put(sram_np);
> > +
> > + dev_dbg(dev, "sram %d: name=%s, addr=0x%llx, da=0x%x, size=0x%llx\n",
> > + i, sram[i].sram_res.name, sram[i].sram_res.start,
> > + sram[i].da, resource_size(&sram[i].sram_res));
> > + }
> > +
> > + r5_core->sram = sram;
> > + r5_core->num_sram = num_sram;
> > +
> > + return 0;
> > +
> > +fail_sram_get:
> > + of_node_put(sram_np);
> > +
> > + return ret;
> > +}
> > +
> > static int zynqmp_r5_get_tcm_node_from_dt(struct zynqmp_r5_cluster *cluster)
> > {
> > int i, j, tcm_bank_count, ret, tcm_pd_idx, pd_count;
> > @@ -1095,6 +1226,10 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
> > return ret;
> > }
> > }
> > +
> > + ret = zynqmp_r5_get_sram_banks(r5_core);
> > + if (ret)
> > + return ret;
> > }
> > 
> > return 0;
> > 
> > base-commit: 057e5c17e29fe67fae4c2786d558c31fd3b106ba
> > -- 
> > 2.25.1
> > 
> 
> 
> 
