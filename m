Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E404207D;
	Sat, 31 Aug 2024 16:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725122658; cv=none; b=F9Oczz1kimHFYJsCrf7md4OgkBVgzyyf/WfXxsZhk3KCZjosTpATKYS4FEJn6KtOcufsss+KABiFLpZGBXX7XNWHGEzS/4SnQe0AVCR/Ckr/o5FSjICAtzXnAsTJbutof6/QIucBT/w41LfZ+huuqMxAF+gL2xYg1aWY7akyE2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725122658; c=relaxed/simple;
	bh=YmIADE+iPJs58r7hopfHHRVRQ4cz6BqTPPb+fJDDqC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5eI5SMgbxttZXFa4m5pvRTX8WcvOMMLPeZyjvzjq0m0Ld67oCQKWPav6FwuKVL55u7ukUwjQxCvqmcSs2uEMnDoIX/+rmRvBn6fXobbRNpBDTHruEwyA8lUC3LLMxnvN833UVGMpJXvunED4JaaRk2VxfuQ3gFUcIGGYNXfgxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFhNdAY9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFhNdAY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725122657; x=1756658657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YmIADE+iPJs58r7hopfHHRVRQ4cz6BqTPPb+fJDDqC4=;
  b=DFhNdAY9j+O3pYHXLadc+Em9IotUj6e0Nd6XxycEa81sXUEy6HuA6cXJ
   Hd3uLY0xa3kmuKjNRU6TX1UvaDpCw5lR/jXESJ7URdfhuH50wMGoxpK4t
   Zpj3Ctcy1NxnDucOf+yIavLp8/P1vw84heSN+73elYZyxjW4ZNj740Phm
   wftUUKTKpjhMVlMTgTMeU8E1EPy29XIFQXKRd6HNwWsJaxTlkR8CdQTEA
   aHRYxIOlaEaZoeiMa4FR75CZvFCxRqlQfMxuCK5RPZCCyIcO0jqaFd3Pp
   70aE8GPFCxrJPlW+eFDaqfuIqr575LsPiIyPtLoUnzj33794lt5aIgy2X
   w==;
X-CSE-ConnectionGUID: rlfS7OaQTiuUrBrIawQzJQ==
X-CSE-MsgGUID: z9qcEoHjTI2mD2lpl+3Biw==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23266286"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23266286"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 09:44:16 -0700
X-CSE-ConnectionGUID: NKiGrgHAS6eiFuXtuCCbIA==
X-CSE-MsgGUID: tyuEdc0PQwGkbWoJvl9aOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64537095"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Aug 2024 09:44:13 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skRCs-0002wK-2l;
	Sat, 31 Aug 2024 16:44:10 +0000
Date: Sun, 1 Sep 2024 00:43:31 +0800
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
Subject: Re: [PATCH v9 4/7] remoteproc: core: Add TEE interface support for
 firmware release
Message-ID: <202409010034.Tln3soEY-lkp@intel.com>
References: <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>

Hi Arnaud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5be63fc19fcaa4c236b307420483578a56986a37]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20240830-175609
base:   5be63fc19fcaa4c236b307420483578a56986a37
patch link:    https://lore.kernel.org/r/20240830095147.3538047-5-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v9 4/7] remoteproc: core: Add TEE interface support for firmware release
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240901/202409010034.Tln3soEY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010034.Tln3soEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010034.Tln3soEY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/remoteproc/remoteproc_core.c:32:
>> include/linux/remoteproc_tee.h:52:12: warning: 'tee_rproc_parse_fw' defined but not used [-Wunused-function]
      52 | static int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
         |            ^~~~~~~~~~~~~~~~~~


vim +/tee_rproc_parse_fw +52 include/linux/remoteproc_tee.h

498143a453d14e Arnaud Pouliquen 2024-08-30  51  
498143a453d14e Arnaud Pouliquen 2024-08-30 @52  static int tee_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
498143a453d14e Arnaud Pouliquen 2024-08-30  53  {
498143a453d14e Arnaud Pouliquen 2024-08-30  54  	/* This shouldn't be possible */
498143a453d14e Arnaud Pouliquen 2024-08-30  55  	WARN_ON(1);
498143a453d14e Arnaud Pouliquen 2024-08-30  56  
498143a453d14e Arnaud Pouliquen 2024-08-30  57  	return 0;
498143a453d14e Arnaud Pouliquen 2024-08-30  58  }
498143a453d14e Arnaud Pouliquen 2024-08-30  59  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
