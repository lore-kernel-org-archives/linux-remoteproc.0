Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB30C3101B2;
	Thu,  5 Mar 2026 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772694708; cv=none; b=s1IlQM8OApo1vatRxQuCkiBA6UCc0gXbOm/SwoPlUfb/r0GQc5YobgkJEGvebKpatzYH0+TqeReoPRHh7KxXW78ixVCkR4QC4kF2HoxQmnFZ0zjNpFoJ7yOwXnK8qh6cDfdRV4uvvrr4oUULEnmfcJpiuK2MkOTk2U4VO6TqZx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772694708; c=relaxed/simple;
	bh=mh7TqYGtwyz8BNhFD30DS+eTl5ENs1RwMsa8SpKQyfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUDYgFHmt8YkxTDbx4bXeyN6+lI2Tph772MBw48lW59GUROYQUtIpCdbbs6nzEoy+iqVOTpjkqkyMB7ypJWOUPkvGcZmbTHl+9JUFCPFQgx/ay3hpYL2JFvVLqVKGIFtc4+HfJ+3ulpQvYT3A9RR1zWaNLXsdu8dlFuvft9xIY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjcfWv0L; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjcfWv0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772694707; x=1804230707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mh7TqYGtwyz8BNhFD30DS+eTl5ENs1RwMsa8SpKQyfA=;
  b=QjcfWv0L8UzoMjC9zl2GmwGsLypqTWpedVkMe4DdWTWg4Qu5CqAQawAg
   0Hew030BZEEDf5paPV7Bqc36JvDw8mRhXoxa6Fb0E6Uqhv6EAnHotmxNU
   0FrbTcGY87qhTR7kxZKMlKSbQE8Fdg62QrUSynVyLP1h/7M1go0EwwRze
   rp13Tsx40ouXHbrRe/reU4oasN4ddG9DBfwUHtXjBpG0b188428FxtbYz
   uQaC18XBqFQ54RlWt1IUZOhlgMjFTLlKWTb9P7+9eJJgFJnF0FVe5qIfs
   5qk2s+RMbSXVy6oWI+45yGstrzyqVM9tdZRmHBjs9hJdcEYj3uW1+vOxk
   Q==;
X-CSE-ConnectionGUID: tOyStoCbT0aS9ZOgm8iNkA==
X-CSE-MsgGUID: TxLf4fUlSamGMeckgXYsiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73687281"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73687281"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 23:11:47 -0800
X-CSE-ConnectionGUID: 4I7EZlacT7CX44ivW2zzbA==
X-CSE-MsgGUID: tDPbyxNBSTmeAN8d90KA2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="241600936"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 23:11:41 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy2rz-000000001y1-2aM6;
	Thu, 05 Mar 2026 07:11:39 +0000
Date: Thu, 5 Mar 2026 08:11:29 +0100
From: kernel test robot <lkp@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: oe-kbuild-all@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v9 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <202603050819.478UbJ2l-lkp@intel.com>
References: <20260304211808.1437846-2-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304211808.1437846-2-shenwei.wang@nxp.com>

Hi Shenwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on remoteproc/rproc-next robh/for-next next-20260304]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/docs-driver-api-gpio-rpmsg-gpio-driver-over-rpmsg-bus/20260305-052440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260304211808.1437846-2-shenwei.wang%40nxp.com
patch subject: [PATCH v9 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050819.478UbJ2l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050819.478UbJ2l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .. code-block:: none
   +-----+-----+-----+-----+-----+----+
   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
   | 1   | 2   |port |line | err | dir|
   +-----+-----+-----+-----+-----+----+ [docutils]
>> Documentation/driver-api/gpio/gpio-rpmsg.rst:115: WARNING: Title underline too short.


vim +115 Documentation/driver-api/gpio/gpio-rpmsg.rst

   112	
   113	
   114	GET_VALUE (Cmd=4)
 > 115	~~~~~~~~~~~~~~~~
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
