Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0048926AC5;
	Sun,  5 May 2024 22:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714949106; cv=none; b=uBksBQRv7PeeMvnr5z0rSi9Tg8TYxFa5qKvFW9dOK+2TcD36Eee9e8wneIgbCWvpyGJ49g6IBwQCHGXP6EJUtcHvAKcf0/WL2K3VqC9e34ieglPns7Bawq1Rjvz20LhtZ8XGkt+8hfVZYzjHvB8eQ6cc5j0w+7GZeP8WDUy5kjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714949106; c=relaxed/simple;
	bh=BUqWKmrS1hy8ktcWYFy8DvuJcpGKUeX//zZzMGcFbqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1ox53plYIK20fql3qRpcu2nAa4CSsov9jPmwJ/hlkAQe+Dsn2SBOnftg0Ai0jm9+08Cytob57zV0LI16HsAzDkjR4MyU1B4dduZudH0ibCEVEK4mjIr4Xb3NF7ArPyfOIY/BrZJMZBFlELISVKKPv9fRyXRsWxvgqIKkTgS0k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ix6Q9/Gh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ix6Q9/Gh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714949105; x=1746485105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BUqWKmrS1hy8ktcWYFy8DvuJcpGKUeX//zZzMGcFbqU=;
  b=ix6Q9/GhYCLaTjdo+BIsIQntKg5RLNI7M4RzHA0zHOg2haFc6Q9j+wg3
   naXHIExfT/j0ysHSpKS2ExRB3N+fb0relFSjX1K4WToUS4cQkxgV11KS7
   oCfIFcnhfhvlK6GZiJs2GX+UHSflapYmwFu1zws5EtA/0XOkHuAVzDTTx
   nQop7HWgu/HzMkdTqOw5jOz5DPLYkEs+I1L2jwNOfF3GIWyOMeL4IgJjq
   oRRDjMw+IRFz2KNzGjItrAEdXBxuY37X8Covz3vBlb8YW8QFyF2oD2L1i
   bJI3QgI7boLtc+U+zpP5vSa9Hw7VP6EGUrU8jVvOsl5dTxTPiK4pdTl3h
   Q==;
X-CSE-ConnectionGUID: uCpd9vucQXqbVLY7z6wqGg==
X-CSE-MsgGUID: qrRGZrfEToGhYSfJqTAuHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10805126"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="10805126"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 15:45:05 -0700
X-CSE-ConnectionGUID: 1EFi/TtDQruaiwa22Z29sg==
X-CSE-MsgGUID: azTr283KRt6KGHOkJX7+Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="32460076"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 May 2024 15:45:02 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3kbM-0000GE-21;
	Sun, 05 May 2024 22:45:00 +0000
Date: Mon, 6 May 2024 06:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tanmay Shah <tanmay.shah@amd.com>
Subject: Re: [PATCH 1/2] drivers: remoteproc: xlnx: add attach detach support
Message-ID: <202405060611.jBQBF7iB-lkp@intel.com>
References: <20240502231021.370047-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502231021.370047-2-tanmay.shah@amd.com>

Hi Tanmay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0496190c4d42965acb31b9da1b6dac3509791062]

