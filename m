Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4451937CD2C;
	Wed, 22 Apr 2026 16:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873961; cv=none; b=rtH2soKL/iALrB90KUfF1Bq72BElCiMASzwMyOiiDIMF6SgBgC/eyUnn8fldKGhQhwXYTKG7N/1P1NbYpjm8Oq5/TKaZS2YaFRVTTOxBOLxNShWUIiTykpIPbASL6+BrB+7eb0cWD+ksA0wjBlTKADlQOQ2pz7xXoiGfXuZOJzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873961; c=relaxed/simple;
	bh=FIFMpgh5KHh6qY4H0igmU8Wcr/cAC/pG0NcCWuR42l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqudRqXvKFzUhT6pJntZyrgeW27sWVeFw7J7RfBH/2/YtLLfZEs2nIT+cLLfXjbFTg2BaKekJtgJIDlh2nz+j0Y+ZtBi1HU/WyJIl5e2Wi0QTgZGlcOi2NOgbEQsVUoMR9UDaetTNNw0+NPz9NW5Daga85ezZY6zH/ZHJ+mdsHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKQtmCbl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKQtmCbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776873958; x=1808409958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FIFMpgh5KHh6qY4H0igmU8Wcr/cAC/pG0NcCWuR42l0=;
  b=OKQtmCblQ51prZBaoj/MPb6rH0hSBi+EzupgkZ/c5CAIK/ZrVcj7Qnv3
   vpw564uSfQUl6oZJxsD9AcywFv3nT0Qjc+705JstDqOPIBlWHnT7OrsUQ
   co2f4j3uT9P6S9OTktp8e/L+u86IcelySYunNoHFyJze/JEThxSNxXUAU
   dyPWAvglzKIiSGFzwIJ3SD9cX/V/5kivxdM1q5ttCr3UwqjIxzncrunnG
   BSp0QhbOh/cVbFH0kooc9Ldy3l40LabcQcJwPnfE8fnTQz3IVnoeuu02u
   7QTPj1ijQZxzYbi4Q80FFjesU5rbW5CQNIT+oiapawoC0T2MSLEIqg3rD
   Q==;
X-CSE-ConnectionGUID: cd4FMMVUSRexTT3NyomVtA==
X-CSE-MsgGUID: arh+R4pPQT6jtv1tpx0Ptw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77712370"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="77712370"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:05:58 -0700
X-CSE-ConnectionGUID: oy+mPHVVQwWF04sXEcIGbw==
X-CSE-MsgGUID: ql4EL3KWQhaJS0RBNMGV7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="232253338"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Apr 2026 09:05:56 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFa5J-000000000nF-2HeD;
	Wed, 22 Apr 2026 16:05:53 +0000
Date: Thu, 23 Apr 2026 00:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: Yuho Choi <dbgh9129@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yuho Choi <dbgh9129@gmail.com>
Subject: Re: [PATCH v1] rpmsg: char: fix use-after-free on probe error path
Message-ID: <202604222350.v3J2LzRi-lkp@intel.com>
References: <20260416042338.10146-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416042338.10146-1-dbgh9129@gmail.com>

Hi Yuho,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rpmsg-next]
[also build test WARNING on linus/master v7.0 next-20260422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuho-Choi/rpmsg-char-fix-use-after-free-on-probe-error-path/20260421-073128
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
patch link:    https://lore.kernel.org/r/20260416042338.10146-1-dbgh9129%40gmail.com
patch subject: [PATCH v1] rpmsg: char: fix use-after-free on probe error path
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260422/202604222350.v3J2LzRi-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604222350.v3J2LzRi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604222350.v3J2LzRi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/compiler.h:372,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/kobject.h:19,
                    from include/linux/cdev.h:5,
                    from drivers/rpmsg/rpmsg_char.c:17:
>> arch/alpha/include/asm/rwonce.h:23:9: warning: '__READ_ONCE' redefined
      23 | #define __READ_ONCE(x)                                                  \
         |         ^~~~~~~~~~~
   In file included from drivers/rpmsg/rpmsg_char.c:14:
   include/asm-generic/rwonce.h:44:9: note: this is the location of the previous definition
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |         ^~~~~~~~~~~


vim +/__READ_ONCE +23 arch/alpha/include/asm/rwonce.h

d6462858851549c Will Deacon 2019-10-30  11  
d6462858851549c Will Deacon 2019-10-30  12  /*
d6462858851549c Will Deacon 2019-10-30  13   * Alpha is apparently daft enough to reorder address-dependent loads
d6462858851549c Will Deacon 2019-10-30  14   * on some CPU implementations. Knock some common sense into it with
d6462858851549c Will Deacon 2019-10-30  15   * a memory barrier in READ_ONCE().
d6462858851549c Will Deacon 2019-10-30  16   *
d6462858851549c Will Deacon 2019-10-30  17   * For the curious, more information about this unusual reordering is
d6462858851549c Will Deacon 2019-10-30  18   * available in chapter 15 of the "perfbook":
d6462858851549c Will Deacon 2019-10-30  19   *
d6462858851549c Will Deacon 2019-10-30  20   *  https://kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html
d6462858851549c Will Deacon 2019-10-30  21   *
d6462858851549c Will Deacon 2019-10-30  22   */
d6462858851549c Will Deacon 2019-10-30 @23  #define __READ_ONCE(x)							\
d6462858851549c Will Deacon 2019-10-30  24  ({									\
d6462858851549c Will Deacon 2019-10-30  25  	__unqual_scalar_typeof(x) __x =					\
d6462858851549c Will Deacon 2019-10-30  26  		(*(volatile typeof(__x) *)(&(x)));			\
d6462858851549c Will Deacon 2019-10-30  27  	mb();								\
d6462858851549c Will Deacon 2019-10-30  28  	(typeof(x))__x;							\
d6462858851549c Will Deacon 2019-10-30  29  })
d6462858851549c Will Deacon 2019-10-30  30  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
