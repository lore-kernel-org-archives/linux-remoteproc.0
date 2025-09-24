Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872B5314A90;
	Wed, 24 Sep 2025 17:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758733740; cv=none; b=h2FJSynou3X65LhkxwFhWUT3W8bowCG3aeHVTDpwiuNr5MgkwA5IRgxNhyIcwg0wIdqqwcWt+4Ho7HtyD3clK/bHEqHyF9eAe9qRZxrgPTZ+GlZrKZWvsL3YZES633YVl/qPEQ3i7Typc5TdoSKojPd49hKU9wXgZVLrSeMcqPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758733740; c=relaxed/simple;
	bh=aeWps3hGKLyWKjZOJweWrTxcCTaDaWqTIIpaS/fAWuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvg/gUztUarV82A0it36aPERvs9LD9/5iNRum7pVImWwhhBobkfYuMWPW8taJANBhuqX8dgD64GliiHJ4Ew3amcOMWvQ9YckA93tv6MSvrS8nwEMS1BJXhhnzNz4lvzNMsJA0wFOzclr+pmbOVIivQzkaLGkqkpMXZnAJorv6xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NW1mGYjc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NW1mGYjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758733738; x=1790269738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aeWps3hGKLyWKjZOJweWrTxcCTaDaWqTIIpaS/fAWuQ=;
  b=NW1mGYjct/rMSOawycROsnZ8i+KmZ8uiXZBMjCshYfywVnZj/ediIyOX
   HMkS6s96sEE1Ss20SPtFfWBEvIMYWCewSgP/aayrER/kutUL7a690dARF
   6Efom90LxgJRXPG0JzdUlrRejAbOPMJiJZQ3aDH7AQ9VPW6MLOVpm4wAo
   6qX5j9EHN8liEkkCTmUruh4/Kmqd5txbbovnA1BQlXVYlk2BxdDW2t/Jo
   t36eXHRAFiQ+7yqPL40WlutRWfABR9fbm1EZ6AeRyw7L1SS+UXwYqOyOt
   FMImumLnZ1xwGIRehuGunLaR0fjPcchXTM5m1/OUXta1IhRij5qG7U1dp
   g==;
X-CSE-ConnectionGUID: fuhOFHaSRii8kGSaGwI+9A==
X-CSE-MsgGUID: s7p4dvMrTcSm0gmBMt4uJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="83643412"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="83643412"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 10:08:45 -0700
X-CSE-ConnectionGUID: Yhq3NqxFTYOm0i0PtY1iGg==
X-CSE-MsgGUID: dDWvxP7bSZ+FFgPaJk9r+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="181473381"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Sep 2025 10:08:40 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Sys-0004NB-0I;
	Wed, 24 Sep 2025 17:08:38 +0000
Date: Thu, 25 Sep 2025 01:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: Re: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <202509250023.gNpm32hs-lkp@intel.com>
References: <20250922200413.309707-4-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922200413.309707-4-shenwei.wang@nxp.com>

Hi Shenwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on brgl/gpio/for-next shawnguo/for-next linus/master v6.17-rc7 next-20250923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/dt-bindings-remoteproc-imx_rproc-Add-rpmsg-subnode-support/20250923-040844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20250922200413.309707-4-shenwei.wang%40nxp.com
patch subject: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
config: arm64-randconfig-r121-20250924 (https://download.01.org/0day-ci/archive/20250925/202509250023.gNpm32hs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250023.gNpm32hs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509250023.gNpm32hs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-imx-rpmsg.c:410:44: sparse: sparse: Using plain integer as NULL pointer

vim +410 drivers/gpio/gpio-imx-rpmsg.c

   405	
   406	static void imx_rpmsg_gpio_remove_action(void *data)
   407	{
   408		struct imx_rpmsg_gpio_port *port = data;
   409	
 > 410		port->info.port_store[port->idx] = 0;
   411	}
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
