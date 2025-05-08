Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72CB15624D;
	Thu,  8 May 2025 23:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746746581; cv=none; b=fRh97fYnfCLSoS30ouMNPmtesXbY5fo56eBq/Pbkp1cXA2pMZProRSpqyA3RQr3/sR2wt2ydlOLtk4PfclKutJSEoH8NwILBLiTmmixg0RqBduA4BF0hEufxdGkgPA9s9riJfXVIp8rTeFoRqsU5Zk4jvxMPh2f8NHetmnqi43w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746746581; c=relaxed/simple;
	bh=FONvhT1jAfHPxkn8m504XAWgTKv+f5ZT1tzDmrZh2U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rdcu+089aiadNe1lX5y4UJXSBQvR0NCstv1jloUO56Mj9cJCxTvp6acC0yvoFah/Fp4fDhNl2jlY7MnqWcvgIARZ5rT+kQghQyGOPdcsdeNuaatjqJEOx5oIA4/qTxexRNCkRoEAb2sli+3dhjVUt1EZ6m8Kem3Pxspb4N27Ri0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5ogwJZa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5ogwJZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746746580; x=1778282580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FONvhT1jAfHPxkn8m504XAWgTKv+f5ZT1tzDmrZh2U8=;
  b=F5ogwJZaVnCIrooAJRVQxAJX6Jn+z9uJwYPbGrAS6iotr0tUz3XMtlOu
   UVzuASYcN0IsnzHa1t4+6b61KYRnp5HqOht8oOGmRP0UtvbDUXGKS+ZWZ
   +GgAEAZA8yQlVWq/xn7OZyK9RKGBNAEn0X2BnOn5XQR3nRS/6vsZbjvBz
   aYj5B7KRiqCxicc/fwAuuXoQOJpuwLndi4+7lOodoUjIZyu3bXqePdq9G
   s72Y8Rln6w7entXMA9RVgdXfP2VyA5oCDJaBi6m4i09T+7yvlABmsTUZ3
   19am0bnSbcImsmnSY4VwVTWe0c6SlHX1K+7MjfoWujMdQT5+v9obLsz/G
   Q==;
X-CSE-ConnectionGUID: m/yYdsspSi+4/rzDr0XguQ==
X-CSE-MsgGUID: bA/i5H51Q1+5Hvh0D+ON1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="36184682"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="36184682"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:22:59 -0700
X-CSE-ConnectionGUID: CmASKxS3Rz6bGPgRz2dXFQ==
X-CSE-MsgGUID: +dg5XxO/SNubZMX0JB+v4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136400983"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2025 16:22:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDAZr-000BSh-0B;
	Thu, 08 May 2025 23:22:55 +0000
Date: Fri, 9 May 2025 07:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dawei Li <dawei.li@linux.dev>, andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: Re: [PATCH 3/3] rpmsg: ctrl: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI
Message-ID: <202505090716.iB4qQAf2-lkp@intel.com>
References: <20250507141712.4276-4-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507141712.4276-4-dawei.li@linux.dev>

Hi Dawei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Dawei-Li/rpmsg-char-Reuse-eptdev-logic-for-anon-device/20250507-223209
base:   92a09c47464d040866cf2b4cd052bc60555185fb
patch link:    https://lore.kernel.org/r/20250507141712.4276-4-dawei.li%40linux.dev
patch subject: [PATCH 3/3] rpmsg: ctrl: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI
config: i386-randconfig-011-20250508 (https://download.01.org/0day-ci/archive/20250509/202505090716.iB4qQAf2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090716.iB4qQAf2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090716.iB4qQAf2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/rpmsg/rpmsg_ctrl.c:28:
   drivers/rpmsg/rpmsg_char.h:54:1: error: expected identifier or '(' before '{' token
      54 | {
         | ^
>> drivers/rpmsg/rpmsg_char.h:52:19: warning: 'rpmsg_eptdev_create' used but never defined
      52 | static inline int rpmsg_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
         |                   ^~~~~~~~~~~~~~~~~~~


vim +/rpmsg_eptdev_create +52 drivers/rpmsg/rpmsg_char.h

69265bc12b6567 Arnaud Pouliquen 2022-01-24  51  
73c9f094eaac8b Dawei Li         2025-05-07 @52  static inline int rpmsg_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
73c9f094eaac8b Dawei Li         2025-05-07  53  				      struct rpmsg_channel_info chinfo, int *pfd);
73c9f094eaac8b Dawei Li         2025-05-07 @54  {
73c9f094eaac8b Dawei Li         2025-05-07  55  	return -ENXIO;
73c9f094eaac8b Dawei Li         2025-05-07  56  }
73c9f094eaac8b Dawei Li         2025-05-07  57  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
