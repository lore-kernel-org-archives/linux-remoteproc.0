Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97FA175A6F;
	Wed, 18 Mar 2026 04:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773808167; cv=none; b=DHJsrlRphTkOxnW2cKW3XvTerNfkVuB+vBD889MB93Gb3dL7OyzB6Al2gRebJsDo6rDapbS6/Zv+3PwHAd/AehZL42S1g2U/nW8IN/rCZvKeg3LtUweAcWtnx00u7mQD8cCzRLEajIH2NAZLWRIq89TmcSMOQ0wGb2Ek4lhGVWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773808167; c=relaxed/simple;
	bh=xENssHMqtmDUd6ddNYFgzzYECQYmei62l+2VFyCPV3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXnsp8tpJqOvmhjslxv+9casWSf4mbc08wMeQYZ35a2izPdlxHrgBW195GVay/0/33A0cAYijckN2Ko1ir0ZmCKT5wKQnBWW7selxLPUvz1dWia+HxCBgdlVCr3q6HIrGzvZTMVKeR0jSXr9NUYHei10VD7HDbRJaXRq4pS6DY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceJsvMo9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceJsvMo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773808166; x=1805344166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xENssHMqtmDUd6ddNYFgzzYECQYmei62l+2VFyCPV3A=;
  b=ceJsvMo9Bn7LsAWY/t/i8DWYEqn+yq+bbiM+uJfem0QAPhCAP8rgoBPJ
   OUucvqHx1/NknB5gU1/3UPmy3Z87XbPdDDY1cINpkSnQook6dC5QwPee1
   h96vGVwJDZ/z76YDGMfTdx8QcCbWenBm+90IEyNYyCPX6l2ZLme05+mE3
   SBJxtHe5ndLCaCuJW/YWIBK0YVYwv8ahaZYLlKeNN+/IdA6snpmeq5YSP
   dTdsjOBiRjy3+k7vHy716CI6ztCRpecqJ3nJOPuIfsv9cgDI+akMvgSKN
   uwzQFERo72e4T2wUVS+hsCFSNnMaXc4fZQybcI0G0iveTs2YvEY7JLJ0/
   g==;
X-CSE-ConnectionGUID: HOEnM3IxQkCXVPsnWGDkOg==
X-CSE-MsgGUID: jj6RTgNMSzSUaWHM/1XqUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74741677"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74741677"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 21:29:26 -0700
X-CSE-ConnectionGUID: QUSrzIFwQvefJ9yBlkVeRg==
X-CSE-MsgGUID: TuiNnyVXTFem3CT5ugEnAw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2026 21:29:23 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2iX3-000000002Vh-1EPe;
	Wed, 18 Mar 2026 04:29:21 +0000
Date: Wed, 18 Mar 2026 12:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: Anas Iqbal <mohd.abd.6602@gmail.com>, andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Anas Iqbal <mohd.abd.6602@gmail.com>
Subject: Re: [PATCH] remoteproc: use SIZE_MAX in rproc_u64_fit_in_size_t()
Message-ID: <202603181241.MTvrVLVa-lkp@intel.com>
References: <20260314110137.178981-1-mohd.abd.6602@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314110137.178981-1-mohd.abd.6602@gmail.com>

Hi Anas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on linus/master v7.0-rc4 next-20260317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anas-Iqbal/remoteproc-use-SIZE_MAX-in-rproc_u64_fit_in_size_t/20260315-042913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20260314110137.178981-1-mohd.abd.6602%40gmail.com
patch subject: [PATCH] remoteproc: use SIZE_MAX in rproc_u64_fit_in_size_t()
config: arm64-randconfig-r072-20260317 (https://download.01.org/0day-ci/archive/20260318/202603181241.MTvrVLVa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181241.MTvrVLVa-lkp@intel.com/

smatch warnings:
drivers/remoteproc/remoteproc_internal.h:221 rproc_u64_fit_in_size_t() warn: always true condition '(val <= (~0)) => (0-u64max <= u64max)'

vim +221 drivers/remoteproc/remoteproc_internal.h

   214	
   215	static inline
   216	bool rproc_u64_fit_in_size_t(u64 val)
   217	{
   218		if (sizeof(size_t) == sizeof(u64))
   219			return true;
   220	
 > 221		return val <= SIZE_MAX;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
