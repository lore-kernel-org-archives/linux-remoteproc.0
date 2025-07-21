Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A9D2DECB4
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Jul 2025 15:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111611; cv=none; b=D3/zCZukCBlUFZ9dPhMCE0BPqk3U22BTYLqrPLONC9TX2ckaZmPrXPUgqbOOn04FeiHA8W07AXqet7CWxfYW1znUJvRbpJffS/815/l62H7nu0uMNrZ+KAdtcGr4ye/u2orTEWB3yy6YhmImfJljLTuI4sB5qk4sh/IiUGbJtP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111611; c=relaxed/simple;
	bh=0GbzMT4cxkh07IwyP3DdnTSFHzeiMjC2PgkP6D9ZjvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekZsGcwA4+FpXcO0vuIbLN4p1P8fiRh61oloScnkzG9gjQzQpyupLmOopbhOP0TdNrW0WaHzryY5qH/9AM6UUbxNxOg3bo/C/t2xxxKW6mPDgw5splCwq8LvDtiubEJeDCcAPWTxhXhw39axZpPL84jLnk+qct3PfMoWFOxu9X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mdrgcJ8E; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mdrgcJ8E"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23aeac7d77aso37203615ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Jul 2025 08:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753111609; x=1753716409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kLR1wp04znb7ganRU49PBBxXl6E5Pbigx4KLe0tUHgw=;
        b=mdrgcJ8Ezl/clxryyuQ1CgB0KTmz3asdP6A5o3HfykB+5kTJuSippBBDq8ShZ97vbH
         ouBxsx9KFIpOMXK2Ev/vDZvTGhVaA85fdcyKJHhIuksKU16OMOasipW4//1/kYSFjKaw
         NXYTZ4VniUBENguG0pKMpcfrFV9LA6iJxHaKvuBNev7fQ6jY47GOr7BH96KCnXjPaBGd
         CelpAT9zN+ySgSf7u0nGQydwJbD8elznm9+vjnepfQ5tCrLuVxRGJrS9MzQydbWjQqzM
         M9WeVPsnFML4Kz1G72xrlchOrIOSb0EeR7NuZE/YC15Z+rr8/u88BOrKnXpDX0NvPiLC
         LI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753111609; x=1753716409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLR1wp04znb7ganRU49PBBxXl6E5Pbigx4KLe0tUHgw=;
        b=iY+0AL/18z6ydf/qdcN7BTHDLDR1rFnNSAQ4w+xwqYRtHIdhmGGTMiLPyFBeSTHHjc
         uuV152RU/vjH0l5pF0TnxAV9FFdU/bQXVIxMeLZIxGjUWKapq+05ZWSdS1WpV6BLJq+/
         lFEVc7blXFM1Ek+kcqxRmDfv5k6ik/t0fFYAFmsIbc809NgmTHFrLHCrc38BEAvaGOb3
         jdsXJoveE/Cs6kCLIFL9ta5hKhLrFm0qJWeT7K3aLsi+wR4AEpoZqDblx0/tYgV++sjN
         abZDk4z0tmewb9VumGfvXZ7OaM6W4f+ZL2QKtaSIWmq8FMRGSGwte3Un6+qpLh8T2B9U
         daTA==
X-Forwarded-Encrypted: i=1; AJvYcCWIo2wZ3slrcb0NOsJjp3ckpuDNIwfc1joABW+nlhrawN8dvENWY6KDJe3c/rd9wdVOePCU77jb437OD2GFaVCY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9guJ+mAzkfJiXX3ucTs5FDSkBajV9LqveZnnuH6lAoib2oIt4
	qgeAAp8t/IqhcWfV2IhngFmo9VveNUOHDhXFV0VQDyZBxZKpb9WW0BOjUyEVnbtIz8M=
X-Gm-Gg: ASbGnct+zV7ZOnoBOX7CBkdQMTKklVM3mFsYEROFW1NQYd6xrMIWiawGI5eK+PYWBO6
	3Mwd3ujjeBnq3VQDZ60AXs4P5Zp48+jHHl6okDO4qLeEc7FMLUN7/u9/50PV4iwbl0hnO+3DoiV
	PnU4+LmKqF8Zx/nbRtTS2FtasyXlpSgkRmVw26yUAT26CHr4HEXwWK66Q7/3QIqMLUPZj9aYZ/X
	IyeIM6jX25wol3f9GtDuVIKL8haiHU4UWjogJSh9Wd9QR20dEVx3y1Viauxluxtk5lNjmziTgoB
	gi+JUjkbcpn55NpCpjZjJOTuH2kkxpkeNvITG3FT0uklAiFiSpqcYEldlcJE4oXoN0b85M+1SLd
	YoiYKG3jXo4hkjcmVJf76S2I+Hw==
X-Google-Smtp-Source: AGHT+IGZq5M24ox2EWye60cGVP1R1oggzOracSjmWPc1HuG98tMs47u97doXLxqik3MWrc6Y1CEeLQ==
X-Received: by 2002:a17:902:c405:b0:236:7333:f183 with SMTP id d9443c01a7336-23e24f4a679mr296932965ad.19.1753111608652;
        Mon, 21 Jul 2025 08:26:48 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8fb5:9396:b7cf:1f69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e4918sm60080235ad.41.2025.07.21.08.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 08:26:48 -0700 (PDT)
Date: Mon, 21 Jul 2025 09:26:45 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: xlnx: disable unsupported features
Message-ID: <aH5cNYY8_ai2xvY7@p14s>
References: <20250716213048.2316424-1-tanmay.shah@amd.com>
 <20250716213048.2316424-2-tanmay.shah@amd.com>
 <20250721065724.GC4844@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721065724.GC4844@nxa18884-linux.ap.freescale.net>

On Mon, Jul 21, 2025 at 02:57:24PM +0800, Peng Fan wrote:
> On Wed, Jul 16, 2025 at 02:30:47PM -0700, Tanmay Shah wrote:
> >AMD-Xilinx platform driver does not support iommu or recovery mechanism
> >yet. Disable both features in platform driver.
> >
> >Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >---
> > drivers/remoteproc/xlnx_r5_remoteproc.c | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> >diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >index a51523456c6e..0ffd26a47685 100644
> >--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >@@ -938,6 +938,8 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> > 
> > 	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
> > 
> >+	r5_rproc->recovery_disabled = true;
> 
> This does not block sysfs write if my understanding is correct.
> recovery_store does not do any check. So even you set it to true,
> user could still write sysfs to set to false.

That is the case for all drivers and not specific to this one.  

> 
> >+	r5_rproc->has_iommu = false;
> 
> The default value should already be false. Is there a need to
> set it to false?

I never mind to see things set explicitly.  

> 
> Regards,
> Peng
> 
> > 	r5_rproc->auto_boot = false;
> > 	r5_core = r5_rproc->priv;
> > 	r5_core->dev = cdev;
> >-- 
> >2.34.1
> >
