Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9821F27A441;
	Thu,  8 May 2025 18:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729455; cv=none; b=OOZuJFc4LT0C43GTRFrIOMMdC73z1MgKPN6oRDf6vKzzVFip1Te/sAAy1JtmY0VzrXYqFAXiLGU5B1n1HEsi/u0efKVjTdWNiAeN+kHyIbqdw2gnJRqkSXHVMH525KD6KKX7NlaamA/PFLz/YSizjmQedpF9MzqWdrlt8dKkUvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729455; c=relaxed/simple;
	bh=GSuc35WTKIW6mLi3m17zcCwP27KFa6TYCm4bbpgZpPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSr7+4p4K7bHkzLJ3xTS0W4xchTSSypxEecVq9cEiQo3BtfhHLRcLtaF4ZUf8cQ+AzO6aPGYuYjKeubucGmzGeECHIKvAERFiFAmejwU3KRgwQGRpMEIUl1zfvYF1VZ5SHeBby8nay+jStn7WHh3JLB/Aui4lv3DQPYtKRijPEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHyOnToX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHyOnToX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746729454; x=1778265454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GSuc35WTKIW6mLi3m17zcCwP27KFa6TYCm4bbpgZpPI=;
  b=FHyOnToXU4NyehrCDyaYVcXTtZC7XIPlxQdj7LnLTYRTcu6beCvgqXfK
   WPmHUeNDpPtOEbJ3FR4gESXSj2xmtSxRZ53pAArSS70dCmK1rTrIhHf8k
   eitLWY7xIwRsKE7mhu+ZCN2kk8LlqS1Yu+6rYX701uqFEHSw8iO7SpQT3
   65cil8iN7bN/Ok0aaO2MAKjXj4oz0lCRc6lmDqfFvqvtytHzJ6MqIXpb+
   7zDI8/7SL5F/4yDrupX5pzeXoCqlGVAopNffMCw8RFh12u9FnnwUU1XYb
   vLmEmKRrYil+Vv5TnfGSUcO6SOv6T8DuUkR8Dc6ZIHJDEf5HoetqGX9kw
   A==;
X-CSE-ConnectionGUID: mp8ZOAivSY69I5YbTpB3UA==
X-CSE-MsgGUID: dadwvnCHTRaz7cz6ol6Ahg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="65949370"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="65949370"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:37:33 -0700
X-CSE-ConnectionGUID: uv4Y3IJBTPC4FtOKn6Staw==
X-CSE-MsgGUID: cKEZ55OTQeumHfm/UdTNBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="159678630"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 May 2025 11:37:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD67d-000BGV-13;
	Thu, 08 May 2025 18:37:29 +0000
Date: Fri, 9 May 2025 02:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dawei Li <dawei.li@linux.dev>, andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: Re: [PATCH 2/3] rpmsg: char: Implement eptdev based on anon inode
Message-ID: <202505090243.edAOs4uG-lkp@intel.com>
References: <20250507141712.4276-3-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507141712.4276-3-dawei.li@linux.dev>

Hi Dawei,

kernel test robot noticed the following build errors:

[auto build test ERROR on 92a09c47464d040866cf2b4cd052bc60555185fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Dawei-Li/rpmsg-char-Reuse-eptdev-logic-for-anon-device/20250507-223209
base:   92a09c47464d040866cf2b4cd052bc60555185fb
patch link:    https://lore.kernel.org/r/20250507141712.4276-3-dawei.li%40linux.dev
patch subject: [PATCH 2/3] rpmsg: char: Implement eptdev based on anon inode
config: x86_64-randconfig-r052-20250508 (https://download.01.org/0day-ci/archive/20250509/202505090243.edAOs4uG-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090243.edAOs4uG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090243.edAOs4uG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/rpmsg/rpmsg_ctrl.c:28:
>> drivers/rpmsg/rpmsg_char.h:54:1: error: expected identifier or '('
      54 | {
         | ^
   1 error generated.


vim +54 drivers/rpmsg/rpmsg_char.h

    51	
    52	static inline int rpmsg_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
    53					      struct rpmsg_channel_info chinfo, int *pfd);
  > 54	{
    55		return -ENXIO;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
