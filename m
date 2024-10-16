Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE913C908;
	Wed, 16 Oct 2024 04:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729052197; cv=none; b=FZrQ7dTeLC0eTuyvWG7jO1x/96hrlTXZAmpFEk5UISrqlsEPH8cnOSmqUWAzqYZDpHmoF1v+lwv9ST/uNebnCM42wqpiM4vniz+E0RKDImXUqb6gC8cnr13oLQJF67ch0XXDOadbxYHmvbfcxzQXbVZzc2joxA5+m6vgj18QCbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729052197; c=relaxed/simple;
	bh=yukfN/ZCUI8w67J+9BSDAj02fAIZcK3PJadJXWyhObs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjrR4h3SdutaikW6/wwElEa1MS4kuBl0BA85aukK9D6TLJCWDh1szyxcOrEY6RdguBfpBOaQGRfjgYaY6WbPUH97G87kqfJf7Cyt6iBIxzQKvPcsoVvqc6rE8wQqhcmkLaSOqcZDPc7+qfh3uVxG57JDc8K8aZzQZLCTOlRoZ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkbDZS3J; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkbDZS3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729052196; x=1760588196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yukfN/ZCUI8w67J+9BSDAj02fAIZcK3PJadJXWyhObs=;
  b=XkbDZS3JLGbFe5MNbHOoTZ01tkToJm9VJDPG1dZYxtzLDhf9acGI/Uft
   7+3/CSF3I7RsZQP1Z+TT53cBUMrs0IRnM5sKeTOha7XY1LiUeeT6eJ7xq
   rxDdYOCiJLXU9Ly1Ff1/hSGNIzlved55CVDivddIhEYxlsqB6HIMGaZpF
   tbyJsAWlOch96TdEjTu0DHpbrianXcZLikuPmet+hzk9ai0vL9KF89H3f
   oLehfYz08c6IaRv5WuO0ixKYHu3EUy/2u32qiOJgV/WeWYCtWY6JNSKGR
   fwYi2xr8Mvgh2PiKVrgSKz5d+XZYVxJrCEL6xl0S/AHA9EanDpArG+Mke
   w==;
X-CSE-ConnectionGUID: TFl9GGsuSI2EvJ4FFVpRzA==
X-CSE-MsgGUID: Xb2w0BYqRp23jPly1Bfu1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32173955"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32173955"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 21:16:35 -0700
X-CSE-ConnectionGUID: pa5scYHvRkG216YIchzbWg==
X-CSE-MsgGUID: z6ePPxEJQfW5OokfjShRdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="83180176"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Oct 2024 21:16:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0vSY-000KGs-2I;
	Wed, 16 Oct 2024 04:16:30 +0000
Date: Wed, 16 Oct 2024 12:16:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mukesh Ojha <quic_mojha@quicinc.com>
Subject: Re: [PATCH v2] remoteproc: Add a new remoteproc state RPROC_DEFUNCT
Message-ID: <202410161111.ZSy2XQxP-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-003-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161111.ZSy2XQxP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161111.ZSy2XQxP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161111.ZSy2XQxP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/remoteproc_core.c:1843:18: warning: comparison between pointer and integer ('int (*)(struct rproc *, const struct firmware *)' and 'int') [-Wpointer-integer-compare]
    1843 |         if (rproc_start == RPROC_DEFUNCT || rproc->state != RPROC_CRASHED)
         |             ~~~~~~~~~~~ ^  ~~~~~~~~~~~~~
   1 warning generated.


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
