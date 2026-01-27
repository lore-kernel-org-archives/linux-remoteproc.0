Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526CD361DD7;
	Tue, 27 Jan 2026 16:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532775; cv=none; b=dhFw9w5xZ+zPVHw8RMnQdPPcbGjhHAJLXxzLDj7s73FPs6TAsTTB8/hvzCSe4yF8LAb+M/KlE6pHE5kyNFfqmi+Agzhq6/Tv1zag+NwQIOqghoEf4j3lf5iaRsyrT5MGBMT3UrSjVy8pkOCFdPXCtYnTWMvxvDLgnnz3xFTZgKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532775; c=relaxed/simple;
	bh=J0GVUHK0eDX2Fsy9MRcfPgb8LlHLmm8u2IrImd/yZ+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSkZq/NLTjcRHsBJAY/2nfK+2s+dQy6JQPFlgYVzfYK8BYJJg+u19NgoetDH9KAP8lJ/lyNwlMuYF30SY7yji8wbQl5HEqycuF/+BDApQwCO35l1+ACAN56Aa9V6ZfSkdcyTiE5BhGQqSZBT83K75p/pul/fOmyse5wubiI8P5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECNKLVDk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECNKLVDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769532774; x=1801068774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J0GVUHK0eDX2Fsy9MRcfPgb8LlHLmm8u2IrImd/yZ+M=;
  b=ECNKLVDkH0WLCLTfEyV2j6eueliDR0Ph31CjCqkU74vrKZ/FaYL2ucgx
   uyO1z+fy1qj3KjCNa6uky2jMIE+K8JMDeADt2caRCd60tOAYk1DSrtRKO
   UORj6K31O4eQYi1Khby6CBt6hcvlUTsD6neDv9reXNBIcm19oxpKkE2SS
   w052O8w6RVc2r4+QpOtGE8mGxaiU+CkKK05zNb60vxAV6ZJrPq0Gg2IZm
   JchH0cJmGND7XzC8sV191Apjvo5n74VLP5iqzXEGmGRNbyhJayfIU3LAc
   Q8cmyrpp87OB8J9nzZ/O57BZNIzaT9WbKkpWi3XVxCt6tPEW7OYMiyXOl
   g==;
X-CSE-ConnectionGUID: A4pI2iQAS0KWP5GhfVl4WA==
X-CSE-MsgGUID: yYq5t1pwRj6wPAylDm7DZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88152439"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="88152439"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 08:52:54 -0800
X-CSE-ConnectionGUID: RYXDdM9OTjaY2Z+MqHuJEw==
X-CSE-MsgGUID: EdkzNB0ySUmUVu5HlrtLLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208081018"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jan 2026 08:52:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkmIx-00000000YjU-3EqP;
	Tue, 27 Jan 2026 16:52:39 +0000
Date: Wed, 28 Jan 2026 00:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] remoteproc: add support for Microchip IPC
 remoteproc platform driver
Message-ID: <202601280013.INN2YRRj-lkp@intel.com>
References: <20260126120658.1674253-3-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126120658.1674253-3-valentina.fernandezalanis@microchip.com>

Hi Valentina,

kernel test robot noticed the following build errors:

[auto build test ERROR on remoteproc/rproc-next]
[also build test ERROR on linus/master v6.19-rc7 next-20260126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentina-Fernandez/dt-bindings-remoteproc-add-Microchip-IPC-remoteproc/20260126-201137
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20260126120658.1674253-3-valentina.fernandezalanis%40microchip.com
patch subject: [PATCH v3 2/2] remoteproc: add support for Microchip IPC remoteproc platform driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260128/202601280013.INN2YRRj-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280013.INN2YRRj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280013.INN2YRRj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/remoteproc/mchp_remoteproc.c:23:10: fatal error: 'asm/sbi.h' file not found
      23 | #include <asm/sbi.h>
         |          ^~~~~~~~~~~
   1 error generated.


vim +23 drivers/remoteproc/mchp_remoteproc.c

    22	
  > 23	#include <asm/sbi.h>
    24	#include <asm/vendorid_list.h>
    25	#include <linux/mailbox/mchp-ipc.h>
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
