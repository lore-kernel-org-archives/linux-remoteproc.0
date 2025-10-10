Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392791BFE00;
	Fri, 10 Oct 2025 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760085916; cv=none; b=k7xQP15Q92FC4dxhobvisFjzCJVj/rNsuyswTHL7UGikksdiIGPjbRB6p5HuPFVW03Dv8ridM3cHK8H6aDuCl5jm84pNNjqrKRPhXmOggb134MCggRaEsHFNamAvHFMaUre9ZUwh402gCpfr1Jzq3P8sIlwZ0a9A+DwVqVqf+eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760085916; c=relaxed/simple;
	bh=0hkmzo9sEM+b8slOw7f3y38WOERUTTPFFZDlRrSW4l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHL0937TQ7Y81yyb45k6QoxWWwIS+bIG0cwkwTp92OwQuXSLfgBlW8EMN07QvRiJqms7CFZSwUzYRGSAGy4KCLsyvulwWGTw0FkK4qePcfA4I7DDYYjzmdhVwpcMb7d1rbw2UNeJfzdnrPDIgb+RnCr+fDYPr6/JmhnqQoG/6nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UT31UluM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UT31UluM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760085915; x=1791621915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0hkmzo9sEM+b8slOw7f3y38WOERUTTPFFZDlRrSW4l0=;
  b=UT31UluM8O82/xS0IekHi7sBPEmqvh6HRzy8qqpMfLRofF3xwshAGyNu
   Ak4PC5h8UXLiE/YAJ4nIrOmAhfG0mMw9HCW+z1vy+e2amFy+MPxuizX1t
   fX70OBm81JFtOvDalhCS3OBQwludigUzD9jSw0ypjctINvQbOp69vxGfG
   dg0PZXxtEgIc8vVAlSJAp7gUSGytVkRw8620FVl9uoBYixymV/rULRNfE
   BcPuO6TEr4qWbXWbNmApf0gbhJ50H6kqhVpYdKGhKyWqoPaPwaDvjD1Vs
   8a95nrSfFOf8Sndv1rXSgQoa2eeMXFiuc5lgghih5k8GKpljhSvYw6xyL
   Q==;
X-CSE-ConnectionGUID: jz4G5vukQEaPRg/2iS+TiA==
X-CSE-MsgGUID: 22XwNrpTRzyhqHfUkpOtLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62245334"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62245334"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 01:45:14 -0700
X-CSE-ConnectionGUID: zT/Oa/p/ThS6t0xITBCewQ==
X-CSE-MsgGUID: XTZn9jzPTyO0L3xrCuO3mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180034733"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2025 01:45:11 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v78kO-0002Tv-1m;
	Fri, 10 Oct 2025 08:45:08 +0000
Date: Fri, 10 Oct 2025 16:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Andrew Davis <afd@ti.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 6/6] remoteproc: core: Consolidate bool flags into 1-bit
 bitfields
Message-ID: <202510101653.wulDfnoN-lkp@intel.com>
References: <20251005-remoteproc-cleanup-v1-6-09a9fdea0063@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005-remoteproc-cleanup-v1-6-09a9fdea0063@nxp.com>

Hi Peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3b9b1f8df454caa453c7fb07689064edb2eda90a]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan/remoteproc-core-Drop-redundant-initialization-of-ret-in-rproc_shutdown/20251010-012012
base:   3b9b1f8df454caa453c7fb07689064edb2eda90a
patch link:    https://lore.kernel.org/r/20251005-remoteproc-cleanup-v1-6-09a9fdea0063%40nxp.com
patch subject: [PATCH 6/6] remoteproc: core: Consolidate bool flags into 1-bit bitfields
config: riscv-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101653.wulDfnoN-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101653.wulDfnoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101653.wulDfnoN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_probe':
>> drivers/remoteproc/stm32_rproc.c:860:42: error: cannot take address of bit-field 'auto_boot'
     860 |  ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
         |                                          ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +/auto_boot +860 drivers/remoteproc/stm32_rproc.c

