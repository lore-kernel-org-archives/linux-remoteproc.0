Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ECAFC0C;
	Sat,  8 Jun 2024 04:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717821914; cv=none; b=dkkAUOY9SPI5kZqy/ktG1nR3e13tA5XW1qgMqC8JoA4HtGE1HkI87VqUMsUyEHhyf5SIg54FO9c9LcVQcQ7L8oYF4sHPsWTVeBOXxTPGw/4iqZGg+NAZsFuAbr4OkNmOK/HXBcNz2Hg3mIoioQ2CZM4ZdHOChlH5bfeS2HuGhsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717821914; c=relaxed/simple;
	bh=NwIBSgN012cg278cQekaAqgO/G/C8N0xznx9WA+9OAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TseqAkLQMr07l3BtLH7ZV/L3b9vlKx5q6cm51AD6JTaqzRLbmhgHwRJcVe/hE1F5eBuRW1fT4G5GyqQRuDTxNvPMrW3MDyEjZw18FkVVsBsx63t8D40/o2zfOU3i4FJVdyURJWkRv3vvfqLZkWd/s8EhUICZ4CDkkG9tMBsBGJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMwsqUp9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMwsqUp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717821912; x=1749357912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NwIBSgN012cg278cQekaAqgO/G/C8N0xznx9WA+9OAE=;
  b=XMwsqUp9slQDhOWNxzv5MfcWfr/T7YxRZOvb9s0ZRg7IFY6887X2ZlAT
   kMuY0cf7OhAZtud41bIDhKeHKCndKVM3dhtyiGtnALrN46qcWUGQzsBB5
   Cl/qq/ivBdJltuq2FCp/klHOcX3oMvnzcB1Kz7nVo20Zz2ucj6iykAhb2
   isxjUcGPs2jfh79Np7vD4YOQI3Ay1l4OQCY+zbZyJWfuR5BlJSEvwaG27
   8CoGanJYiX21OepdQ7NE/KEvnEFtdjzEJ0xh/v1+nOqClL+vPCc7bG9sQ
   +hdr4Ey5YQudDPSHSM+yav2stkFrvZVEPXyAw7HHhM/lHTgovMpPzTa66
   Q==;
X-CSE-ConnectionGUID: J4M4pCjfQ7e+3CtAQV/D7A==
X-CSE-MsgGUID: spPZ9vRvRPaJfvvKk8PSpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="32048697"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="32048697"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 21:45:11 -0700
X-CSE-ConnectionGUID: oFNwwNMPRs+Vl995yiH1qA==
X-CSE-MsgGUID: SVmaGNLQRFij+Ekypuz7+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="42963533"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jun 2024 21:45:08 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFnwv-00011O-2R;
	Sat, 08 Jun 2024 04:45:05 +0000
Date: Sat, 8 Jun 2024 12:45:05 +0800
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
Subject: Re: [PATCH v6 5/5] remoteproc: stm32: Add support of an OP-TEE TA to
 load the firmware
Message-ID: <202406081214.qFAil90A-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240608/202406081214.qFAil90A-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081214.qFAil90A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081214.qFAil90A-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:374,
                    from include/linux/dma-mapping.h:7,
                    from drivers/remoteproc/stm32_rproc.c:9:
>> arch/s390/include/asm/bug.h:53:21: error: expected declaration specifiers or '...' before '{' token
      53 | #define WARN_ON(x) ({                                   \
         |                     ^
   include/linux/tee_remoteproc.h:94:9: note: in expansion of macro 'WARN_ON'
      94 |         WARN_ON(1);
         |         ^~~~~~~
   In file included from drivers/remoteproc/stm32_rproc.c:23:
   include/linux/tee_remoteproc.h:96:9: error: expected identifier or '(' before 'return'
      96 |         return NULL;
         |         ^~~~~~
   include/linux/tee_remoteproc.h:97:1: error: expected identifier or '(' before '}' token
      97 | }
         | ^
   drivers/remoteproc/stm32_rproc.c:717:34: error: 'tee_rproc_find_loaded_rsc_table' undeclared here (not in a function); did you mean 'rproc_find_loaded_rsc_table'?
     717 |         .find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  rproc_find_loaded_rsc_table


vim +53 arch/s390/include/asm/bug.h

a9df8e325d0de5 arch/s390/include/asm/bug.h Heiko Carstens 2010-01-13  52  
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27 @53  #define WARN_ON(x) ({					\
fd0cbdd378258f include/asm-s390/bug.h      Heiko Carstens 2007-08-02  54  	int __ret_warn_on = !!(x);			\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  55  	if (__builtin_constant_p(__ret_warn_on)) {	\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  56  		if (__ret_warn_on)			\
b2be05273a1744 arch/s390/include/asm/bug.h Ben Hutchings  2010-04-03  57  			__WARN();			\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  58  	} else {					\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  59  		if (unlikely(__ret_warn_on))		\
b2be05273a1744 arch/s390/include/asm/bug.h Ben Hutchings  2010-04-03  60  			__WARN();			\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  61  	}						\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  62  	unlikely(__ret_warn_on);			\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  63  })
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  64  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
