Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B4B1D9A5F;
	Tue, 10 Jun 2025 05:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749532527; cv=none; b=FcDSi/Xvy7oiGRsu6BmFdBJ0Sp+axhHFCCSfXoy4Xk/5MbgYmbu7nrLqwlg2ict1oZmjwDhPbHktILfv6C9lx3h7t4VH3dfVXNsJgOJO04Hkq3FxnHGw6f8feFeH112hp5230APa3VCLL8FnTkuruh8UjKg/gi0gsCKZHj0e6X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749532527; c=relaxed/simple;
	bh=wwx1RGlswAft6HtyBTWGHwM1xvSwaWadQVlRSN2NE4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnhUtN1Au5A9WmHHTNXy+yi/LUbFxXab+6k1IFa8HURuLV32gF0DeOrMdAqDWDk+10izM3XsmtkhtpXfvQJCZOfXVkg/TsM6f3nzxWwYn39AR6yByFUHEFWHsaBvAhOtorBQQKHifwrLYeeDzdyk/uxfolDHpvLNyhZY43tN8jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDAKVw0M; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDAKVw0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749532526; x=1781068526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wwx1RGlswAft6HtyBTWGHwM1xvSwaWadQVlRSN2NE4k=;
  b=UDAKVw0MteH4xz1yfvGIkdJ99nSh5wPfb1NJKgQYxASFj2CLleV1GGUs
   /yF0MlKTw+hBoLgUFKBdZNFnpJ4ImjuCaPlrz4Xt92s9tRheiQie2fD3I
   YuaRLm/Mxw+vXYJEPsOY7M9A3Pfybnv7nM4sd5QMOybdtbYPwtrBNlChm
   CU78oRSbVtb05SLYwnnHha28Xk59OO5/Q/0iiyHSxLVdJLn902s0E9Zmz
   entzeR9eqjy3NlzhoXlCa5IXYUwgUvLPYYSqbo/YfrW2xQ3+usnVEpaMj
   2kyZJnR1r6Ipd7B3Awvy01YQYJxmpCHP9UIBx9ttfDmYxavIo9fOolhh4
   A==;
X-CSE-ConnectionGUID: FREsnZaQQ5WVG30NFz3v0A==
X-CSE-MsgGUID: yS0VvP1pRJ6re6FhOZNVpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55431728"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="55431728"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 22:15:26 -0700
X-CSE-ConnectionGUID: GoXFIom2SbCGSvZIugHs+A==
X-CSE-MsgGUID: 3dgGJazITluB05ndUhbYHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147076646"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Jun 2025 22:15:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOrKQ-0007nV-2j;
	Tue, 10 Jun 2025 05:15:18 +0000
Date: Tue, 10 Jun 2025 13:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] drivers: remoteproc: Add C906L controller for Sophgo
 CV1800B SoC
Message-ID: <202506101252.4HRoLbL7-lkp@intel.com>
References: <20250608-cv1800-rproc-v1-2-57cf66cdf6a3@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608-cv1800-rproc-v1-2-57cf66cdf6a3@pigmoral.tech>

Hi Junhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8630c59e99363c4b655788fd01134aef9bcd9264]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/dt-bindings-remoteproc-Add-C906L-rproc-for-Sophgo-CV1800B-SoC/20250608-104249
base:   8630c59e99363c4b655788fd01134aef9bcd9264
patch link:    https://lore.kernel.org/r/20250608-cv1800-rproc-v1-2-57cf66cdf6a3%40pigmoral.tech
patch subject: [PATCH 2/2] drivers: remoteproc: Add C906L controller for Sophgo CV1800B SoC
config: nios2-randconfig-r132-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101252.4HRoLbL7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250610/202506101252.4HRoLbL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101252.4HRoLbL7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/sophgo_cv1800b_c906l.c:41:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/sophgo_cv1800b_c906l.c:41:12: sparse:     expected void *va
   drivers/remoteproc/sophgo_cv1800b_c906l.c:41:12: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/sophgo_cv1800b_c906l.c:54:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *va @@
   drivers/remoteproc/sophgo_cv1800b_c906l.c:54:20: sparse:     expected void [noderef] __iomem *addr
   drivers/remoteproc/sophgo_cv1800b_c906l.c:54:20: sparse:     got void *va

vim +41 drivers/remoteproc/sophgo_cv1800b_c906l.c

    35	
    36	static int cv1800b_c906l_mem_alloc(struct rproc *rproc,
    37					   struct rproc_mem_entry *mem)
    38	{
    39		void *va;
    40	
  > 41		va = ioremap_wc(mem->dma, mem->len);
    42		if (IS_ERR_OR_NULL(va))
    43			return -ENOMEM;
    44	
    45		/* Update memory entry va */
    46		mem->va = va;
    47	
    48		return 0;
    49	}
    50	
    51	static int cv1800b_c906l_mem_release(struct rproc *rproc,
    52					     struct rproc_mem_entry *mem)
    53	{
  > 54		iounmap(mem->va);
    55	
    56		return 0;
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
