Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B13218800D;
	Sat, 26 Oct 2024 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729946769; cv=none; b=sDhZd+k2UZgtf0BSZlignx9VI5/2CEmF5ckKrYEayJ/CyyxPLCYdXSVO65L5h9+BRuctRt6VirxhzeFM7tE+zjFVBI2pVGUdstsibdAFDRKkxGUf41+VlU6vulWOr3DeX7b0IWzZyfa5s9Fni1hqiYUpx15r0W/7creGYqZCidA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729946769; c=relaxed/simple;
	bh=Ir8FkLHslMuuyZwduZxcZ09RxlFF0QcVt/0ML1tcSSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0KkJcnjHa+Mbax50tUUS2eyHHmHImsR0wZkgwsTVtySNrLegwausd8wxzhmktWKmPYn1uLpJOjiNekKc1F9p+kMdIlwe8N+2OxAU0rLjcWpus64WCAI/heofJYqmwkIEUlzQ+y+99FXncfbedA6UCftkyxPQkQKTWxNhk/fyqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlMHtpqF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlMHtpqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729946767; x=1761482767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ir8FkLHslMuuyZwduZxcZ09RxlFF0QcVt/0ML1tcSSw=;
  b=HlMHtpqFLwt6e5ZWfxn+QH2WpFirYi1P+0Li3exf9j1tPdLKveE4SPov
   suSbMcLKZHddzSar+rpXQGYXkw7pdmJRsZf5Pk9WYioSLWQrsAa3+0oo9
   1iBFH39G8n7v3M2d8z/UzLgbIXJhAsyN19CtQhNqkvFLXaPEUPLlmsWvV
   NoBLBFb64nGO88eKOtp3lIiyeG7VakZ4EbQC2etTxRraERbZ/BtmZg1e4
   ZNdl46pg5ppVoDsFcBCTm98cSiLQGgUdLmbzFdeeEEYv7JyVyriaRn8Sd
   PcMFQHkRSb6TgmP1tR58ePZfJaOoWLgsBPUBif5u7NneZn2VOlbSjb5u/
   Q==;
X-CSE-ConnectionGUID: BYK1S73LR4mIYGxs8GHGLg==
X-CSE-MsgGUID: VhOJIHZhSrOQEfOljF0zbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40707432"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40707432"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 05:46:07 -0700
X-CSE-ConnectionGUID: 9HSKHftfRgSHktAkkf+4bQ==
X-CSE-MsgGUID: ThDfStWoSiOeAgXlh2HKYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="82011344"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2024 05:46:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4gB6-000Zem-1Y;
	Sat, 26 Oct 2024 12:46:00 +0000
Date: Sat, 26 Oct 2024 20:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: Re: [PATCH v12 7/7] remoteproc: stm32: Add support of an OP-TEE TA
 to load the firmware
Message-ID: <202410262040.PWNrKv2Q-lkp@intel.com>
References: <20241025205924.2087768-8-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025205924.2087768-8-arnaud.pouliquen@foss.st.com>