url:    https://github.com/intel-lab-lkp/linux/commits/Tanmay-Shah/drivers-remoteproc-xlnx-add-attach-detach-support/20240503-071225
base:   0496190c4d42965acb31b9da1b6dac3509791062
patch link:    https://lore.kernel.org/r/20240502231021.370047-2-tanmay.shah%40amd.com
patch subject: [PATCH 1/2] drivers: remoteproc: xlnx: add attach detach support
config: arm64-randconfig-r113-20240506 (https://download.01.org/0day-ci/archive/20240506/202405060611.jBQBF7iB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240506/202405060611.jBQBF7iB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060611.jBQBF7iB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/xlnx_r5_remoteproc.c:404:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:522:20: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/remoteproc/xlnx_r5_remoteproc.c:731:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct rsc_tbl_data *rsc_data_va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/xlnx_r5_remoteproc.c:731:21: sparse:     expected struct rsc_tbl_data *rsc_data_va
   drivers/remoteproc/xlnx_r5_remoteproc.c:731:21: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/xlnx_r5_remoteproc.c:748:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct resource_table *rsc_addr @@     got void [noderef] __iomem * @@
   drivers/remoteproc/xlnx_r5_remoteproc.c:748:18: sparse:     expected struct resource_table *rsc_addr
   drivers/remoteproc/xlnx_r5_remoteproc.c:748:18: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/xlnx_r5_remoteproc.c:802:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got struct resource_table *rsc_tbl_va @@
   drivers/remoteproc/xlnx_r5_remoteproc.c:802:24: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/xlnx_r5_remoteproc.c:802:24: sparse:     got struct resource_table *rsc_tbl_va

vim +731 drivers/remoteproc/xlnx_r5_remoteproc.c

   702	
   703	static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
   704	{
   705		struct device *dev = r5_core->dev;
   706		struct rsc_tbl_data *rsc_data_va;
   707		struct resource_table *rsc_addr;
   708		struct resource res_mem;
   709		struct device_node *np;
   710		int ret;
   711	
   712		/**
   713		 * It is expected from remote processor firmware to provide resource
   714		 * table address via struct rsc_tbl_data data structure.
   715		 * Start address of first entry under "memory-region" property list
   716		 * contains that data structure which holds resource table address, size
   717		 * and some magic number to validate correct resource table entry.
   718		 */
   719		np = of_parse_phandle(r5_core->np, "memory-region", 0);
   720		if (!np) {
   721			dev_err(dev, "failed to get memory region dev node\n");
   722			return -EINVAL;
   723		}
   724	
   725		ret = of_address_to_resource(np, 0, &res_mem);
   726		if (ret) {
   727			dev_err(dev, "failed to get memory-region resource addr\n");
   728			return -EINVAL;
   729		}
   730	
 > 731		rsc_data_va = devm_ioremap_wc(dev, res_mem.start,
   732					      sizeof(struct rsc_tbl_data));
   733		if (!rsc_data_va) {
   734			dev_err(dev, "failed to map resource table data address\n");
   735			return -EIO;
   736		}
   737	
   738		/**
   739		 * If RSC_TBL_XLNX_MAGIC number and its complement isn't found then
   740		 * do not consider resource table address valid and don't attach
   741		 */
   742		if (rsc_data_va->magic_num != RSC_TBL_XLNX_MAGIC ||
   743		    rsc_data_va->comp_magic_num != ~RSC_TBL_XLNX_MAGIC) {
   744			dev_dbg(dev, "invalid magic number, won't attach\n");
   745			return -EINVAL;
   746		}
   747	
 > 748		rsc_addr = ioremap_wc(rsc_data_va->rsc_tbl,
   749				      rsc_data_va->rsc_tbl_size);
   750		if (!rsc_addr) {
   751			dev_err(dev, "failed to get rsc_addr\n");
   752			return -EINVAL;
   753		}
   754	
   755		/**
   756		 * As of now resource table version 1 is expected. Don't fail to attach
   757		 * but warn users about it.
   758		 */
   759		if (rsc_addr->ver != 1)
   760			dev_warn(dev, "unexpected resource table version %d\n",
   761				 rsc_addr->ver);
   762	
   763		r5_core->rsc_tbl_size = rsc_data_va->rsc_tbl_size;
   764		r5_core->rsc_tbl_va = rsc_addr;
   765	
   766		return 0;
   767	}
   768	
   769	static int zynqmp_r5_attach(struct rproc *rproc)
   770	{
   771		struct zynqmp_r5_core *r5_core = rproc->priv;
   772		int i, pm_domain_id, ret;
   773	
   774		/*
   775		 * Firmware is loaded in TCM. Request TCM power domains to notify
   776		 * platform management controller that TCM is in use. This will be
   777		 * released during unprepare callback.
   778		 */
   779		for (i = 0; i < r5_core->tcm_bank_count; i++) {
   780			pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
   781			ret = zynqmp_pm_request_node(pm_domain_id,
   782						     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
   783						     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
   784			if (ret < 0)
   785				pr_warn("TCM %d can't be requested\n", i);
   786		}
   787	
   788		return 0;
   789	}
   790	
   791	static int zynqmp_r5_detach(struct rproc *rproc)
   792	{
   793		struct zynqmp_r5_core *r5_core = rproc->priv;
   794	
   795		/*
   796		 * Generate last notification to remote after clearing virtio flag.
   797		 * Remote can avoid polling on virtio reset flag if kick is generated
   798		 * during detach by host and check virtio reset flag on kick interrupt.
   799		 */
   800		zynqmp_r5_rproc_kick(rproc, 0);
   801	
 > 802		iounmap(r5_core->rsc_tbl_va);
   803		r5_core->rsc_tbl_va = NULL;
   804	
   805		return 0;
   806	}
   807	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
