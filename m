Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969117C9FA;
	Wed, 16 Oct 2024 03:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729050935; cv=none; b=UUUYHTmiY1Vfdz/M+hxxhfq22W9IqAP5PwFdfbD4zYkM0fG/qo08FSm4GFO7bT2Z9Nt8chfCKMU6pfDP380M3no6xusXjQcGuX/S+jSrGdi3CYyE4hU2ryI3dZVBqpwCQHkDwCYvHntvuTdcAImLwyEMmoLdaWWbr5MMaDYq06E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729050935; c=relaxed/simple;
	bh=jMBQQmq1sfnMHXR0h4yLcyqW3S/1KL6QUSbdQM1zeJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RyveAJVfOaYkFC3TGlEu43iweEv6znZjiCiIE7tBLRUbLSQ5U04x2U7IQAQCMTmHEFf/R49WbELzR+7o4TQDiYNyYflxZNEUMbyHanBL7rzl4r95at+kZOOiFaa0JS5H+rPCILG+faxKgTcedSf1ccTVZOzJdzgmLKZnzHhQG2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFKohmJi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFKohmJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729050933; x=1760586933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jMBQQmq1sfnMHXR0h4yLcyqW3S/1KL6QUSbdQM1zeJw=;
  b=SFKohmJiO3zRfCpcoc1mmiQlNT6hUnExaqYLHLQjo9hSc2ttyw4QWG+0
   HdJUntnaWeDW3f4Vd7OT4Qvw7rpxQCMOrx9dgy89iwJKeG4P3QHka9T8S
   gbDwo/siLM+9vTdVApg7e89H6sYcPOZR0Ki65cOMks6T/8DVQIwRas0zH
   /zCC7eBh2im+8tpH00zIp9GxuRqVfoQcAoVFjX4mhKFCDkDXZF8wrGKwM
   lyLMTOE3B0IOC3yRWmYuwOzjlLCVxJYXkiEyyiS+pPDyq0QXA+9ZvIIW9
   Gt0lmgKYutvqwJpuVTB5vyfiTBO92uVI51v5xnwC52RHp0bWvdYEn7WPe
   w==;
X-CSE-ConnectionGUID: cuzwg1pVTPWzz2oFJJdc/Q==
X-CSE-MsgGUID: /4T17oNaSOC+j7MOeueXQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39870829"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="39870829"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:55:33 -0700
X-CSE-ConnectionGUID: 9UFGTod+Sv67xhuxDGsj4w==
X-CSE-MsgGUID: 6ETfRyHuT/aP81KlFa5oQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78052207"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Oct 2024 20:55:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0v8C-000KFa-2X;
	Wed, 16 Oct 2024 03:55:28 +0000
Date: Wed, 16 Oct 2024 11:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mukesh Ojha <quic_mojha@quicinc.com>
Subject: Re: [PATCH v2] remoteproc: Add a new remoteproc state RPROC_DEFUNCT
Message-ID: <202410161104.5ZIbsMLV-lkp@intel.com>
References: <20241014203118.1580024-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014203118.1580024-1-quic_mojha@quicinc.com>

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on linus/master v6.12-rc3 next-20241015]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/remoteproc-Add-a-new-remoteproc-state-RPROC_DEFUNCT/20241015-043318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20241014203118.1580024-1-quic_mojha%40quicinc.com
patch subject: [PATCH v2] remoteproc: Add a new remoteproc state RPROC_DEFUNCT
config: x86_64-buildonly-randconfig-002-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161104.5ZIbsMLV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161104.5ZIbsMLV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161104.5ZIbsMLV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/remoteproc_core.c: In function 'rproc_trigger_recovery':
>> drivers/remoteproc/remoteproc_core.c:1843:25: warning: comparison between pointer and integer
    1843 |         if (rproc_start == RPROC_DEFUNCT || rproc->state != RPROC_CRASHED)
         |                         ^~


vim +1843 drivers/remoteproc/remoteproc_core.c

  1820	
  1821	/**
  1822	 * rproc_trigger_recovery() - recover a remoteproc
  1823	 * @rproc: the remote processor
  1824	 *
  1825	 * The recovery is done by resetting all the virtio devices, that way all the
  1826	 * rpmsg drivers will be reseted along with the remote processor making the
  1827	 * remoteproc functional again.
  1828	 *
  1829	 * This function can sleep, so it cannot be called from atomic context.
  1830	 *
  1831	 * Return: 0 on success or a negative value upon failure
  1832	 */
  1833	int rproc_trigger_recovery(struct rproc *rproc)
  1834	{
  1835		struct device *dev = &rproc->dev;
  1836		int ret;
  1837	
  1838		ret = mutex_lock_interruptible(&rproc->lock);
  1839		if (ret)
  1840			return ret;
  1841	
  1842		/* State could have changed before we got the mutex */
> 1843		if (rproc_start == RPROC_DEFUNCT || rproc->state != RPROC_CRASHED)
  1844			goto unlock_mutex;
  1845	
  1846		dev_err(dev, "recovering %s\n", rproc->name);
  1847	
  1848		if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
  1849			ret = rproc_attach_recovery(rproc);
  1850		else
  1851			ret = rproc_boot_recovery(rproc);
  1852	
  1853	unlock_mutex:
  1854		mutex_unlock(&rproc->lock);
  1855		return ret;
  1856	}
  1857	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