Hi Arnaud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 42f7652d3eb527d03665b09edac47f85fb600924]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20241026-050443
base:   42f7652d3eb527d03665b09edac47f85fb600924
patch link:    https://lore.kernel.org/r/20241025205924.2087768-8-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v12 7/7] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241026/202410262040.PWNrKv2Q-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410262040.PWNrKv2Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410262040.PWNrKv2Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_probe':
>> drivers/remoteproc/stm32_rproc.c:904:21: warning: assignment to 'int' from 'struct rproc_tee *' makes integer from pointer without a cast [-Wint-conversion]
     904 |                 ret = rproc_tee_register(dev, rproc, proc_id);
         |                     ^
   drivers/remoteproc/stm32_rproc.c:963:30: error: passing argument 1 of 'rproc_tee_unregister' from incompatible pointer type [-Werror=incompatible-pointer-types]
     963 |         rproc_tee_unregister(rproc);
         |                              ^~~~~
         |                              |
         |                              struct rproc *
   In file included from drivers/remoteproc/stm32_rproc.c:21:
   include/linux/remoteproc_tee.h:59:58: note: expected 'struct rproc_tee *' but argument is of type 'struct rproc *'
      59 | static inline int rproc_tee_unregister(struct rproc_tee *trproc)
         |                                        ~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_remove':
   drivers/remoteproc/stm32_rproc.c:986:30: error: passing argument 1 of 'rproc_tee_unregister' from incompatible pointer type [-Werror=incompatible-pointer-types]
     986 |         rproc_tee_unregister(rproc);
         |                              ^~~~~
         |                              |
         |                              struct rproc *
   include/linux/remoteproc_tee.h:59:58: note: expected 'struct rproc_tee *' but argument is of type 'struct rproc *'
      59 | static inline int rproc_tee_unregister(struct rproc_tee *trproc)
         |                                        ~~~~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +904 drivers/remoteproc/stm32_rproc.c

   874	
   875	static int stm32_rproc_probe(struct platform_device *pdev)
   876	{
   877		struct device *dev = &pdev->dev;
   878		struct stm32_rproc *ddata;
   879		struct device_node *np = dev->of_node;
   880		struct rproc *rproc;
   881		unsigned int state;
   882		u32 proc_id;
   883		int ret;
   884	
   885		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
   886		if (ret)
   887			return ret;
   888	
   889		if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
   890			/*
   891			 * Delegate the firmware management to the secure context.
   892			 * The firmware loaded has to be signed.
   893			 */
   894			ret = of_property_read_u32(np, "st,proc-id", &proc_id);
   895			if (ret) {
   896				dev_err(dev, "failed to read st,rproc-id property\n");
   897				return ret;
   898			}
   899	
   900			rproc = devm_rproc_alloc(dev, np->name, &st_rproc_tee_ops, NULL, sizeof(*ddata));
   901			if (!rproc)
   902				return -ENOMEM;
   903	
 > 904			ret = rproc_tee_register(dev, rproc, proc_id);
   905			if (ret)
   906				return dev_err_probe(dev, ret,  "signed firmware not supported by TEE\n");
   907		} else {
   908			rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
   909			if (!rproc)
   910				return -ENOMEM;
   911		}
   912	
   913		ddata = rproc->priv;
   914	
   915		rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
   916	
   917		ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
   918		if (ret)
   919			goto free_rproc;
   920	
   921		ret = stm32_rproc_of_memory_translations(pdev, ddata);
   922		if (ret)
   923			goto free_rproc;
   924	
   925		ret = stm32_rproc_get_m4_status(ddata, &state);
   926		if (ret)
   927			goto free_rproc;
   928	
   929		if (state == M4_STATE_CRUN)
   930			rproc->state = RPROC_DETACHED;
   931	
   932		rproc->has_iommu = false;
   933		ddata->workqueue = create_workqueue(dev_name(dev));
   934		if (!ddata->workqueue) {
   935			dev_err(dev, "cannot create workqueue\n");
   936			ret = -ENOMEM;
   937			goto free_resources;
   938		}
   939	
   940		platform_set_drvdata(pdev, rproc);
   941	
   942		ret = stm32_rproc_request_mbox(rproc);
   943		if (ret)
   944			goto free_wkq;
   945	
   946		ret = rproc_add(rproc);
   947		if (ret)
   948			goto free_mb;
   949	
   950		return 0;
   951	
   952	free_mb:
   953		stm32_rproc_free_mbox(rproc);
   954	free_wkq:
   955		destroy_workqueue(ddata->workqueue);
   956	free_resources:
   957		rproc_resource_cleanup(rproc);
   958	free_rproc:
   959		if (device_may_wakeup(dev)) {
   960			dev_pm_clear_wake_irq(dev);
   961			device_init_wakeup(dev, false);
   962		}
   963		rproc_tee_unregister(rproc);
   964	
   965		return ret;
   966	}
   967	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