376ffdc044568f Mathieu Poirier  2020-07-14  832  
13140de09cc2dd Fabien Dessenne  2019-05-14  833  static int stm32_rproc_probe(struct platform_device *pdev)
13140de09cc2dd Fabien Dessenne  2019-05-14  834  {
13140de09cc2dd Fabien Dessenne  2019-05-14  835  	struct device *dev = &pdev->dev;
13140de09cc2dd Fabien Dessenne  2019-05-14  836  	struct stm32_rproc *ddata;
13140de09cc2dd Fabien Dessenne  2019-05-14  837  	struct device_node *np = dev->of_node;
710028a2e4d76c Arnaud Pouliquen 2025-03-27  838  	const char *fw_name;
13140de09cc2dd Fabien Dessenne  2019-05-14  839  	struct rproc *rproc;
376ffdc044568f Mathieu Poirier  2020-07-14  840  	unsigned int state;
13140de09cc2dd Fabien Dessenne  2019-05-14  841  	int ret;
13140de09cc2dd Fabien Dessenne  2019-05-14  842  
13140de09cc2dd Fabien Dessenne  2019-05-14  843  	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
13140de09cc2dd Fabien Dessenne  2019-05-14  844  	if (ret)
13140de09cc2dd Fabien Dessenne  2019-05-14  845  		return ret;
13140de09cc2dd Fabien Dessenne  2019-05-14  846  
710028a2e4d76c Arnaud Pouliquen 2025-03-27  847  	/* Look for an optional firmware name */
710028a2e4d76c Arnaud Pouliquen 2025-03-27  848  	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
710028a2e4d76c Arnaud Pouliquen 2025-03-27  849  	if (ret < 0 && ret != -EINVAL)
710028a2e4d76c Arnaud Pouliquen 2025-03-27  850  		return ret;
710028a2e4d76c Arnaud Pouliquen 2025-03-27  851  
710028a2e4d76c Arnaud Pouliquen 2025-03-27  852  	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, fw_name, sizeof(*ddata));
13140de09cc2dd Fabien Dessenne  2019-05-14  853  	if (!rproc)
13140de09cc2dd Fabien Dessenne  2019-05-14  854  		return -ENOMEM;
13140de09cc2dd Fabien Dessenne  2019-05-14  855  
8210fc873d2f1a Mathieu Poirier  2020-07-14  856  	ddata = rproc->priv;
8210fc873d2f1a Mathieu Poirier  2020-07-14  857  
3898fc99d19934 Clement Leger    2020-04-10  858  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
8210fc873d2f1a Mathieu Poirier  2020-07-14  859  
8210fc873d2f1a Mathieu Poirier  2020-07-14 @860  	ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
8210fc873d2f1a Mathieu Poirier  2020-07-14  861  	if (ret)
8210fc873d2f1a Mathieu Poirier  2020-07-14  862  		goto free_rproc;
8210fc873d2f1a Mathieu Poirier  2020-07-14  863  
95e32f868aa67c Mathieu Poirier  2020-07-14  864  	ret = stm32_rproc_of_memory_translations(pdev, ddata);
95e32f868aa67c Mathieu Poirier  2020-07-14  865  	if (ret)
95e32f868aa67c Mathieu Poirier  2020-07-14  866  		goto free_rproc;
95e32f868aa67c Mathieu Poirier  2020-07-14  867  
376ffdc044568f Mathieu Poirier  2020-07-14  868  	ret = stm32_rproc_get_m4_status(ddata, &state);
376ffdc044568f Mathieu Poirier  2020-07-14  869  	if (ret)
376ffdc044568f Mathieu Poirier  2020-07-14  870  		goto free_rproc;
376ffdc044568f Mathieu Poirier  2020-07-14  871  
6e20a05104e55d Arnaud POULIQUEN 2021-03-12  872  	if (state == M4_STATE_CRUN)
376ffdc044568f Mathieu Poirier  2020-07-14  873  		rproc->state = RPROC_DETACHED;
376ffdc044568f Mathieu Poirier  2020-07-14  874  
13140de09cc2dd Fabien Dessenne  2019-05-14  875  	rproc->has_iommu = false;
714cf5e3846047 Arnaud Pouliquen 2019-10-25  876  	ddata->workqueue = create_workqueue(dev_name(dev));
714cf5e3846047 Arnaud Pouliquen 2019-10-25  877  	if (!ddata->workqueue) {
714cf5e3846047 Arnaud Pouliquen 2019-10-25  878  		dev_err(dev, "cannot create workqueue\n");
714cf5e3846047 Arnaud Pouliquen 2019-10-25  879  		ret = -ENOMEM;
dadbdb9c304c51 Mathieu Poirier  2020-07-14  880  		goto free_resources;
714cf5e3846047 Arnaud Pouliquen 2019-10-25  881  	}
13140de09cc2dd Fabien Dessenne  2019-05-14  882  
13140de09cc2dd Fabien Dessenne  2019-05-14  883  	platform_set_drvdata(pdev, rproc);
13140de09cc2dd Fabien Dessenne  2019-05-14  884  
4a56e423e0e19b Fabien Dessenne  2019-11-15  885  	ret = stm32_rproc_request_mbox(rproc);
4a56e423e0e19b Fabien Dessenne  2019-11-15  886  	if (ret)
8210fc873d2f1a Mathieu Poirier  2020-07-14  887  		goto free_wkq;
13140de09cc2dd Fabien Dessenne  2019-05-14  888  
13140de09cc2dd Fabien Dessenne  2019-05-14  889  	ret = rproc_add(rproc);
13140de09cc2dd Fabien Dessenne  2019-05-14  890  	if (ret)
13140de09cc2dd Fabien Dessenne  2019-05-14  891  		goto free_mb;
13140de09cc2dd Fabien Dessenne  2019-05-14  892  
13140de09cc2dd Fabien Dessenne  2019-05-14  893  	return 0;
13140de09cc2dd Fabien Dessenne  2019-05-14  894  
13140de09cc2dd Fabien Dessenne  2019-05-14  895  free_mb:
13140de09cc2dd Fabien Dessenne  2019-05-14  896  	stm32_rproc_free_mbox(rproc);
714cf5e3846047 Arnaud Pouliquen 2019-10-25  897  free_wkq:
714cf5e3846047 Arnaud Pouliquen 2019-10-25  898  	destroy_workqueue(ddata->workqueue);
dadbdb9c304c51 Mathieu Poirier  2020-07-14  899  free_resources:
dadbdb9c304c51 Mathieu Poirier  2020-07-14  900  	rproc_resource_cleanup(rproc);
13140de09cc2dd Fabien Dessenne  2019-05-14  901  free_rproc:
410119ee29b6c1 Fabien Dessenne  2019-08-26  902  	if (device_may_wakeup(dev)) {
410119ee29b6c1 Fabien Dessenne  2019-08-26  903  		dev_pm_clear_wake_irq(dev);
410119ee29b6c1 Fabien Dessenne  2019-08-26  904  		device_init_wakeup(dev, false);
410119ee29b6c1 Fabien Dessenne  2019-08-26  905  	}
13140de09cc2dd Fabien Dessenne  2019-05-14  906  	return ret;
13140de09cc2dd Fabien Dessenne  2019-05-14  907  }
13140de09cc2dd Fabien Dessenne  2019-05-14  908  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
