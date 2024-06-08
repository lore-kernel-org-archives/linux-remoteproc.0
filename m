Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E4920EB;
	Sat,  8 Jun 2024 03:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717817468; cv=none; b=SJ3UlAdY9bkDVG0gd2Isxp6P7oa0trcl18a7uzlofY+ZvgKfOQj/Jj7iWzeh9Cs4DPtUfImUU6pt6oE78wqQYU4v9jEQTUkzhyxfy0HL5NHctePzzeCIWO7VUeyKqbvbC+NqsPFnMmKgVB+3mqCx6pTYQo8uhyi/qFI173jkJrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717817468; c=relaxed/simple;
	bh=/sX6sFjxJG1dDPpY4Isus+wzeR8BUHZdaJGCCe58Hjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMYg6u/WJFM+AoKTysFxuWjiz3S7GXD4xyzaLUurRQB+HOW2T8mXCC7ahz1eFA0xlik883vn/IQU4XGKSR10IXpo+QrtGA5W+KS9h7oVg8E0vwDXAmpClvQtsZfTLWL79WPUyFkRyu2gDihIfFu0qCLAoAhdXCOo20csBHsfUls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKQq6phf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKQq6phf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717817466; x=1749353466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/sX6sFjxJG1dDPpY4Isus+wzeR8BUHZdaJGCCe58Hjg=;
  b=fKQq6phfRtC6fUEyhQOsg9zA21250k/7gYdSem9vKrKSnE+K1YKQ6hC5
   98h5B9IJqbz+U+SoB8nw847frPKy5USOvWRureZSJp1HYBh5wCc2tBgeR
   2jplj654DtvNjRFxb6ZEvoPYqrG5w8xGOgw9lku4x0eiZb4KbiSfU0L/V
   s5XlnAnYrE0G8o3njrMSyOzSYcS4kgO5mNr9c1RjB313rkHEVgSiPacpI
   9ZSdL/hm1IS/Rb51PF8CeWpug+YX4vzhRN4U5Dwg6E+0dsliHNl6ZuBRu
   1XI9BTxcGPu3DGFaUsXTierB2E0egJHQGr7DVaRxH+2DkpW1DWHktflAs
   Q==;
X-CSE-ConnectionGUID: 91efLc6zQeOOS7JAO6p9gA==
X-CSE-MsgGUID: 7aJlLoEDTRCOm/CZSQeDwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14436254"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="14436254"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 20:31:05 -0700
X-CSE-ConnectionGUID: KauwOKdARrOh7dsnIQJUCw==
X-CSE-MsgGUID: ecCI/N7VQMOA9VeHuekkXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="38611823"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jun 2024 20:31:02 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFmnE-0000uQ-0W;
	Sat, 08 Jun 2024 03:31:00 +0000
Date: Sat, 8 Jun 2024 11:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: Re: [PATCH v6 5/5] remoteproc: stm32: Add support of an OP-TEE TA to
 load the firmware
Message-ID: <202406081159.KM501g5C-lkp@intel.com>
References: <20240607093326.369090-6-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607093326.369090-6-arnaud.pouliquen@foss.st.com>

Hi Arnaud,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20240607-183305
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240607093326.369090-6-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v6 5/5] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
config: i386-buildonly-randconfig-002-20240608 (https://download.01.org/0day-ci/archive/20240608/202406081159.KM501g5C-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081159.KM501g5C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081159.KM501g5C-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/remoteproc/stm32_rproc.c:23:
>> include/linux/tee_remoteproc.h:94:2: error: expected parameter declarator
      94 |         WARN_ON(1);
         |         ^
   include/asm-generic/bug.h:122:29: note: expanded from macro 'WARN_ON'
     122 | #define WARN_ON(condition) ({                                           \
         |                             ^
   In file included from drivers/remoteproc/stm32_rproc.c:23:
>> include/linux/tee_remoteproc.h:94:2: error: expected ')'
   include/asm-generic/bug.h:122:29: note: expanded from macro 'WARN_ON'
     122 | #define WARN_ON(condition) ({                                           \
         |                             ^
   include/linux/tee_remoteproc.h:94:2: note: to match this '('
   include/asm-generic/bug.h:122:28: note: expanded from macro 'WARN_ON'
     122 | #define WARN_ON(condition) ({                                           \
         |                            ^
   In file included from drivers/remoteproc/stm32_rproc.c:23:
>> include/linux/tee_remoteproc.h:92:32: error: function cannot return function type 'struct resource_table *()'
      92 | tee_rproc_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
         |                                ^
>> include/linux/tee_remoteproc.h:94:2: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      94 |         WARN_ON(1);
         |         ^
   include/asm-generic/bug.h:122:28: note: expanded from macro 'WARN_ON'
     122 | #define WARN_ON(condition) ({                                           \
         |                            ^
   In file included from drivers/remoteproc/stm32_rproc.c:23:
>> include/linux/tee_remoteproc.h:96:2: error: expected identifier or '('
      96 |         return NULL;
         |         ^
>> include/linux/tee_remoteproc.h:97:1: error: extraneous closing brace ('}')
      97 | }
         | ^
   6 errors generated.


vim +94 include/linux/tee_remoteproc.h

5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07  90  
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07  91  static inline struct resource_table *
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07 @92  tee_rproc_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07  93  	/* This shouldn't be possible */
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07 @94  	WARN_ON(1);
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07  95  
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07 @96  	return NULL;
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07 @97  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
