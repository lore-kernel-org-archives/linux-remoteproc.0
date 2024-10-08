Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E727718C93F;
	Tue,  8 Oct 2024 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728381354; cv=none; b=SAxS0+CV7cV3ydkadAXqRcO6xyYrxuymH8WOvnrwU+Gpc1owJD5xITgBAqJCRa0REEiBV6JkTI0i6fbf62H2BHu0dRAgsgVQTfPtIOuEEKyqobhN7qb/J9VTedKRCLtERGxRX3s3C3fFakN5EWA7YUVMvlLcyPqtNg2KGBVm07E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728381354; c=relaxed/simple;
	bh=LvfAntT0wXbH5X1IhTvf7CykMVcP9BvX/yjWZiYGSvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLuMONcHUSAjOgHC+gr+ZfPmi1lCFF+2sLDYR/NKjx3p7Qgco+T4psadlwAJ4IxXAJAJ6nEHi0ZlAtwbM4Dmzjl3DVBIc49k9r4Zjenw9A+iEhxVuOm1u5uOi83bXQMH/3rCqTeTxqIfklz92RFzMKydrJ46KKGeakhYjTpXN6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL4Mg+6O; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL4Mg+6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728381353; x=1759917353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LvfAntT0wXbH5X1IhTvf7CykMVcP9BvX/yjWZiYGSvg=;
  b=TL4Mg+6OUYq8LnHqNeOtJ4ly71487k8WiJL0iQRr2e68kZQj204i9ivr
   TXdOaW8DFATF3yExta+jifaZd6NPDoqAH/dDLygwUE2FnUlm5ezpugMcM
   jGE8/2IbdrYfAy5MdcCz7LzIY33cdGn1xzQKr5kv52knGXWSkMizPFY/x
   jSK2heF/duEEqKm+ybe3tG0lj81FGeW1bIzpUDleFJf5L1GW697JexTyG
   yGwEnR08QLWQ5k4xyDwmsoL9R3LWYccUBT3Z82cIJ0VdkEWgju11+uiYZ
   rMnPIdrIksW7mAHFxtPSWWekKh26Khnv/D9Iv/Naer5YA2WUs6FZB95vk
   A==;
X-CSE-ConnectionGUID: NNPncPgNS+Og83fDvy9ZTA==
X-CSE-MsgGUID: UiIgue69T6aRKRPqcX164g==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27442860"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="27442860"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 02:55:52 -0700
X-CSE-ConnectionGUID: Aq0MOba5SQyEs6fMt25THw==
X-CSE-MsgGUID: 1A0DACjuQ1yLc+P0ti9lQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="75755815"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Oct 2024 02:55:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy6wU-0006Du-2F;
	Tue, 08 Oct 2024 09:55:46 +0000
Date: Tue, 8 Oct 2024 17:55:00 +0800
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
Subject: Re: [PATCH v10 7/7] remoteproc: stm32: Add support of an OP-TEE TA
 to load the firmware
Message-ID: <202410081704.Zo2k0SZQ-lkp@intel.com>
References: <20241007131620.2090104-8-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007131620.2090104-8-arnaud.pouliquen@foss.st.com>

Hi Arnaud,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20241007-212358
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241007131620.2090104-8-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v10 7/7] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
config: parisc-randconfig-001-20241008 (https://download.01.org/0day-ci/archive/20241008/202410081704.Zo2k0SZQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081704.Zo2k0SZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081704.Zo2k0SZQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_load_fw':
>> (.text+0xa8): undefined reference to `tee_shm_register_kernel_buf'
>> hppa-linux-ld: (.text+0x160): undefined reference to `tee_client_invoke_func'
>> hppa-linux-ld: (.text+0x178): undefined reference to `tee_shm_free'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_register':
>> (.text+0x2f4): undefined reference to `tee_client_open_session'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_unregister':
>> (.text+0x3d4): undefined reference to `tee_client_close_session'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_probe':
>> (.text+0x478): undefined reference to `tee_client_open_context'
>> hppa-linux-ld: (.text+0x4f8): undefined reference to `tee_client_close_context'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_remove':
   (.text+0x558): undefined reference to `tee_client_close_session'
   hppa-linux-ld: (.text+0x59c): undefined reference to `tee_client_close_context'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_start':
>> (.text+0x68c): undefined reference to `tee_client_invoke_func'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_stop':
   (.text+0x7c8): undefined reference to `tee_client_invoke_func'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_get_loaded_rsc_table':
   (.text+0x92c): undefined reference to `tee_client_invoke_func'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_release_fw':
   (.text+0xb18): undefined reference to `tee_client_invoke_func'
>> hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o:(.data+0x8): undefined reference to `tee_bus_type'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REMOTEPROC_TEE
   Depends on [n]: REMOTEPROC [=y] && OPTEE [=n]
   Selected by [y]:
   - STM32_RPROC [=y] && (ARCH_STM32 || COMPILE_TEST [=y]) && REMOTEPROC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
