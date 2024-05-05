Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D74F13FD9A;
	Sun,  5 May 2024 23:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714952913; cv=none; b=q2hOm7N8DPB6GLHiw21h/ojr9ZXrGdevufPkKwGD70W6xcmix/JmcHr9UGc6SKm5dJGAOYtLgPxpVmhoFP3qGnQ9bwpBZadjrzgsRDkVIe7QWoLg1ptsR55rLz5ybRWEAhSz2AzaCBI9cL4gYI7M8ev+i/NgJ31YOOnxx5PGxbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714952913; c=relaxed/simple;
	bh=OlsWW3H2jfME86ICMK4S0BOTbn/IaLynpE4Luba9O4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUlmS+Me8v3JsmNGs7uTptJAkaqoGAbWfTB6psdAjjeLpYo4bH1E8nAWQOcOJOcLliUIKgPYV8AiyJMHUQm3NpnPjZeRC+tLpYrB0Oyd+N/BKx+scO6UCTu37lZBSrxiP5M6KtBWEVENz4TPyDowXZ23VVuTbulq9sLM1y7jaFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeeL7fFh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeeL7fFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714952908; x=1746488908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OlsWW3H2jfME86ICMK4S0BOTbn/IaLynpE4Luba9O4I=;
  b=HeeL7fFhpabo3xWKijUJV9OvhDv5Pu542PbVTEbswmK47Ey4ek/lxEVW
   1HQgwYPoLYXwfnQFqkeUpdZHiyGLAUp75rhg9UONyzg7e2BPUrn3MugS7
   8dHmDchiQ44/+XdcFfZFPpW4dR1VFm4JTD5KRdWE9/GBm0LB6kGSOyZ0T
   /ysDge7ia1aXfA+bXrGyDStmOZyUOQTJl3TzOF8FebP/yiisxEA8P5YoJ
   TOXiTw98ZZnf2d2QTjUT+kXPNuxShuM2Guiaxc+bvO/k8o9dWKLYzYRMh
   SaBRSZkb3qZ8Fag6Vc9N8Pyoo4YamRICSrPHiK+liy5nvnsPmYy2+kJbA
   g==;
X-CSE-ConnectionGUID: zbbOITm7QYSQqUjhAjerWg==
X-CSE-MsgGUID: Q2RtISRCQCeG+sR4T21CVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14470041"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="14470041"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 16:48:27 -0700
X-CSE-ConnectionGUID: 4HLrUydASaqzR3zVhn/NHQ==
X-CSE-MsgGUID: 28/LfuAERjqxoJZWArEAFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28568782"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 May 2024 16:48:25 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3lag-0000Hc-14;
	Sun, 05 May 2024 23:48:22 +0000
Date: Mon, 6 May 2024 07:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tanmay Shah <tanmay.shah@amd.com>
Subject: Re: [PATCH 2/2] drivers: remoteproc: xlnx: add sram support
Message-ID: <202405060759.yyzLUQXP-lkp@intel.com>
References: <20240502231021.370047-3-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502231021.370047-3-tanmay.shah@amd.com>

Hi Tanmay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0496190c4d42965acb31b9da1b6dac3509791062]

