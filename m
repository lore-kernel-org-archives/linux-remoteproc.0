Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73802E0B45;
	Thu, 21 Aug 2025 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755785661; cv=none; b=tiz4iUoKky5uK3S2HDiNqFsxBntVIeqXPkrYSo1Zxm8E8b7dmSByLxgZKTg65+BiKGQYVr9ICLWvEumQ29CFD5ozewKkgEKRdk7zixP/NR3hPIuq+o+L7PeU0WlB4oCEuUxUVbMTD4ttoOOyy0zz/dlv1SqqNcgcGiqWeOUm6j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755785661; c=relaxed/simple;
	bh=ixalp0w2CUYHQ5NQlNHwr+bj0kQmtH2DORccmekLrgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gf95fQMKuv2Hpnv32AJ4p4UgWSyu1I05b3GmXKDk72Qk5a0r+LnGuk87TvpGwHBqRy2w+PvDcg8BZDyw8UXOpCSA6a2wfbWY/n1xt+FEeOnM/rjtV8u8jKr+0lD2ojKqF0l1EMElPZh17l/WZWLOXdLiIrSoRG8KdFb7z3EeRdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOYb0Q0u; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOYb0Q0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755785660; x=1787321660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ixalp0w2CUYHQ5NQlNHwr+bj0kQmtH2DORccmekLrgk=;
  b=aOYb0Q0unQvrqxc9gLyDQBtN2dcik+wNlTIwTw3U1J/cZcwAXhVDvnpE
   0t/MpV0OZco4ySTtmlTnVp8OMFcPfrKaIapZGiK4g98rGrSOuPloSHNXz
   My6YbJBGDbogG5wgbvR2sx/RYn0q770psNympa8JVQoXr0N3TyeBb/11z
   +QMvXiJFSwORH2KCn0Pur6/YrNLj3efPw/MT0TXLvunXfqDcXhXoTsZrI
   PX1kvVoLvm4Z7i/wleLtg0H8vNSaYJWtMJ54E9oLlvIve1yMiPH6DFmRI
   qVoGxJfsfA5toGcsvw9/miEN9NyrGI69qL2UtEu7b//n9mcQ9uVPkrxCT
   g==;
X-CSE-ConnectionGUID: mcXUjriHQXmKOsnGcOi77g==
X-CSE-MsgGUID: llXZzQeMSz2HLHrOXdXg8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69513878"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="69513878"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 07:14:20 -0700
X-CSE-ConnectionGUID: J5U2KbXiQ22QVCBBSZm3ww==
X-CSE-MsgGUID: nNNaBNWlSaSC0tsi88AAcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="199401653"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Aug 2025 07:14:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up620-000KLP-2Z;
	Thu, 21 Aug 2025 14:13:31 +0000
Date: Thu, 21 Aug 2025 22:11:18 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <202508212119.gamkDcXG-lkp@intel.com>
References: <20250818204420.794554-4-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818204420.794554-4-shenwei.wang@nxp.com>

Hi Shenwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on brgl/gpio/for-next shawnguo/for-next linus/master v6.17-rc2 next-20250820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/dt-bindings-remoteproc-imx_rproc-Add-rpmsg-subnode-support/20250819-044803
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20250818204420.794554-4-shenwei.wang%40nxp.com
patch subject: [PATCH 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250821/202508212119.gamkDcXG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212119.gamkDcXG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508212119.gamkDcXG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-imx-rpmsg.c:419:6: warning: variable 'port' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     419 |         if (msg)
         |             ^~~
   drivers/gpio/gpio-imx-rpmsg.c:421:7: note: uninitialized use occurs here
     421 |         if (!port)
         |              ^~~~
   drivers/gpio/gpio-imx-rpmsg.c:419:2: note: remove the 'if' if its condition is always true
     419 |         if (msg)
         |         ^~~~~~~~
     420 |                 port = drvdata->channel_devices[msg->port_idx];
   drivers/gpio/gpio-imx-rpmsg.c:415:34: note: initialize the variable 'port' to silence this warning
     415 |         struct imx_rpmsg_gpio_port *port;
         |                                         ^
         |                                          = NULL
   drivers/gpio/gpio-imx-rpmsg.c:503:10: error: incompatible function pointer types assigning to 'void (*)(struct gpio_chip *, unsigned int, int)' from 'int (struct gpio_chip *, unsigned int, int)' [-Wincompatible-function-pointer-types]
     503 |         gc->set = imx_rpmsg_gpio_set;
         |                 ^ ~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +419 drivers/gpio/gpio-imx-rpmsg.c

   409	
   410	static int imx_rpmsg_gpio_callback(struct rpmsg_device *rpdev,
   411		void *data, int len, void *priv, u32 src)
   412	{
   413		struct gpio_rpmsg_data *msg = (struct gpio_rpmsg_data *)data;
   414		unsigned long flags;
   415		struct imx_rpmsg_gpio_port *port;
   416		struct imx_rpmsg_driver_data *drvdata;
   417	
   418		drvdata = dev_get_drvdata(&rpdev->dev);
 > 419		if (msg)
   420			port = drvdata->channel_devices[msg->port_idx];
   421		if (!port)
   422			return -ENODEV;
   423	
   424		if (msg->header.type == GPIO_RPMSG_REPLY) {
   425			port->info.reply_msg = msg;
   426			complete(&port->info.cmd_complete);
   427		} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
   428			port->info.notify_msg = msg;
   429			local_irq_save(flags);
   430			generic_handle_domain_irq(port->domain, msg->pin_idx);
   431			local_irq_restore(flags);
   432		} else
   433			dev_err(&rpdev->dev, "wrong command type!\n");
   434	
   435		return 0;
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
