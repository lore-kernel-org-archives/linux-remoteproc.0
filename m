Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7040C288502;
	Tue, 29 Jul 2025 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753787535; cv=none; b=r9cEI9bKlLn22uU/pEvwVRCbmbHuY+E8eOmegmX1kdI/k5aBLV7//RdqtX7cpn9d92JUBbVFpGNhb9CMllWygBgY/fbs/BU59Fb+/VgcB25qTysz4IFRVjrmeKYRoDY0xt2eiUS2d9rUBa9dy3O8vrqX6yi+VKm6yV50MbSnBEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753787535; c=relaxed/simple;
	bh=9/J0BHd+fuqkNFinG3p1UvN7xRkDJF3VXrbJKKrrPA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLExAX0EhN4noEJB96fNuSRQ9aB9UnfAt2erxiSGenu1EjnZb+t9KbNl3sl2TyO5fCP9vGPqUPZVqhys5Aj0nlCdm/cltZpuHe760tCYeIo05fVUEfWEFBN209EsSYDqrXF/FXALU75A8hpnQP9kLafnwyJsD5eMBEDbUPTIAwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJLK6YAH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJLK6YAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753787534; x=1785323534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9/J0BHd+fuqkNFinG3p1UvN7xRkDJF3VXrbJKKrrPA8=;
  b=NJLK6YAHkmcvH39dItg28s9exiqzdO7C5b+1+73Soi/fszl5gORyOfBP
   XybY4035aUxNfe4rbaBMpuUu/tqc2L6TEWh67gYYotcwIpoturAs7CY78
   NjO58GEuXw2kwxz2nXezhRb5JjI/tIL9bFGd7/ipzm3Vbz/egdnRPC5M6
   TSyZHKhL1yqlgBQG5mKF0WlE7PeK2jAjaqZ9ebmOTJccBWoKd146yOHjV
   WoAgQ6EeSWUoW5phD6mYnrCi6kHDpUHeuDYB9KsMkxNCoq4m2sKpDWTyU
   3qdXo4W6FGXUo39ubZeLVorO/vWWdD3JryjPQc82BDZQt9rJqcj0i62/A
   A==;
X-CSE-ConnectionGUID: M269EpkkTcOvna7l5c6VBg==
X-CSE-MsgGUID: cQbALhAfTGGjPuh1pC/Jtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="58677110"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="58677110"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 04:12:13 -0700
X-CSE-ConnectionGUID: 9h1TUjEISHO75Q1oFt4DCg==
X-CSE-MsgGUID: 7H97cNIyQnStcprWNIE7SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="163451637"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2025 04:12:08 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugiFa-0001Dv-2z;
	Tue, 29 Jul 2025 11:12:06 +0000
Date: Tue, 29 Jul 2025 19:11:34 +0800
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
Subject: Re: [PATCH v2 2/2] drivers: remoteproc: Add C906L controller for
 Sophgo CV1800B SoC
Message-ID: <202507291829.aB1UgzrA-lkp@intel.com>
References: <20250728-cv1800-rproc-v2-2-5bbee4abe9dc@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-cv1800-rproc-v2-2-5bbee4abe9dc@pigmoral.tech>

Hi Junhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 038d61fd642278bab63ee8ef722c50d10ab01e8f]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/dt-bindings-remoteproc-Add-C906L-rproc-for-Sophgo-CV1800B-SoC/20250728-190847
base:   038d61fd642278bab63ee8ef722c50d10ab01e8f
patch link:    https://lore.kernel.org/r/20250728-cv1800-rproc-v2-2-5bbee4abe9dc%40pigmoral.tech
patch subject: [PATCH v2 2/2] drivers: remoteproc: Add C906L controller for Sophgo CV1800B SoC
config: parisc-randconfig-r123-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291829.aB1UgzrA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250729/202507291829.aB1UgzrA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291829.aB1UgzrA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/sophgo_cv1800b_c906l.c:47:20: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +47 drivers/remoteproc/sophgo_cv1800b_c906l.c

    36	
    37	static int cv1800b_c906l_mem_alloc(struct rproc *rproc,
    38					   struct rproc_mem_entry *mem)
    39	{
    40		void __iomem *va;
    41	
    42		va = ioremap_wc(mem->dma, mem->len);
    43		if (!va)
    44			return -ENOMEM;
    45	
    46		/* Update memory entry va */
  > 47		mem->va = (void *)va;
    48	
    49		return 0;
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
