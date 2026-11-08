Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794114844;
	b=oVK4JjaExwL2HBLRvENG82WYoZzsVLccawn3eC0gxRlJY+C0d58dQPq8X6OAem281zcm
	 RKkJokJoiR5L5RAnDHMOpn3AY77fhLyUY47pstxR4j/Yk3ZVYSKXsKkmWkr2itgEv8KM0
	 5nd6Bw6ie6/Sy2uKK3IM1+lv4zBQn+ZBOrVWVBJLwEwVo3TCJMQ5BLhZ6FHsyO4/P0Ptw
	 bXSfvsi9w4FzovyLANRPrjiyeZMPbxbgD9Tbsp+jbqtcj2QR7HRcspQRJowIXg87567hs
	 LEtTyPBLXA/G+F2akd7RoBJtE+MCwiaJ26hYy9C+6nkGNP51orz415sEBKCsOxSQHMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794114844;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=G/htg+82caSvwQpCes/2upHgSspm1kzDs/D3FDHUNhY=;
	b=OorCJ5ZTVhFMekGPLgTw1Zjp8xtVpyVLy138NfSjEdhpKZwPyC2EJWp3mij7aubjcTCo
	 1Qqm45n8QkrwpAiROx+R7lGwGaR4QGUmfi94ZQ7SjoPKC+jVYaedoBPc37ZUE3M/H/aSO
	 tn5jaj7hO55ED/YXVT7hnUhDorXa3DOxHTuxRbKjXZKbzxzyUuxA8DA4onGMY7aHaG22h
	 IUjNadVpTuAYAAMyG/28ZSQY+yswyQlR2xBdBqXjQDVfXlQV62PwXhS17UW8FAXf8Kuld
	 mPvhhTXcDpNYz3adTMx8DOuD24taMcJ9YzxHgspm58SEcqPC0Uaz6Nl8H0aNn2HWOOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B+xTJ6hw;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C9A606A31C;
	Sun,  8 Nov 2026 05:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C9A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B+xTJ6hw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794114842; x=1825650842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OTaUFugVRZP1qC2U/0ALiQEKDrcWIcToCzjWAKgP0xU=;
  b=B+xTJ6hwVMgl5Gh68CTpZ77m3OlcNbqmR5Pt2Li/xF9XqjpCtBr9UHOw
   sXpj1bgqGL53R+wVIh4fAxX+g52Yp6EwbREmNruYwcrIhVsyOe3LBqssH
   FiVEOMFmsLdlWNdciEVTrxvVcMu8hAE2DLQpsIHd+Za/BC/iyuwWCHmf9
   X2KIZmTuMQkBihgtrUlUxKmpQAPWo3gdaovolkFJr/Q3LsedozICi4dLW
   Xx7hHRbHArfHSnc/pdhogsZ1JjSqXMqhjU9BlWCyj69rDofrkU4ntmEte
   c7viF2u212fMLPTRF8YvuC/zpW4u50WldHEr49EyriaAfHGqEN5RXqLP3
   g==;
X-CSE-ConnectionGUID: ZT21aEKsSoW5C8EZTGDDPw==
X-CSE-MsgGUID: GWwS8b2bQHeybsz2gZ/+Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2878161"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2878161"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 21:14:02 -0800
X-CSE-ConnectionGUID: 6o0RgvbdS+6kv99plMYIKA==
X-CSE-MsgGUID: llm9UCwsTei6Q0DQQz3frQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7423691"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2026 21:13:58 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPvE3-00000000s7z-185F;
	Sun, 08 Nov 2026 05:13:55 +0000
Date: Sun, 8 Nov 2026 13:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Michals <tcmichals@gmail.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: Re: [PATCH v3 7/7] remoteproc: sunxi: Add KUnit tests
Message-ID: <202611081239.zlQqllPm-lkp@intel.com>
References: <20261101185735.762559-8-tcmichals@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101185735.762559-8-tcmichals@gmail.com>

Hi Tim,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c]

url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Michals/dt-bindings-mailbox-Add-Allwinner-A523-message-box/20261101-125729
base:   7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
patch link:    https://lore.kernel.org/r/20261101185735.762559-8-tcmichals%40gmail.com
patch subject: [PATCH v3 7/7] remoteproc: sunxi: Add KUnit tests
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20261108/202611081239.zlQqllPm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081239.zlQqllPm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081239.zlQqllPm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/kunit/device.h:16,
                    from drivers/remoteproc/sunxi_rproc_kunit.c:29:
   drivers/remoteproc/sunxi_rproc_kunit.c: In function 'expect_powered_off':
>> drivers/remoteproc/sunxi_rproc_kunit.c:962:64: error: 'struct dev_pm_info' has no member named 'usage_count'
     962 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 0);
         |                                                                ^
   include/kunit/test.h:840:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:962:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     962 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 0);
         |         ^~~~~~~~~~~~~~~
>> drivers/remoteproc/sunxi_rproc_kunit.c:962:64: error: 'struct dev_pm_info' has no member named 'usage_count'
     962 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 0);
         |                                                                ^
   include/kunit/test.h:840:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:962:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     962 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 0);
         |         ^~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c: In function 'test_prepare_unprepare_order':
   drivers/remoteproc/sunxi_rproc_kunit.c:977:64: error: 'struct dev_pm_info' has no member named 'usage_count'
     977 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 1);
         |                                                                ^
   include/kunit/test.h:840:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:977:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     977 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 1);
         |         ^~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:977:64: error: 'struct dev_pm_info' has no member named 'usage_count'
     977 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 1);
         |                                                                ^
   include/kunit/test.h:840:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:977:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     977 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 1);
         |         ^~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c: In function 'test_prepare_power_up_failure':
   drivers/remoteproc/sunxi_rproc_kunit.c:1107:54: error: 'struct dev_pm_info' has no member named 'usage_count'
    1107 |         KUNIT_EXPECT_EQ(test, atomic_read(&dev->power.usage_count), 0);
         |                                                      ^
   include/kunit/test.h:840:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:1107:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
    1107 |         KUNIT_EXPECT_EQ(test, atomic_read(&dev->power.usage_count), 0);
         |         ^~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:1107:54: error: 'struct dev_pm_info' has no member named 'usage_count'
    1107 |         KUNIT_EXPECT_EQ(test, atomic_read(&dev->power.usage_count), 0);
         |                                                      ^
   include/kunit/test.h:840:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:1107:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
    1107 |         KUNIT_EXPECT_EQ(test, atomic_read(&dev->power.usage_count), 0);
         |         ^~~~~~~~~~~~~~~


vim +962 drivers/remoteproc/sunxi_rproc_kunit.c

   949	
   950	/* Everything as before prepare(): resets asserted, clocks off, no PM reference */
   951	static void expect_powered_off(struct kunit *test, struct test_context *ctx,
   952				       struct mock_providers *mp, bool core_held)
   953	{
   954		int i;
   955	
   956		KUNIT_EXPECT_TRUE(test, mp->asserted[RST_CFG]);
   957		KUNIT_EXPECT_TRUE(test, mp->asserted[RST_SRAM]);
   958		KUNIT_EXPECT_TRUE(test, mp->asserted[RST_DEBUG]);
   959		KUNIT_EXPECT_EQ(test, mp->asserted[RST_CORE], core_held);
   960		for (i = 0; i < NR_CLK; i++)
   961			KUNIT_EXPECT_FALSE_MSG(test, clk_hw_is_prepared(&mp->clk[i].hw), "clock %d", i);
 > 962		KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 0);
   963	}
   964	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
