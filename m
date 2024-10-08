Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2441212644;
	Tue,  8 Oct 2024 18:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412088; cv=none; b=tORR9As0GAndcLb9kW+2L+qfB/VdrmjGQv06Xb9K79c882YgfgDWMcwPb7PxkDgxHY5J5g1FXGVxs6HKH0401bfzTzkGJCZzjVNPXzp+aPDlv01bO8tlid84G+fv8SORGJdXFRScXfBk9rPlD+7ierN9E11ML2ehFFzLD3N1Wu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412088; c=relaxed/simple;
	bh=xlYFgGi0wb7POCCV6CbKHjLYkCkFi7yoTDhc9WV7/JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7zI6mKLArOpOdAf4StsxLBBDBCkvYPISdEw0JaH0YJydyTJqZtRU5tzLO8fTrmSFu9I3FtCC8QOdgtCVSwnbh9Nc27dliwbjA/ZCpjA2iH1rhq4XvAv8OSVM6vSPVwIKTk8hzYeW7gVow3IkNmpaXUD4+mV/GxTqWfOkviF24A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUrVBYF/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUrVBYF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728412087; x=1759948087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xlYFgGi0wb7POCCV6CbKHjLYkCkFi7yoTDhc9WV7/JI=;
  b=fUrVBYF/jEZeH+ngh7hW3m6gvsGXPzjngQheC10YNzTrQGIBKMTNahfo
   5tlh50CKfQadxpYsVhx2zJkq5B0Psx4OFYA6XYRuL2nzUod6Z+yTRwf4t
   MOudCYQ6YU2Wg29ArIciSxggy/0llM3Z2Q6PE/HlTp6YX5o+5Dja3uZ73
   xVn1iKRPG1ZQXolsw1BsydlHGh+nFpLCIAdkiR6rhX1jtLguAdk+9spr4
   JSCmA90pT+quOaXryYDJYODQajOEFe1xMtSObOrOAMdGycbYvudWYZGPw
   KVQqBy278qap9IX8Vm1+rve5u3lwEDK+W4Fa3qHyKTWy5RV08TQG4b1hT
   w==;
X-CSE-ConnectionGUID: KrQ5cjgZSweqyOSRFQDRYw==
X-CSE-MsgGUID: vx4+EKWlTkeIbljfjzKNbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38233042"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="38233042"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 11:28:06 -0700
X-CSE-ConnectionGUID: niWdaALuTIqI+ypDhf6wHA==
X-CSE-MsgGUID: mKZwdRX2QBCUtwJ+k70tYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="76194737"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Oct 2024 11:28:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syEwC-0008FI-2N;
	Tue, 08 Oct 2024 18:28:00 +0000
Date: Wed, 9 Oct 2024 02:27:51 +0800
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
Message-ID: <202410090225.d3bZaaqk-lkp@intel.com>
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
config: arm-randconfig-r054-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090225.d3bZaaqk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090225.d3bZaaqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090225.d3bZaaqk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: tee_client_invoke_func
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_release_fw) in archive vmlinux.a
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_load_fw) in archive vmlinux.a
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_parse_fw) in archive vmlinux.a
   >>> referenced 3 more times
--
>> ld.lld: error: undefined symbol: tee_shm_register_kernel_buf
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_load_fw) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tee_shm_free
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_load_fw) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tee_client_open_session
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_register) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tee_client_close_session
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_unregister) in archive vmlinux.a
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_remove) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tee_client_open_context
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tee_client_close_context
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_probe) in archive vmlinux.a
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_remove) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tee_bus_type
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_fw_driver) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REMOTEPROC_TEE
   Depends on [n]: REMOTEPROC [=y] && OPTEE [=n]
   Selected by [y]:
   - STM32_RPROC [=y] && (ARCH_STM32 [=n] || COMPILE_TEST [=y]) && REMOTEPROC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