url:    https://github.com/intel-lab-lkp/linux/commits/Tanmay-Shah/drivers-remoteproc-xlnx-add-attach-detach-support/20240503-071225
base:   0496190c4d42965acb31b9da1b6dac3509791062
patch link:    https://lore.kernel.org/r/20240502231021.370047-3-tanmay.shah%40amd.com
patch subject: [PATCH 2/2] drivers: remoteproc: xlnx: add sram support
config: arm64-randconfig-r113-20240506 (https://download.01.org/0day-ci/archive/20240506/202405060759.yyzLUQXP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240506/202405060759.yyzLUQXP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060759.yyzLUQXP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/xlnx_r5_remoteproc.c:423:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:604:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:827:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct rsc_tbl_data *rsc_data_va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/xlnx_r5_remoteproc.c:827:21: sparse:     expected struct rsc_tbl_data *rsc_data_va
   drivers/remoteproc/xlnx_r5_remoteproc.c:827:21: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/xlnx_r5_remoteproc.c:844:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct resource_table *rsc_addr @@     got void [noderef] __iomem * @@
   drivers/remoteproc/xlnx_r5_remoteproc.c:844:18: sparse:     expected struct resource_table *rsc_addr
   drivers/remoteproc/xlnx_r5_remoteproc.c:844:18: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/xlnx_r5_remoteproc.c:898:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got struct resource_table *rsc_tbl_va @@
   drivers/remoteproc/xlnx_r5_remoteproc.c:898:24: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/xlnx_r5_remoteproc.c:898:24: sparse:     got struct resource_table *rsc_tbl_va
>> drivers/remoteproc/xlnx_r5_remoteproc.c:995:26: sparse: sparse: Using plain integer as NULL pointer

vim +995 drivers/remoteproc/xlnx_r5_remoteproc.c

   798	
   799	static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
   800	{
   801		struct device *dev = r5_core->dev;
   802		struct rsc_tbl_data *rsc_data_va;
   803		struct resource_table *rsc_addr;
   804		struct resource res_mem;
   805		struct device_node *np;
   806		int ret;
   807	
   808		/**
   809		 * It is expected from remote processor firmware to provide resource
   810		 * table address via struct rsc_tbl_data data structure.
   811		 * Start address of first entry under "memory-region" property list
   812		 * contains that data structure which holds resource table address, size
   813		 * and some magic number to validate correct resource table entry.
   814		 */
   815		np = of_parse_phandle(r5_core->np, "memory-region", 0);
   816		if (!np) {
   817			dev_err(dev, "failed to get memory region dev node\n");
   818			return -EINVAL;
   819		}
   820	
   821		ret = of_address_to_resource(np, 0, &res_mem);
   822		if (ret) {
   823			dev_err(dev, "failed to get memory-region resource addr\n");
   824			return -EINVAL;
   825		}
   826	
 > 827		rsc_data_va = devm_ioremap_wc(dev, res_mem.start,
   828					      sizeof(struct rsc_tbl_data));
   829		if (!rsc_data_va) {
   830			dev_err(dev, "failed to map resource table data address\n");
   831			return -EIO;
   832		}
   833	
   834		/**
   835		 * If RSC_TBL_XLNX_MAGIC number and its complement isn't found then
   836		 * do not consider resource table address valid and don't attach
   837		 */
   838		if (rsc_data_va->magic_num != RSC_TBL_XLNX_MAGIC ||
   839		    rsc_data_va->comp_magic_num != ~RSC_TBL_XLNX_MAGIC) {
   840			dev_dbg(dev, "invalid magic number, won't attach\n");
   841			return -EINVAL;
   842		}
   843	
   844		rsc_addr = ioremap_wc(rsc_data_va->rsc_tbl,
   845				      rsc_data_va->rsc_tbl_size);
   846		if (!rsc_addr) {
   847			dev_err(dev, "failed to get rsc_addr\n");
   848			return -EINVAL;
   849		}
   850	
   851		/**
   852		 * As of now resource table version 1 is expected. Don't fail to attach
   853		 * but warn users about it.
   854		 */
   855		if (rsc_addr->ver != 1)
   856			dev_warn(dev, "unexpected resource table version %d\n",
   857				 rsc_addr->ver);
   858	
   859		r5_core->rsc_tbl_size = rsc_data_va->rsc_tbl_size;
   860		r5_core->rsc_tbl_va = rsc_addr;
   861	
   862		return 0;
   863	}
   864	
   865	static int zynqmp_r5_attach(struct rproc *rproc)
   866	{
   867		struct zynqmp_r5_core *r5_core = rproc->priv;
   868		int i, pm_domain_id, ret;
   869	
   870		/*
   871		 * Firmware is loaded in TCM. Request TCM power domains to notify
   872		 * platform management controller that TCM is in use. This will be
   873		 * released during unprepare callback.
   874		 */
   875		for (i = 0; i < r5_core->tcm_bank_count; i++) {
   876			pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
   877			ret = zynqmp_pm_request_node(pm_domain_id,
   878						     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
   879						     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
   880			if (ret < 0)
   881				pr_warn("TCM %d can't be requested\n", i);
   882		}
   883	
   884		return 0;
   885	}
   886	
   887	static int zynqmp_r5_detach(struct rproc *rproc)
   888	{
   889		struct zynqmp_r5_core *r5_core = rproc->priv;
   890	
   891		/*
   892		 * Generate last notification to remote after clearing virtio flag.
   893		 * Remote can avoid polling on virtio reset flag if kick is generated
   894		 * during detach by host and check virtio reset flag on kick interrupt.
   895		 */
   896		zynqmp_r5_rproc_kick(rproc, 0);
   897	
   898		iounmap(r5_core->rsc_tbl_va);
   899		r5_core->rsc_tbl_va = NULL;
   900	
   901		return 0;
   902	}
   903	
   904	static const struct rproc_ops zynqmp_r5_rproc_ops = {
   905		.prepare	= zynqmp_r5_rproc_prepare,
   906		.unprepare	= zynqmp_r5_rproc_unprepare,
   907		.start		= zynqmp_r5_rproc_start,
   908		.stop		= zynqmp_r5_rproc_stop,
   909		.load		= rproc_elf_load_segments,
   910		.parse_fw	= zynqmp_r5_parse_fw,
   911		.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
   912		.sanity_check	= rproc_elf_sanity_check,
   913		.get_boot_addr	= rproc_elf_get_boot_addr,
   914		.kick		= zynqmp_r5_rproc_kick,
   915		.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
   916		.attach		= zynqmp_r5_attach,
   917		.detach		= zynqmp_r5_detach,
   918	};
   919	
   920	/**
   921	 * zynqmp_r5_add_rproc_core()
   922	 * Allocate and add struct rproc object for each r5f core
   923	 * This is called for each individual r5f core
   924	 *
   925	 * @cdev: Device node of each r5 core
   926	 *
   927	 * Return: zynqmp_r5_core object for success else error code pointer
   928	 */
   929	static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
   930	{
   931		struct zynqmp_r5_core *r5_core;
   932		struct rproc *r5_rproc;
   933		int ret;
   934	
   935		/* Set up DMA mask */
   936		ret = dma_set_coherent_mask(cdev, DMA_BIT_MASK(32));
   937		if (ret)
   938			return ERR_PTR(ret);
   939	
   940		/* Allocate remoteproc instance */
   941		r5_rproc = rproc_alloc(cdev, dev_name(cdev),
   942				       &zynqmp_r5_rproc_ops,
   943				       NULL, sizeof(struct zynqmp_r5_core));
   944		if (!r5_rproc) {
   945			dev_err(cdev, "failed to allocate memory for rproc instance\n");
   946			return ERR_PTR(-ENOMEM);
   947		}
   948	
   949		rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
   950	
   951		r5_rproc->auto_boot = false;
   952		r5_core = r5_rproc->priv;
   953		r5_core->dev = cdev;
   954		r5_core->np = dev_of_node(cdev);
   955		if (!r5_core->np) {
   956			dev_err(cdev, "can't get device node for r5 core\n");
   957			ret = -EINVAL;
   958			goto free_rproc;
   959		}
   960	
   961		/* Add R5 remoteproc core */
   962		ret = rproc_add(r5_rproc);
   963		if (ret) {
   964			dev_err(cdev, "failed to add r5 remoteproc\n");
   965			goto free_rproc;
   966		}
   967	
   968		/*
   969		 * Move rproc state to DETACHED to give one time opportunity to attach
   970		 * if firmware is already available in the memory. This can happen if
   971		 * firmware is loaded via debugger or by any other agent in the system.
   972		 * If firmware isn't available in the memory and resource table isn't found,
   973		 * then rproc state stay OFFLINE.
   974		 */
   975		if (!zynqmp_r5_get_rsc_table_va(r5_core))
   976			r5_rproc->state = RPROC_DETACHED;
   977	
   978		r5_core->rproc = r5_rproc;
   979		return r5_core;
   980	
   981	free_rproc:
   982		rproc_free(r5_rproc);
   983		return ERR_PTR(ret);
   984	}
   985	
   986	static int zynqmp_r5_get_sram_pd(struct device *r5_core_dev,
   987					 struct device_node *sram_np, int **power_domains,
   988					 int *num_pd)
   989	{
   990		struct of_phandle_args out_args;
   991		int pd_count, i, ret;
   992		int *pd_list;
   993	
   994		if (!of_find_property(sram_np, "power-domains", NULL)) {
 > 995			num_pd = 0;
   996			return 0;
   997		}
   998	
   999		pd_count = of_count_phandle_with_args(sram_np, "power-domains",
  1000						      "#power-domain-cells");
  1001	
  1002		pd_list = devm_kcalloc(r5_core_dev, pd_count, sizeof(int), GFP_KERNEL);
  1003		if (!pd_list)
  1004			return -ENOMEM;
  1005	
  1006		for (i = 0; i < pd_count; i++) {
  1007			ret = of_parse_phandle_with_args(sram_np, "power-domains",
  1008							 "#power-domain-cells",
  1009							 i, &out_args);
  1010			if (ret) {
  1011				dev_err(r5_core_dev, "%s: power-domains idx %d parsing failed\n",
  1012					sram_np->name, i);
  1013				return ret;
  1014			}
  1015	
  1016			of_node_put(out_args.np);
  1017			pd_list[i] = out_args.args[0];
  1018		}
  1019	
  1020		*power_domains = pd_list;
  1021		*num_pd = pd_count;
  1022	
  1023		return 0;
  1024	}
  1025	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
