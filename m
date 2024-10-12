Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0CC282F4;
	Sat, 12 Oct 2024 15:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728748453; cv=none; b=Eo4dJAg7KO3KMI5d3z1exzYYTT9/+3itPTI9KOtd55aflOJqceS9woriS2Ae0892qBafh03Xl4E6VUVFKrvg7fT7NkG7WInaL9Rp/5kdYEaAVcVaoaGdt4CYG2dYWqabNRNDMCuVTC0BZpuZ6r2SEOxUCGNr0C3Li4+YnitalBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728748453; c=relaxed/simple;
	bh=/xFDZcInBNyx3eprUGQX66jP+aFDV4sLoV0PFfDSzE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2Ck6FkmGjfawSqQXcpK3XYWEuevdQfLZH+GV4VJzYmj599ndeFSFXyUiiPMuI50j5JlKf/cco8axhEs2ZcVYmgnrSh98zdSaUVPXPVPzUe3a0rYZdXjjzhZ885bUvh3k7vsSe+PxiwZ4GZGqwrHDGxKzpkSBvq6/H/UNu84wEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jS+BECPX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jS+BECPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728748452; x=1760284452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/xFDZcInBNyx3eprUGQX66jP+aFDV4sLoV0PFfDSzE8=;
  b=jS+BECPXjTXcpCLOwNgDm9c6etndAX09bjXCfoVgy0RNr8tEsD9BL177
   VJnIJTlB4SKVhAlLXeltrGhwARO5SONOT7OzYbQgWhTK7KeVHBFj7pRRD
   NsnyuaRvFyptPKBnHAJIBMFsXaYOSooLXWiVxFmSn6lMT88K7muk6u5an
   PmbBjoptnrXyvZkvAHnT5fmjjtwuMCECvA2RxT5qGGlnEaSNIdEuBIMfh
   c5RRkbTjnQvM3NzRfCVH+323dAq4VUhBbSOg9FHEr6bfdub6dfi++76GL
   GAA4cwzYXZs+KSaSnH3vQ/HMVjNB2szJGxFbm0MOK2pKqUQnhWmxyfs7H
   g==;
X-CSE-ConnectionGUID: CS2Sln/kRySX40SxKyTxsg==
X-CSE-MsgGUID: y3ySkZGuTdGzyY6ubVA/PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31016497"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31016497"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 08:54:11 -0700
X-CSE-ConnectionGUID: XJoT6DYaSx2ZhvHRDDVN2A==
X-CSE-MsgGUID: hi0fRxUkT9aYvCiN1D5MRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="81997792"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Oct 2024 08:54:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szeRR-000DUV-33;
	Sat, 12 Oct 2024 15:54:05 +0000
Date: Sat, 12 Oct 2024 23:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Weinberger <richard@nod.at>, linux-remoteproc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	mathieu.poirier@linaro.org, andersson@kernel.org,
	upstream+rproc@sigma-star.at, Richard Weinberger <richard@nod.at>,
	ohad@wizery.com, s-anna@ti.com, t-kristo@ti.com
Subject: Re: [PATCH] rpmsg_ns: Work around TI non-standard message
Message-ID: <202410122348.irTWFe4S-lkp@intel.com>
References: <20241011123922.23135-1-richard@nod.at>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011123922.23135-1-richard@nod.at>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rpmsg-next]
[also build test WARNING on linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Weinberger/rpmsg_ns-Work-around-TI-non-standard-message/20241011-204122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
patch link:    https://lore.kernel.org/r/20241011123922.23135-1-richard%40nod.at
patch subject: [PATCH] rpmsg_ns: Work around TI non-standard message
config: x86_64-randconfig-121-20241012 (https://download.01.org/0day-ci/archive/20241012/202410122348.irTWFe4S-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410122348.irTWFe4S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410122348.irTWFe4S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/rpmsg/rpmsg_ns.c:55:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __rpmsg32 [assigned] [usertype] ns_addr @@     got unsigned int [usertype] addr @@
   drivers/rpmsg/rpmsg_ns.c:55:25: sparse:     expected restricted __rpmsg32 [assigned] [usertype] ns_addr
   drivers/rpmsg/rpmsg_ns.c:55:25: sparse:     got unsigned int [usertype] addr
>> drivers/rpmsg/rpmsg_ns.c:56:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __rpmsg32 [assigned] [usertype] ns_flags @@     got unsigned int [usertype] flags @@
   drivers/rpmsg/rpmsg_ns.c:56:26: sparse:     expected restricted __rpmsg32 [assigned] [usertype] ns_flags
   drivers/rpmsg/rpmsg_ns.c:56:26: sparse:     got unsigned int [usertype] flags

vim +55 drivers/rpmsg/rpmsg_ns.c

    45	
    46		if (len == sizeof(struct rpmsg_ns_msg)) {
    47			struct rpmsg_ns_msg *msg = data;
    48	
    49			ns_addr = msg->addr;
    50			ns_flags = msg->flags;
    51			ns_name = msg->name;
    52		} else if (len == sizeof(struct __rpmsg_ns_msg_ti)) {
    53			struct __rpmsg_ns_msg_ti *msg = data;
    54	
  > 55			ns_addr = msg->addr;
  > 56			ns_flags = msg->flags;
    57			ns_name = msg->name;
    58			dev_warn(dev, "non-standard ns msg found\n");
    59		} else {
    60			dev_err(dev, "malformed ns msg (%d)\n", len);
    61			return -EINVAL;
    62		}
    63	
    64		/* don't trust the remote processor for null terminating the name */
    65		ns_name[RPMSG_NAME_SIZE - 1] = '\0';
    66	
    67		strscpy_pad(chinfo.name, ns_name, sizeof(chinfo.name));
    68		chinfo.src = RPMSG_ADDR_ANY;
    69		chinfo.dst = rpmsg32_to_cpu(rpdev, ns_addr);
    70	
    71		dev_info(dev, "%sing channel %s addr 0x%x\n",
    72			 rpmsg32_to_cpu(rpdev, ns_flags) & RPMSG_NS_DESTROY ?
    73			 "destroy" : "creat", ns_name, chinfo.dst);
    74	
    75		if (rpmsg32_to_cpu(rpdev, ns_flags) & RPMSG_NS_DESTROY) {
    76			ret = rpmsg_release_channel(rpdev, &chinfo);
    77			if (ret)
    78				dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
    79		} else {
    80			newch = rpmsg_create_channel(rpdev, &chinfo);
    81			if (!newch)
    82				dev_err(dev, "rpmsg_create_channel failed\n");
    83		}
    84	
    85		return 0;
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
